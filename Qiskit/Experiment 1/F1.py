#!/usr/bin/env python
# coding: utf-8

# In[1]:


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
from sklearn.metrics import precision_recall_fscore_support
warnings.filterwarnings('ignore')


# # Select CUTs

# In[2]:


backends = [('FakeAlmaden', 20), ('FakeBoeblingen', 20), ('FakeBrooklyn', 65), ('FakeCairo', 27), ('FakeCambridge', 28), ('FakeCambridgeAlternativeBasis', 28), ('FakeCasablanca', 7), ('FakeGuadalupe', 16), ('FakeHanoi', 27), ('FakeJakarta', 7), ('FakeJohannesburg', 20), ('FakeKolkata', 27), ('FakeLagos', 7), ('FakeManhattan', 65), ('FakeMontreal', 27), ('FakeMumbai', 27), ('FakeNairobi', 7), ('FakeParis', 27), ('FakeRochester', 53), ('FakeSingapore', 20), ('FakeSydney', 27), ('FakeToronto', 27), ('FakeWashington', 127)]
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
            obs.extend([0 for t in range(len(exp)-len(obs))])
        
        
        df_result_r = test(robjects.FloatVector(obs),robjects.FloatVector(exp))
        p = np.array(df_result_r)[0]
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


def oracle(predicted,groundtruth):
    result = Uof(predicted,groundtruth)
    if result=="P":
        result = Wodf(predicted,groundtruth)
        if result=="P":
            return 1
        else:
            return 0
    else:
        return 0
    
def perf_measure(y_actual, y_hat):
    TP = 0
    FP = 0
    TN = 0
    FN = 0

    for i in range(len(y_hat)): 
        if y_actual[i]==y_hat[i]==1:
            TP += 1
        if y_hat[i]==1 and y_actual[i]!=y_hat[i]:
            FP += 1
        if y_actual[i]==y_hat[i]==0:
            TN += 1
        if y_hat[i]==0 and y_actual[i]!=y_hat[i]:
            FN += 1

    return(TP, FP, TN, FN)


# In[2]:


backend_factory = BackendFactory()
backend = backend_factory.initialize_backend()
backend_executors = {}
for bk,_ in tqdm(backends):
    backend_executors[bk] = backend_factory.initialize_backend(name=bk)


# In[ ]:


groundTruth = []
predicted = []
for bk,_ in tqdm(backends):
    backend_noise = backend_executors[bk]
    backend_result = []
    for cut in CUTs:
        algo = get_circuit_class_object(cut)
        for inp in algo.get_full_inputs():
            ps = algo.get_result(backend,inp)
            ps_noise = algo.get_result(backend_noise,inp)
            ps = convertNaQp2QuCAT_notation(ps,value='prob')
            ps_noise = convertNaQp2QuCAT_notation(ps_noise,value='count')
            
            groundTruth.append(oracle(ps,ps))
            predicted.append(oracle(ps_noise,ps))
            
            mutant = get_circuit_class_object_mutation(cut+"_M1")
            mutantps = mutant.get_result(backend,inp) 
            
            ps_noise = mutant.get_result(backend_noise,inp)
            mutantps = convertNaQp2QuCAT_notation(mutantps,value='prob')
            ps_noise = convertNaQp2QuCAT_notation(ps_noise,value='count')
            
            groundTruth.append(oracle(mutantps,ps))
            predicted.append(oracle(ps_noise,ps))
            
            mutant = get_circuit_class_object_mutation(cut+"_M2")
            mutantps = mutant.get_result(backend,inp) 
            
            ps_noise = mutant.get_result(backend_noise,inp)
            mutantps = convertNaQp2QuCAT_notation(mutantps,value='prob')
            ps_noise = convertNaQp2QuCAT_notation(ps_noise,value='count')
            
            groundTruth.append(oracle(mutantps,ps))
            predicted.append(oracle(ps_noise,ps))
            
            mutant = get_circuit_class_object_mutation(cut+"_M3")
            mutantps = mutant.get_result(backend,inp) 
            
            ps_noise = mutant.get_result(backend_noise,inp)
            mutantps = convertNaQp2QuCAT_notation(mutantps,value='prob')
            ps_noise = convertNaQp2QuCAT_notation(ps_noise,value='count')
            
            groundTruth.append(oracle(mutantps,ps))
            predicted.append(oracle(ps_noise,ps))
        #break
    #break
    
TP,FP,TN,FN = perf_measure(groundTruth,predicted)
precision,recall,f1,_ = precision_recall_fscore_support(groundTruth,predicted,average="binary")
with open("results/F1_noise.json","w") as file:
    json.dump({"ground":groundTruth,"predicted":predicted},file)


# In[ ]:


print("Noise")
print("TP = {}, FP = {}, FN = {}, P = {}, R = {}, F1 = {}".format(TP,FP,FN,precision,recall,f1))


# In[ ]:


groundTruth = []
predicted = []
for bk,_ in tqdm(backends):
    backend_noise = backend_executors[bk]
    backend_result = []
    for cut in CUTs:
        predictor = ktrain.load_predictor('tunning_models/{}_{}'.format(bk,cut))
        algo = get_circuit_class_object(cut)
        for inp in algo.get_full_inputs():
            ps = algo.get_result(backend,inp)
            ps_noise = algo.get_result(backend_noise,inp)
            ps_noise, _prediction =  filter_output(ps_noise,predictor,False)
            ps = convertNaQp2QuCAT_notation(ps,value='prob')
            
            groundTruth.append(oracle(ps,ps))
            predicted.append(oracle(ps_noise,ps))
            
            mutant = get_circuit_class_object_mutation(cut+"_M1")
            mutantps = mutant.get_result(backend,inp) 
            
            ps_noise = mutant.get_result(backend_noise,inp)
            ps_noise, _prediction =  filter_output(ps_noise,predictor,False)
            mutantps = convertNaQp2QuCAT_notation(mutantps,value='prob')
            
            
            groundTruth.append(oracle(mutantps,ps))
            predicted.append(oracle(ps_noise,ps))
            
            mutant = get_circuit_class_object_mutation(cut+"_M2")
            mutantps = mutant.get_result(backend,inp) 
            
            ps_noise = mutant.get_result(backend_noise,inp)
            mutantps = convertNaQp2QuCAT_notation(mutantps,value='prob')
            ps_noise, _prediction =  filter_output(ps_noise,predictor,False)
            
            groundTruth.append(oracle(mutantps,ps))
            predicted.append(oracle(ps_noise,ps))
            
            mutant = get_circuit_class_object_mutation(cut+"_M3")
            mutantps = mutant.get_result(backend,inp)
            
            ps_noise = mutant.get_result(backend_noise,inp)
            mutantps = convertNaQp2QuCAT_notation(mutantps,value='prob')
            ps_noise, _prediction =  filter_output(ps_noise,predictor,False)
            
            groundTruth.append(oracle(mutantps,ps))
            predicted.append(oracle(ps_noise,ps))
        #break
    #break
    
TP,FP,TN,FN = perf_measure(groundTruth,predicted)
precision,recall,f1,_ = precision_recall_fscore_support(groundTruth,predicted,average="binary")
with open("results/F1_filtered.json","w") as file:
    json.dump({"ground":groundTruth,"predicted":predicted},file)


# In[ ]:


print("Filter")
print("TP = {}, FP = {}, FN = {}, P = {}, R = {}, F1 = {}".format(TP,FP,FN,precision,recall,f1))


# In[ ]:




