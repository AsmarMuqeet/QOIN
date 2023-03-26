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
warnings.filterwarnings('ignore')


# # Results

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


# In[4]:


RQ1C = defaultdict(lambda:{})

for datafiles in tqdm(os.listdir("evaluation_data/")):
    print(datafiles)
    bk,name = datafiles.split(".")[0].split("_")
    with open("evaluation_data/{}_{}.json".format(bk,name),"r") as file:
        data = json.load(file)
        
    noise_data = data["noise"]
    ideal_data = data["ideal"]
    
    Filter_TVD = []
    Filter_JHN = []
    Filter_HL  = []
    Noise_TVD  = []
    Noise_JHN  = []
    Noise_HL   = []

    
    for i,(each_input_ideal,each_input_noise) in enumerate(zip(ideal_data,noise_data)):
        noise_probs = []
        ideal_probs_for_noise = []
        for key in each_input_ideal.keys():
            for noise_value in each_input_noise[key]["probability"]:
                noise_probs.append(noise_value["prob"])
                found = False
                for values in each_input_ideal[key]["probability"]:
                    if noise_value["bin"]==values["bin"]:
                        ideal_probs_for_noise.append(values["prob"])
                        found = True
                        break
                if not found:
                    ideal_probs_for_noise.append(0)
        
        PN = np.array([ideal_probs_for_noise]).reshape(-1,1)
        QN = np.array([noise_probs]).reshape(-1,1)
        TVD_noise = dm.total_variation_distance(PN,QN)
        Noise_TVD.append(TVD_noise)
        JHN_noise = jhn(PN,QN)[0]
        Noise_JHN.append(JHN_noise)
        HL_noise = HellingerDistance(PN,QN)[0]
        Noise_HL.append(HL_noise)

        
    predictor = ktrain.load_predictor('tunning_models/{}_{}'.format(bk,name))
    for i,(each_input_ideal,each_input_noise) in enumerate(zip(ideal_data,noise_data)):
        filter_probs = []
        ideal_probs = []
        for key in each_input_ideal.keys():
            for ideal_value in each_input_ideal[key]["probability"]:
                ideal_probs.append(ideal_value["prob"])
                found = False
                for values in each_input_noise[key]["probability"]:
                    if ideal_value["bin"]==values["bin"]:
                        all_other_probs = sum([x["prob"] for x in each_input_noise[key]["probability"] if x["bin"]!=values["bin"]])
                        odr = values["odds"]
                        pos = values["prob"]
                        pof = 1-pos
                        temp2 = pd.DataFrame([[pof,odr,pos]],columns=["POF","ODR","POS"])
                        prediction = predictor.predict(temp2)[0]
                        #print(prediction)
                        if prediction[0]<0:
                            filter_probs.append(0)
                        elif prediction[0]>1:
                            filter_probs.append(1)
                        else:
                            filter_probs.append(prediction[0])        
                        found = True
                        break                
        
        if len(ideal_probs)<=1:
            ideal_probs.append(0)
            filter_probs.append(0)
        PF = np.array([ideal_probs]).reshape(-1,1)
        QF = np.array([filter_probs]).reshape(-1,1)
        print(PF,QF,ideal_probs)
        TVD_filter = dm.total_variation_distance(PF,QF)
        Filter_TVD.append(TVD_filter)
        JHN_filter = jhn(PF,QF)[0]
        Filter_JHN.append(JHN_filter)
        HL_filter = HellingerDistance(PF,QF)[0]
        Filter_HL.append(HL_filter)
    
    RQ1C[bk][name] = {"FilterTVD":Filter_TVD,
                     "NoiseTVD":Noise_TVD,
                     "FilterJHN":Filter_JHN,
                     "NoiseJHN":Noise_JHN,
                     "FilterHL":Filter_HL,
                     "NoiseHL":Noise_HL,
                    }


# In[5]:


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
        tvdn = np.mean(RQ1C[bk][program]["NoiseTVD"])
        tvdf = np.mean(RQ1C[bk][program]["FilterTVD"])
        bk_tvdn.append(tvdn)
        bk_tvdf.append(tvdf)
        jhnn = np.mean(RQ1C[bk][program]["NoiseJHN"])
        jhnf = np.mean(RQ1C[bk][program]["FilterJHN"])
        bk_jhnn.append(jhnn)
        bk_jhnf.append(jhnf)
        hln = np.mean(RQ1C[bk][program]["NoiseHL"])
        hlf = np.mean(RQ1C[bk][program]["FilterHL"])
        bk_hln.append(hln)
        bk_hlf.append(hlf)
    another[program] = {"Avg Filter TVD":np.mean(bk_tvdf),
                       "Avg Noise TVD":np.mean(bk_tvdn),
                       "Avg Filter JHN":np.mean(bk_jhnf),
                       "Avg Noise JHN":np.mean(bk_jhnn),
                       "Avg Filter HL":np.mean(bk_hlf),
                       "Avg Noise HL":np.mean(bk_hln)
                        }


# In[7]:


programs = pd.DataFrame.from_dict(another).T
programs["Improv TVD"] = np.round((programs["Avg Noise TVD"].values-programs["Avg Filter TVD"].values)/programs["Avg Noise TVD"].values*100,2)
programs["Improv JHN"] = np.round((programs["Avg Noise JHN"].values-programs["Avg Filter JHN"].values)/programs["Avg Noise JHN"].values*100,2)
programs["Improv HL"] = np.round((programs["Avg Noise HL"].values-programs["Avg Filter HL"].values)/programs["Avg Noise HL"].values*100,2)
programs[["Avg Noise HL","Avg Filter HL","Improv HL"]].to_csv("results/RQ1_HL_PP.csv")
programs[["Avg Noise HL","Avg Filter HL","Improv HL"]]


# In[8]:


another = {}

for bk in RQ1C.keys():
    bk_tvdn = []
    bk_tvdf = []
    bk_jhnn = []
    bk_jhnf = []
    bk_hln  = []
    bk_hlf  = []
    for program in RQ1C[bk].keys():
        tvdn = np.mean(RQ1C[bk][program]["NoiseTVD"])
        tvdf = np.mean(RQ1C[bk][program]["FilterTVD"])
        bk_tvdn.append(tvdn)
        bk_tvdf.append(tvdf)
        jhnn = np.mean(RQ1C[bk][program]["NoiseJHN"])
        jhnf = np.mean(RQ1C[bk][program]["FilterJHN"])
        bk_jhnn.append(jhnn)
        bk_jhnf.append(jhnf)
        hln = np.mean(RQ1C[bk][program]["NoiseHL"])
        hlf = np.mean(RQ1C[bk][program]["FilterHL"])
        bk_hln.append(hln)
        bk_hlf.append(hlf)
    another[bk.replace("Fake","")] = {"Avg Filter TVD":np.mean(bk_tvdf),
                       "Avg Noise TVD":np.mean(bk_tvdn),
                       "Avg Filter JHN":np.mean(bk_jhnf),
                       "Avg Noise JHN":np.mean(bk_jhnn),
                       "Avg Filter HL":np.mean(bk_hlf),
                       "Avg Noise HL":np.mean(bk_hln)}


# In[9]:


bk_perspective = pd.DataFrame.from_dict(another).T
bk_perspective["Improv TVD"] = np.round((bk_perspective["Avg Noise TVD"].values-bk_perspective["Avg Filter TVD"].values)/bk_perspective["Avg Noise TVD"].values*100,2)
bk_perspective["Improv JHN"] = np.round((bk_perspective["Avg Noise JHN"].values-bk_perspective["Avg Filter JHN"].values)/bk_perspective["Avg Noise JHN"].values*100,2)
bk_perspective["Improv HL"] = np.round((bk_perspective["Avg Noise HL"].values-bk_perspective["Avg Filter HL"].values)/bk_perspective["Avg Noise HL"].values*100,2)
bk_perspective[["Avg Filter HL","Avg Noise HL","Improv HL"]].sort_index().round(2).to_csv("results/RQ1_HL_BP.csv")
bk_perspective[["Avg Filter HL","Avg Noise HL","Improv HL"]].sort_index().round(2)


# # For Filter STATISTICS

# # For HL (Backend perspective)

# In[10]:


import pingouin as pg

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


# In[11]:


import scikit_posthocs as sp
result = sp.posthoc_dunn(data,val_col="Distance",group_col="Programs", p_adjust = 'bonferroni')


# In[12]:


result = result.round(2)


# In[13]:


text = []
for i in result.index:
    temp = []
    for col in result.columns:
        if result.loc[i,col]<0.05:
            temp.append("< 0.05")
        else:
            temp.append(str(result.loc[i,col]))
    text.append(temp)


# In[15]:


sns.heatmap(result, annot=np.array(text),fmt = '',cmap="Blues")
plt.savefig('./results/RQ1_dunns_PP.png',bbox_inches='tight',dpi=600)


# In[ ]:




