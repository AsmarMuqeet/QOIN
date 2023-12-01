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

# # Select CUTs

# In[2]:


backends = [('rainbow', 23), ('weber', 53)]
BaselineCircuits,CUTs = train_test_split(get_all_circuits(),train_size=0.4,random_state=13)


# # Define QuCAT Oracles

# In[3]:


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
#         print("expected_o:",expected)
#         print("observed_o:",observed)
#         print("expected:",exp)
#         print("observed:",obs)
#         print("p-value",p)
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
        prediction = predictor.predict(df)[0][0]
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
#     if len(filtered_output.keys())>2:
#         temp = {}
#         maxvalue = max([filtered_output[k][0] for k in filtered_output.keys()])
#         for k in filtered_output.keys():
#             if (filtered_output[k][0]/maxvalue)>=0.35:
#                 temp[k] = filtered_output[k]
#         filtered_output =  temp
    
    temp1 = {}
    total = sum([filtered_output[k][0] for k in filtered_output.keys()])
    for k in filtered_output.keys():
        if filtered_output[k][1]==0:
            continue
        if count:
            temp1[k] = int(filtered_output[k][1]*1024)#int(filtered_output[k][1]*total)
        else:
            temp1[k] = filtered_output[k][1]
    filtered_output =  temp1
        
            
    return filtered_output,prediction_output


def filter_output_all(outputs,model,count=True):
    results = []
    for output in outputs:
        prediction_output = {}
        df = pd.DataFrame(columns=["POF","ODR","POS"])
        for state in output["probability"]:
            all_other_probs = sum([x["prob"] for x in output["probability"] if x["bin"]!=state["bin"]])
            odr = state["odds"]
            pos = state["prob"]
            pof = 1-pos
            df = df.append({"POF":pof,"ODR":odr,"POS":pos},ignore_index=True)
        
        predictions = predictor.predict(df)
        
        for state,prediction in zip(output["probability"],predictions):
            prediction_output[state["bin"]] = [state["count"],prediction[0]]
        
        #print(predictions,prediction_output)
        
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

    
        temp1 = {}
        total = sum([filtered_output[k][0] for k in filtered_output.keys()])
        for k in filtered_output.keys():
            if filtered_output[k][1]==0:
                continue
            if count:
                temp1[k] = int(filtered_output[k][1]*1024)#int(filtered_output[k][1]*total)
            else:
                temp1[k] = filtered_output[k][1]
        filtered_output =  temp1
        
        results.append((filtered_output,prediction_output))
    
    return results


def default_inner_template():
    return {"uof":[],"uof_w":[],"wodf":[],"wodf_w":[]}


# In[4]:


backend_factory = BackendFactory()
backend = backend_factory.initialize_backend()
backend_executors = {}
for bk,_ in tqdm(backends):
    backend_executors[bk] = backend_factory.initialize_backend(name=bk)


# # Evaluate Noise QuCAT

# In[5]:


RQ2A = {}

for bk,_ in tqdm(backends):
    backend_noise = backend_executors[bk]
    backend_result = []

    for cut in CUTs:
        #print(cut)
        algo = get_circuit_class_object(cut)
        total_inputs = 0
        original_score = 0
        mutant1_score = 0
        mutant2_score = 0
        mutant3_score = 0
        for inp in algo.get_full_inputs():

            total_inputs+=1

            ps = algo.get_result(backend,inp)
            ps_noise = algo.get_result(backend_noise,inp)
            ps = convertNaQp2QuCAT_notation(ps,value='prob')
            ps_noise = convertNaQp2QuCAT_notation(ps_noise,value='count')
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
            mutant1 = get_circuit_class_object_mutation(cut+"_M1")
            mutant_output = mutant1.get_result(backend_noise,inp)
            mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
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
            mutant2 = get_circuit_class_object_mutation(cut+"_M2")
            mutant_output = mutant2.get_result(backend_noise,inp)
            mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
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
            mutant3 = get_circuit_class_object_mutation(cut+"_M3")
            mutant_output = mutant3.get_result(backend_noise,inp)
            mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
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
        
        #print(original_score,mutant1_score)
        #break
    RQ2A[bk] = backend_result

file = open("results/RQ2A.json","w")
json.dump(RQ2A,file,cls=NpEncoder)
file.close()


# In[6]:


RQ2B = {}

for bk,_ in tqdm(backends):
    backend_noise = backend_executors[bk]
    backend_result = []

    for cut in CUTs:
        #print(cut)
        algo = get_circuit_class_object(cut)
        total_inputs = 0
        original_score = 0
        mutant1_score = 0
        mutant2_score = 0
        mutant3_score = 0
        for inp in algo.get_full_inputs():

            total_inputs+=1

            ps = algo.get_result(backend,inp)
            ps_count = algo.get_result(backend,inp)
            ps = convertNaQp2QuCAT_notation(ps,value='prob')
            ps_count = convertNaQp2QuCAT_notation(ps_count,value='count')
            result = Uof(ps_count,ps)
            #print("Uof ps_noise,ps = ",result)
            if result=="P":
                result = Wodf(ps_count,ps)
                #print("Wodf ps_noise,ps = ",result)
                if result=="F":
                    original_score+=1
            else:
                original_score+=1

            # mutant 1:
            mutant1 = get_circuit_class_object_mutation(cut+"_M1")
            mutant_output = mutant1.get_result(backend,inp)
            mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
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
            mutant2 = get_circuit_class_object_mutation(cut+"_M2")
            mutant_output = mutant2.get_result(backend,inp)
            mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
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
            mutant3 = get_circuit_class_object_mutation(cut+"_M3")
            mutant_output = mutant3.get_result(backend,inp)
            mutant_output = convertNaQp2QuCAT_notation(mutant_output,value='count')
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
        
        #print(original_score,mutant1_score)
        #break
    RQ2B[bk] = backend_result

file = open("results/RQ2B.json","w")
json.dump(RQ2B,file,cls=NpEncoder)
file.close()


# # Evaluate filter QuCAT

# In[7]:


RQ2C = {}

for bk,_ in tqdm(backends):
    backend_noise = backend_executors[bk]
    backend_result = []

    for cut in CUTs:
        #if cut!="phase":
        #    continue
        predictor = ktrain.load_predictor('tunning_models/{}_{}'.format(bk,cut))
        algo = get_circuit_class_object(cut)
        total_inputs = 0
        original_score = 0
        mutant1_score = 0
        mutant2_score = 0
        mutant3_score = 0
        for inp in algo.get_inputs():

            total_inputs+=1

            ps = algo.get_result(backend,inp)
            ps_noise = algo.get_result(backend_noise,inp)
            ps = convertNaQp2QuCAT_notation(ps,value='prob')
            
            ps_noise, _prediction =  filter_output(ps_noise,predictor,False)
            
            #print(ps,ps_noise,_prediction)
            

            result = Uof(ps_noise,ps)
            #print("Uof ps_noise,ps = ",result)
            if result=="P":
                result = Wodf(ps_noise,ps)
                #print("Wodf ps_noise,ps = ",result)
                if result=="F":
                    original_score+=1
            else:
                original_score+=1
                #print("original_score ",original_score)
                #input(inp)

            # mutant 1:
            mutant1 = get_circuit_class_object_mutation(cut+"_M1")
            mutant_output = mutant1.get_result(backend_noise,inp)
            mutant_output, _prediction =  filter_output(mutant_output,predictor,False)
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
            mutant2 = get_circuit_class_object_mutation(cut+"_M2")
            mutant_output = mutant2.get_result(backend_noise,inp)
            mutant_output, _prediction =  filter_output(mutant_output,predictor,False)
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
            mutant3 = get_circuit_class_object_mutation(cut+"_M3")
            mutant_output = mutant3.get_result(backend_noise,inp)
            mutant_output, _prediction =  filter_output(mutant_output,predictor,False)
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
        
        #print(original_score,mutant1_score)
        #break
    RQ2C[bk] = backend_result

    file = open("results/RQ2C.json","w")
    json.dump(RQ2C,file,cls=NpEncoder)
    file.close()
    
    #break


# In[ ]:




