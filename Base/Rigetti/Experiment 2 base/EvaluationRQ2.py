import os
os.environ["CUDA_DEVICE_ORDER"]="PCI_BUS_ID";
os.environ["CUDA_VISIBLE_DEVICES"]="0"; 

import urllib.request
import pandas as pd
import numpy as np
import time
import ktrain
from ktrain import tabular
from sklearn.model_selection import train_test_split
from tqdm import *
pd.set_option('display.max_columns', None)

from benchmark_circuits import *
import random
import pandas as pd
from tqdm import *
import pkgutil
import warnings
import exrex
import math
import time
import json
import scipy.stats as stats
from sklearn.metrics import mean_absolute_error
import matplotlib.pyplot as plt
import seaborn as sns
from collections import defaultdict
from statsmodels.stats.gof import chisquare
import multiprocessing
warnings.filterwarnings('ignore')

class NpEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, np.integer):
            return int(obj)
        if isinstance(obj, np.floating):
            return float(obj)
        if isinstance(obj, np.ndarray):
            return obj.tolist()
        return super(NpEncoder, self).default(obj)

# In[2]:


load_circuits()


# # Select CUTs

# In[3]:


backends = [('9q-square', 9)]
BaselineCircuits,CUTs = train_test_split(get_all_circuits(),train_size=0.2,random_state=13)
BaselineCircuits,CUTs


# # Define QuCAT Oracles

# In[27]:


import rpy2.robjects as robjects
r = robjects.r
r['source']('chisquare.R')

def Uof(observed,expected):
    if len(observed.keys())<1:
        return "F"
    for k in observed.keys():
        if k not in expected.keys():
            return "F"
    return "P"
    
def Wodf(observed,expected):
    test = robjects.globalenv['chisquare']
    try:
        if len(observed)==1 and len(expected)==1:
            return "P"
        
        obs = []
        exp = []
        expected = dict(sorted(expected.items(), key=lambda item: item[0]))
        observed = dict(sorted(observed.items(), key=lambda item: item[0]))
        for k in set(observed.keys()).intersection(expected.keys()):
            obs.append(observed[k])
            exp.append(expected[k])
        
        for k in set(expected.keys()).difference(observed.keys()):
            exp.append(expected[k])
        
        if len(obs)<len(exp):
#             epsilon = 1024-sum(obs)
#             try:
#                 epsilon = epsilon/(len(exp)-len(obs))
#             except:
#                 epsilon = 0
            obs.extend([0 for t in range(len(exp)-len(obs))])
        
        #obs = [int(o*100) for o in obs]
        
        df_result_r = test(robjects.FloatVector(obs),robjects.FloatVector(exp))
        p = np.array(df_result_r)[0]
        #print("expected_o:",expected)
        #print("observed_o:",observed)
        #print("expected:",exp)
        #print("observed:",obs)
        #print("p-value",p)
        if p<0.01:
            return "F"
        else:
            return "P"
    except Exception as e:
        print(e)
        return "F"
    
def convertNaQp2QuCAT_notation(output,value="prob"):
    program_specification = {}
    for x in output["probability"]:
        program_specification[x["bin"]] = x[value]
    return program_specification

def filter_output(output,model,count=True):
    prediction_output = {}
    for state in output["probability"]:
        all_other_probs = sum([x["prob"] for x in output["probability"] if x["bin"]!=state["bin"]])
        odr = state["odds"]
        pos = state["prob"]
        pof = 1-pos
        df = pd.DataFrame([[pof,odr,pos]],columns=["POF","ODR","POS"])
        prediction = model.predict(df)[0][0]
        prediction_output[state["bin"]] = [state["count"],prediction]
        
    filtered_output = {}
    # clamp output to 0 and 1
    for k in prediction_output.keys():
        if prediction_output[k][1]>1:
            if np.abs(prediction_output[k][1]-1)<0.2:
                prediction_output[k][1] = min(prediction_output[k][1],1) 
                filtered_output[k] = prediction_output[k]
            else:
                if prediction_output[k][1]>2:
                    prediction_output[k][1] = prediction_output[k][1]%1
                    filtered_output[k] = prediction_output[k]
                
        elif prediction_output[k][1]<0:
            prediction_output[k][1] = 0.0
            filtered_output[k] = prediction_output[k]
        else:
            filtered_output[k] = prediction_output[k]

    # check for irrelevent values
    if len(filtered_output.keys())>2:
        temp = {}
        maxvalue = max([filtered_output[k][0] for k in filtered_output.keys()])
        for k in filtered_output.keys():
            if (filtered_output[k][0]/maxvalue)>=0.35:
                temp[k] = filtered_output[k]
        filtered_output =  temp
    
    temp1 = {}
    total = sum([filtered_output[k][0] for k in filtered_output.keys()])
    for k in filtered_output.keys():
        if count:
            temp1[k] = int(filtered_output[k][1]*1024)#int(filtered_output[k][1]*total)
        else:
            temp1[k] = filtered_output[k][1]
    filtered_output =  temp1
        
            
    return filtered_output,prediction_output

def filter_output2(outputs,model,count=True):
    df = pd.DataFrame(columns=["POF","ODR","POS","INP"])
    for inp in outputs.keys():
        output = outputs[inp]
        for state in output["probability"]:
            all_other_probs = sum([x["prob"] for x in output["probability"] if x["bin"]!=state["bin"]])
            odr = state["odds"]
            pos = state["prob"]
            pof = 1-pos
            df = df.append({"POF":pof,"POS":pos,"ODR":odr,"INP":inp},ignore_index=True)
    
    Prediction = model.predict(df[["POF","ODR","POS"]])
    total_prediction_outputs = {}
    for inp in outputs.keys():
        output = outputs[inp]
        inp_prediction = Prediction[df[df["INP"]==inp].index]
        prediction_output = {}
        for state,prediction in zip(output["probability"],inp_prediction):
            prediction_output[state["bin"]] = [state["count"],prediction[0]]
        #total_prediction_outputs[inp] = prediction_output
    
        filtered_output = {}
        # clamp output to 0 and 1
        for k in prediction_output.keys():
            if prediction_output[k][1]>1:
                if np.abs(prediction_output[k][1]-1)<0.2:
                    prediction_output[k][1] = min(prediction_output[k][1],1) 
                    filtered_output[k] = prediction_output[k]
                else:
                    if prediction_output[k][1]>2:
                        prediction_output[k][1] = prediction_output[k][1]%1
                        filtered_output[k] = prediction_output[k]

            elif prediction_output[k][1]<0:
                prediction_output[k][1] = 0.0
                filtered_output[k] = prediction_output[k]
            else:
                filtered_output[k] = prediction_output[k]

        # check for irrelevent values
        if len(filtered_output.keys())>2:
            temp = {}
            maxvalue = max([filtered_output[k][0] for k in filtered_output.keys()])
            for k in filtered_output.keys():
                if (filtered_output[k][0]/maxvalue)>=0.35:
                    temp[k] = filtered_output[k]
            filtered_output =  temp

        temp1 = {}
        total = sum([filtered_output[k][0] for k in filtered_output.keys()])
        for k in filtered_output.keys():
            if count:
                temp1[k] = int(filtered_output[k][1]*1024)#int(filtered_output[k][1]*total)
            else:
                temp1[k] = filtered_output[k][1]
        filtered_output =  temp1
        
        total_prediction_outputs[inp] = (filtered_output,prediction_output)
        
    return total_prediction_outputs



def default_inner_template():
    return {"uof":[],"uof_w":[],"wodf":[],"wodf_w":[]}




# # Evaluate filter QuCAT

# In[31]:


# def process(proc):
#     RQ2C = {}
#     backend_factory = BackendFactory()
#     backend = backend_factory.initialize_backend()
#     bk,_ = proc
#     backend_result = []
#     for cut in tqdm(CUTs):
#         predictor = ktrain.load_predictor('tunning_models/{}_{}'.format(bk,cut))
#         algo = get_circuit_class_object(cut)
#         total_inputs = 0
#         original_score = 0
#         mutant1_score = 0
#         mutant2_score = 0
#         mutant3_score = 0
#         inps = algo.get_full_inputs()
#         PS_data = algo.get_result(backend,inps)
#         ndata = open("./generated_data/{}_P{}.json".format(bk,algo.key_aurguments["ID"]),"r")
#         Noise_data = json.load(ndata)
#         ndata.close()
#         mdata = open("./generated_data/{}_P{}_M1.json".format(bk,algo.key_aurguments["ID"]),"r")
#         mutant1_inp = json.load(mdata)
#         mdata.close()
#         mdata = open("./generated_data/{}_P{}_M2.json".format(bk,algo.key_aurguments["ID"]),"r")
#         mutant2_inp = json.load(mdata)
#         mdata.close()
#         mdata = open("./generated_data/{}_P{}_M3.json".format(bk,algo.key_aurguments["ID"]),"r")
#         mutant3_inp = json.load(mdata)
#         mdata.close()
        
#         ideal_noise_predicitons = filter_output2(Noise_data,predictor,False)
#         mutant1_noise_predicitons = filter_output2(mutant1_inp,predictor,False)
#         mutant2_noise_predicitons = filter_output2(mutant2_inp,predictor,False)
#         mutant3_noise_predicitons = filter_output2(mutant3_inp,predictor,False)
#         for inp in inps:

#             total_inputs+=1

#             ps = PS_data[inp]
#             #ps_noise = Noise_data[inp]
#             ps = convertNaQp2QuCAT_notation(ps,value='prob')

#             ps_noise, _prediction =  ideal_noise_predicitons[inp]

#             result = Uof(ps_noise,ps)
#             #print("Uof ps_noise,ps = ",result)
#             if result=="P":
#                 result = Wodf(ps_noise,ps)
#                 #print("Wodf ps_noise,ps = ",result)
#                 if result=="F":
#                     original_score+=1
#             else:
#                 original_score+=1

#             # mutant 1:
#             #mutant1 = get_circuit_class_object_mutation(cut+"_M1")
#             #mutant_output = mutant1_inp[inp]
#             mutant_output, _prediction =  mutant1_noise_predicitons[inp]
#             #mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
#             result = Uof(mutant_output,ps)
#             #print("Uof mutant1,ps = ",result)
#             if result=="P":
#                 result = Wodf(mutant_output,ps)
#                 #print("Wodf mutant,ps = ",result)
#                 if result=="F":
#                     mutant1_score+=1
#             else:
#                 mutant1_score+=1

#             # mutant 2:
#             #mutant2 = get_circuit_class_object_mutation(cut+"_M2")
#             #mutant_output = mutant2_inp[inp]
#             mutant_output, _prediction =  mutant2_noise_predicitons[inp]
#             #mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
#             result = Uof(mutant_output,ps)
#             #print("Uof mutant1,ps = ",result)
#             if result=="P":
#                 result = Wodf(mutant_output,ps)
#                 #print("Wodf mutant,ps = ",result)
#                 if result=="F":
#                     mutant2_score+=1
#             else:
#                 mutant2_score+=1

#             # mutant 1:
#             #mutant3 = get_circuit_class_object_mutation(cut+"_M3")
#             #mutant_output = mutant3_inp[inp]
#             mutant_output, _prediction =  mutant3_noise_predicitons[inp]
#             #mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
#             result = Uof(mutant_output,ps)
#             #print("Uof mutant1,ps = ",result)
#             if result=="P":
#                 result = Wodf(mutant_output,ps)
#                 #print("Wodf mutant,ps = ",result)
#                 if result=="F":
#                     mutant3_score+=1
#             else:
#                 mutant3_score+=1

#         original_score = (original_score/total_inputs)*100
#         mutant1_score = (mutant1_score/total_inputs)*100
#         mutant2_score = (mutant2_score/total_inputs)*100
#         mutant3_score = (mutant3_score/total_inputs)*100

#         backend_result.append({cut:{"original_score":original_score,"mutant1_score":mutant1_score,
#                          "mutant2_score":mutant2_score,
#                          "mutant3_score":mutant3_score}})

        
#         file = open("results/data2/{}_{}.json".format(bk,cut),"w")
#         json.dump(backend_result,file)
#         file.close()
        
        
        
RQ2C = {}
backend_factory = BackendFactory()
backend = backend_factory.initialize_backend()
for bk,_ in tqdm(backends):
    backend_result = []
    
    for cut in tqdm(CUTs):
        predictor = ktrain.load_predictor('tunning_models/{}_{}'.format(bk,cut))
        algo = get_circuit_class_object(cut)
        total_inputs = 0
        original_score = 0
        mutant1_score = 0
        mutant2_score = 0
        mutant3_score = 0
        inps = algo.get_full_inputs()
        PS_data = algo.get_result(backend,inps)
        ndata = open("./generated_data/{}_P{}.json".format(bk,algo.key_aurguments["ID"]),"r")
        Noise_data = json.load(ndata)
        ndata.close()
        mdata = open("./generated_data/{}_P{}_M1.json".format(bk,algo.key_aurguments["ID"]),"r")
        mutant1_inp = json.load(mdata)
        mdata.close()
        mdata = open("./generated_data/{}_P{}_M2.json".format(bk,algo.key_aurguments["ID"]),"r")
        mutant2_inp = json.load(mdata)
        mdata.close()
        mdata = open("./generated_data/{}_P{}_M3.json".format(bk,algo.key_aurguments["ID"]),"r")
        mutant3_inp = json.load(mdata)
        mdata.close()
        
        ideal_noise_predicitons = filter_output2(Noise_data,predictor,False)
        mutant1_noise_predicitons = filter_output2(mutant1_inp,predictor,False)
        mutant2_noise_predicitons = filter_output2(mutant2_inp,predictor,False)
        mutant3_noise_predicitons = filter_output2(mutant3_inp,predictor,False)
        for inp in inps:

            total_inputs+=1

            ps = PS_data[inp]
            #ps_noise = Noise_data[inp]
            ps = convertNaQp2QuCAT_notation(ps,value='prob')

            ps_noise, _prediction =  ideal_noise_predicitons[inp]

            result = Uof(ps_noise,ps)
            #print("Uof ps_noise,ps = ",result)
            if result=="P":
                result = Wodf(ps_noise,ps)
                #print("Wodf ps_noise,ps = ",result)
                if result=="F":
                    original_score+=1
            else:
                original_score+=1

            # mutant 1:
            #mutant1 = get_circuit_class_object_mutation(cut+"_M1")
            #mutant_output = mutant1_inp[inp]
            mutant_output, _prediction =  mutant1_noise_predicitons[inp]
            #mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
            result = Uof(mutant_output,ps)
            #print("Uof mutant1,ps = ",result)
            if result=="P":
                result = Wodf(mutant_output,ps)
                #print("Wodf mutant,ps = ",result)
                if result=="F":
                    mutant1_score+=1
            else:
                mutant1_score+=1

            # mutant 2:
            #mutant2 = get_circuit_class_object_mutation(cut+"_M2")
            #mutant_output = mutant2_inp[inp]
            mutant_output, _prediction =  mutant2_noise_predicitons[inp]
            #mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
            result = Uof(mutant_output,ps)
            #print("Uof mutant1,ps = ",result)
            if result=="P":
                result = Wodf(mutant_output,ps)
                #print("Wodf mutant,ps = ",result)
                if result=="F":
                    mutant2_score+=1
            else:
                mutant2_score+=1

            # mutant 1:
            #mutant3 = get_circuit_class_object_mutation(cut+"_M3")
            #mutant_output = mutant3_inp[inp]
            mutant_output, _prediction =  mutant3_noise_predicitons[inp]
            #mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
            result = Uof(mutant_output,ps)
            #print("Uof mutant1,ps = ",result)
            if result=="P":
                result = Wodf(mutant_output,ps)
                #print("Wodf mutant,ps = ",result)
                if result=="F":
                    mutant3_score+=1
            else:
                mutant3_score+=1

        original_score = (original_score/total_inputs)*100
        mutant1_score = (mutant1_score/total_inputs)*100
        mutant2_score = (mutant2_score/total_inputs)*100
        mutant3_score = (mutant3_score/total_inputs)*100

        backend_result.append({cut:{"original_score":original_score,"mutant1_score":mutant1_score,
                         "mutant2_score":mutant2_score,
                         "mutant3_score":mutant3_score}})

    RQ2C[bk] = backend_result
        
with open("results/RQ2C.json","w") as file:
    json.dump(RQ2C,file,cls=NpEncoder)      
        
# # for proc in tqdm(backends):
# #     p1 = multiprocessing.Process(target=process, args=(proc, ))
# #     p1.start()
# #     p1.join()
# #     time.sleep(10)
# for proc in tqdm(backends):
#     process(proc)