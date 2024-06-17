#!/usr/bin/env python
# coding: utf-8

# In[1]:


#get_ipython().run_line_magic('reload_ext', 'autoreload')
#get_ipython().run_line_magic('autoreload', '2')
#get_ipython().run_line_magic('matplotlib', 'inline')
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
#pd.set_option('display.max_rows', None)

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
from fsdict.flightcryptofiledict import FileDict
import pickle
import multiprocessing
import time
warnings.filterwarnings('ignore')


# # Results From Paper Metrics

# In[2]:


import forest.benchmarking.distance_measures as dm
from scipy.spatial.distance import jensenshannon as jhn
def HellingerDistance(p, q):
    n = len(p)
    sum_ = 0.0
    for i in range(n):
        sum_ += (np.sqrt(p[i]) - np.sqrt(q[i]))**2
    result = (1.0 / np.sqrt(2.0)) * np.sqrt(sum_)
    return result


# # Results From Paper Metrics

# In[2]:


def process(num):
    for datafiles in tqdm(os.listdir("predictions/")[num:num+100]):
        bk,name = datafiles.split(".")[0].split("_")
        file = open("predictions/{}_{}.json".format(bk,name),"r")
        data = json.load(file)
        file.close()
            
        Filter_HL  = []
    
        for each_input in data.keys():

            ideal_probs = list(data[each_input]["ideal"].values())
            filter_probs = list(data[each_input]["noise"].values())

            PF = np.array([ideal_probs]).reshape(-1,1)
            QF = np.array([filter_probs]).reshape(-1,1)
            print(PF,QF,ideal_probs)
            HL_filter = HellingerDistance(PF,QF)[0]
            Filter_HL.append(HL_filter)
        
            
        RQ1C_data = open("results/data/{}_{}.json".format(bk,name),"w")
        json.dump({"FilterHL":Filter_HL},RQ1C_data)
        RQ1C_data.close()


if __name__=="__main__":
    for proc in tqdm(range(0,len(os.listdir("predictions/")),100)):
        p1 = multiprocessing.Process(target=process, args=(proc, ))
        p1.start()
        p1.join()
        time.sleep(1)


    # In[17]:


    RQ1C = defaultdict(lambda:{})
    for datafiles in tqdm(os.listdir("results/data/")):
        bk,name = datafiles.split(".")[0].split("_")
        file = open("results/data/{}_{}.json".format(bk,name),"r")
        data = json.load(file)
        file.close()
        RQ1C[bk][name] = data


    # In[18]:

    saveRQ1 = {k: v for k, v in RQ1C.items()}
    rqfile = open("./results/saveRQ1.json","w")
    json.dump(saveRQ1,rqfile)
    rqfile.close()

"""
another = {}
programs = list(RQ1C[list(RQ1C.keys())[0]].keys())
for program in programs:
    bk_tvdn = []
    bk_tvdf = []
    bk_jhnn = []
    bk_jhnf = []
    bk_hln  = []
    bk_hlf  = []
    for bk in RQ1C.keys():
        hln = np.mean(RQ1C[bk][program]["NoiseHL"])
        hlf = np.mean(RQ1C[bk][program]["FilterHL"])
        bk_hln.append(hln)
        bk_hlf.append(hlf)
    another[program] = {"Avg Filter HL":np.mean(bk_hlf),
                       "Avg Noise HL":np.mean(bk_hln)}


# In[19]:


def sort_key(v):
    x = v.str.replace("P","")
    return x.astype(int)
programs = pd.DataFrame.from_dict(another).T
programs["Improv HL"] = np.round((programs["Avg Noise HL"].values-programs["Avg Filter HL"].values)/programs["Avg Noise HL"].values*100,2)
programs = programs.sort_index(key=sort_key)
programs.to_csv("results/RQ1_HL_PP.csv")
programs


# In[20]:


# programs.index.name = "programs"
# _,bins = np.histogram(programs["Improv HL"].values,5)
# groups = programs.groupby(['programs', pd.cut(programs["Improv HL"],bins)])
# groups.size().unstack()
print("average improvement:",programs[programs["Improv HL"]>0]["Improv HL"].mean())
programs[programs["Improv HL"]<0]


# In[21]:


# from Abstract_Interface import BackendFactory
# import benchmark_circuits as bc
# from util_imports import *
# backend_factory = BackendFactory()
# backend = backend_factory.initialize_backend()
# load_circuits()


# In[22]:


for x in programs[programs["Improv HL"]<0].index:
    circ = QuantumCircuit.from_qasm_file("random_circuits/{}.qasm".format(x))
#     algo = get_circuit_class_object(x)
#     inp = algo.get_full_inputs()[0]
#     result = algo.get_result(backend,inp)
#     print([(x["bin"],x["prob"]) for x in result["probability"]])
    print("circuit name {}, depth {}".format(x,circ.depth()))
    print(circ)
#     break
# algo.circ.decompose(reps=4).draw(output='mpl')


# In[23]:


another = {}

for bk in RQ1C.keys():
    bk_tvdn = []
    bk_tvdf = []
    bk_jhnn = []
    bk_jhnf = []
    bk_hln  = []
    bk_hlf  = []
    for program in RQ1C[bk].keys():
        hln = np.mean(RQ1C[bk][program]["NoiseHL"])
        hlf = np.mean(RQ1C[bk][program]["FilterHL"])
        bk_hln.append(hln)
        bk_hlf.append(hlf)
    another[bk.replace("Fake","")] = {"Avg Filter HL":np.mean(bk_hlf),
                       "Avg Noise HL":np.mean(bk_hln)}


# In[24]:


bk_perspective = pd.DataFrame.from_dict(another).T
bk_perspective["Improv HL"] = np.round((bk_perspective["Avg Noise HL"].values-bk_perspective["Avg Filter HL"].values)/bk_perspective["Avg Noise HL"].values*100,2)
bk_perspective.sort_index().round(2).to_csv("results/RQ1_HL_BK.csv",index=False)
bk_perspective.sort_index().round(2)


# In[25]:


print("average improvement:",bk_perspective[bk_perspective["Improv HL"]>74]["Improv HL"].mean())


# # For Filter STATISTICS

# # For HL (Backend perspective)

# In[26]:


data = pd.DataFrame(columns=["Backend","Distance"])
backends = []
distance = []

for bk in RQ1C.keys():
    dist = []
    for program in RQ1C[bk].keys():
        tvdf = np.mean(RQ1C[bk][program]["FilterHL"])
        dist.append(tvdf)
    
    dist = np.round(dist,2)
    backends.extend([bk.replace("Fake","") for x in dist])
    distance.extend(dist)
data["Backend"] = backends
data["Distance"] = distance


# In[27]:


data


# In[28]:


import pingouin as pg
import scikit_posthocs as sp

with open("results/RQ1_statistics.txt","w") as file:

    data = pd.DataFrame(columns=["Backend","Distance"])
    backends = []
    distance = []

    for bk in RQ1C.keys():
        dist = []
        for program in RQ1C[bk].keys():
            tvdf = np.mean(RQ1C[bk][program]["FilterHL"])
            dist.append(tvdf)

        dist = np.round(dist,2)
        backends.extend([bk.replace("Fake","") for x in dist])
        distance.extend(dist)
    data["Backend"] = backends
    data["Distance"] = distance


    result = pg.kruskal(data,dv="Distance",between="Backend")
    n = data["Distance"].shape[0]
    H = result.H[0]
    effect = H*((n+1)/(n**2-1))
    mag = ""
    if effect>=0.00 and effect < 0.01:
        mag = "Negligible"
    elif effect>=0.01 and effect < 0.04:
        mag = 'Weak'
    elif effect>=0.04 and effect < 0.16:
        mag = "Moderate"
    elif effect>=0.16 and effect < 0.36:
        mag = "Relatively strong"
    elif effect>=0.36 and effect < 0.64:
        mag = "Strong"
    elif effect>=0.64 and effect < 1.00:
        mag = "Very strong"

    file.write("For Backend Aspect: pvalue = {}, Effect size = {}, Magnitude = {}\n".format(result["p-unc"][0],effect,mag))
    
    result = sp.posthoc_dunn(data,val_col="Distance",group_col="Backend", p_adjust = 'bonferroni')
    result = result.round(1)
    result.to_csv("results/RQ1_dunns_HL_BK.csv",index=False)
    
    Programs = list(RQ1C[list(RQ1C.keys())[0]].keys())
    data = pd.DataFrame()
    to_check = []
    programs = []
    distance = []

    for program in Programs:
        dist = []
        for bk in RQ1C.keys():
            tvdf = np.mean(RQ1C[bk][program]["FilterHL"])
            dist.append(tvdf)

        dist = np.round(dist,2)
        programs.extend([program for x in dist])
        distance.extend(dist)
    data["Programs"] = programs
    data["Distance"] = distance

    result = pg.kruskal(data,dv="Distance",between="Programs")
    n = data["Distance"].shape[0]
    H = result.H[0]
    effect = H*((n+1)/(n**2-1))
    mag = ""
    if effect>=0.00 and effect < 0.01:
        mag = "Negligible"
    elif effect>=0.01 and effect < 0.04:
        mag = 'Weak'
    elif effect>=0.04 and effect < 0.16:
        mag = "Moderate"
    elif effect>=0.16 and effect < 0.36:
        mag = "Relatively strong"
    elif effect>=0.36 and effect < 0.64:
        mag = "Strong"
    elif effect>=0.64 and effect < 1.00:
        mag = "Very strong"

    file.write("For Program Aspect: pvalue = {}, Effect size = {}, Magnitude = {}\n".format(result["p-unc"][0],effect,mag))
    result = sp.posthoc_dunn(data,val_col="Distance",group_col="Programs", p_adjust = 'bonferroni')
    result = result.round(1)
    result.to_csv("results/RQ1_dunns_HL_PP.csv",index=False)


# In[ ]:


"""


# In[ ]: