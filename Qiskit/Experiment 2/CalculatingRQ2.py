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


# In[2]:


load_circuits()


# # Select CUTs

# In[3]:


backends = [('FakeAlmaden', 20), ('FakeBoeblingen', 20), ('FakeBrooklyn', 65), ('FakeCairo', 27), ('FakeCambridge', 28), ('FakeCambridgeAlternativeBasis', 28), ('FakeCasablanca', 7), ('FakeGuadalupe', 16), ('FakeHanoi', 27), ('FakeJakarta', 7), ('FakeJohannesburg', 20), ('FakeKolkata', 27), ('FakeLagos', 7), ('FakeManhattan', 65), ('FakeMontreal', 27), ('FakeMumbai', 27), ('FakeNairobi', 7), ('FakeParis', 27), ('FakeRochester', 53), ('FakeSingapore', 20), ('FakeSydney', 27), ('FakeToronto', 27), ('FakeWashington', 127)]
BaselineCircuits,CUTs = train_test_split(get_all_circuits(),train_size=0.2,random_state=13)
BaselineCircuits,CUTs


# # Define QuCAT Oracles

# In[4]:


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


def default_inner_template():
    return {"uof":[],"uof_w":[],"wodf":[],"wodf_w":[]}


# # Evaluate Noise QuCAT

# In[5]:


with open("results/RQ2A.json","r") as file:
    RQ2A = json.load(file)


# In[6]:


with open("results/RQ2B.json","r") as file:
    RQ2B = json.load(file)


# # Evaluate filter QuCAT

# In[7]:


RQ2C = {}
for bk in tqdm(RQ2B.keys()):
    v = []
    for programs in RQ2B[bk]:
        prog = list(programs.keys())[0]
        file = open("results/data2/{}_{}.json".format(bk,prog),"r")
        v.append({prog:json.load(file)})
        file.close()
    RQ2C[bk] = v
    
with open("results/RQ2C.json","w") as file:
    json.dump(RQ2C,file)


# In[8]:


data1 = pd.DataFrame(columns=["Program","Original_score","Mutant 1 score","Mutant 2 score","Mutant 3 score"])
for program in CUTs:
    org,m1,m2,m3 = [],[],[],[]
    for key in RQ2B.keys():
        for prog in RQ2B[key]:
            p_key = list(prog.keys())[0]
            if program == p_key:
                org.append(prog[p_key]["original_score"])
                m1.append(prog[p_key]["mutant1_score"])
                m2.append(prog[p_key]["mutant2_score"])
                m3.append(prog[p_key]["mutant3_score"])
                break
    
    org = np.mean(org)
    m1 = np.mean(m1)
    m2 = np.mean(m2)
    m3 = np.mean(m3)  
    data1 = data1.append({"Program":program,
                        "Original_score":org,
                        "Mutant 1 score":m1,
                        "Mutant 2 score":m2,
                        "Mutant 3 score":m3},
                       ignore_index=True)
data1


# In[9]:


data2 = pd.DataFrame(columns=["Program","Original_score","Mutant 1 score","Mutant 2 score","Mutant 3 score"])
for program in CUTs:
    org,m1,m2,m3 = [],[],[],[]
    for key in RQ2A.keys():
        for prog in RQ2A[key]:
            p_key = list(prog.keys())[0]
            if program == p_key:
                org.append(prog[p_key]["original_score"])
                m1.append(prog[p_key]["mutant1_score"])
                m2.append(prog[p_key]["mutant2_score"])
                m3.append(prog[p_key]["mutant3_score"])
                break
    
    org = np.mean(org)
    m1 = np.mean(m1)
    m2 = np.mean(m2)
    m3 = np.mean(m3)  
    data2 = data2.append({"Program":program,
                        "Original_score":org,
                        "Mutant 1 score":m1,
                        "Mutant 2 score":m2,
                        "Mutant 3 score":m3},
                       ignore_index=True)
    
data2


# In[10]:


data3 = pd.DataFrame(columns=["Program","Original_score","Mutant 1 score","Mutant 2 score","Mutant 3 score"])
for program in CUTs:
    org,m1,m2,m3 = [],[],[],[]
    for key in RQ2C.keys():
        for prog in RQ2C[key]:
            p_key = list(prog.keys())[0]
            if program == p_key:
                org.append(prog[p_key]["original_score"])
                m1.append(prog[p_key]["mutant1_score"])
                m2.append(prog[p_key]["mutant2_score"])
                m3.append(prog[p_key]["mutant3_score"])
                break
    
    org = np.mean(org)
    m1 = np.mean(m1)
    m2 = np.mean(m2)
    m3 = np.mean(m3)  
    data3 = data3.append({"Program":program,
                        "Original_score":org,
                        "Mutant 1 score":m1,
                        "Mutant 2 score":m2,
                        "Mutant 3 score":m3},
                       ignore_index=True)
data3


# # Statistical Test

# In[11]:


data_for_stat = pd.DataFrame(columns=["Program","Backend","Original_I","Mutant_1_I","Mutant_2_I","Mutant_3_I","Original_F",
                             "Mutant_1_F","Mutant_2_F","Mutant_3_F"])
for program in CUTs:
    for key in RQ2B.keys():
        org,m1,m2,m3 = 0,0,0,0
        for prog in RQ2B[key]:
            p_key = list(prog.keys())[0]
            if program == p_key:
                org = prog[p_key]["original_score"]
                m1  = prog[p_key]["mutant1_score"]
                m2  = prog[p_key]["mutant2_score"]
                m3  = prog[p_key]["mutant3_score"]
                break
                
        org3,m13,m23,m33 = 0,0,0,0
        for prog in RQ2C[key]:
            p_key = list(prog.keys())[0]
            if program == p_key:
                org3 = prog[p_key]["original_score"]
                m13  = prog[p_key]["mutant1_score"]
                m23  = prog[p_key]["mutant2_score"]
                m33  = prog[p_key]["mutant3_score"]
                break
            
        data_for_stat = data_for_stat.append({"Program":program,
                            "Backend":key,
                            "Original_I":org,
                            "Mutant_1_I":m1,
                            "Mutant_2_I":m2,
                            "Mutant_3_I":m3,
                            "Mutant_1_F":m13,
                            "Mutant_2_F":m23,
                            "Mutant_3_F":m33,
                            "Original_F":org3
                           },
                           ignore_index=True)
        
data_for_stat.head()


# In[12]:


import rpy2.robjects as robjects
r = robjects.r
r.library('effsize')
r['source']('A12.R')
test = robjects.globalenv['A12']

stat_data_original = pd.DataFrame(columns=["Program","Pvalue","Avalue","Mag"])
stat_data_mutant1 = pd.DataFrame(columns=["Program","Pvalue","Avalue","Mag"])
stat_data_mutant2 = pd.DataFrame(columns=["Program","Pvalue","Avalue","Mag"])
stat_data_mutant3 = pd.DataFrame(columns=["Program","Pvalue","Avalue","Mag"])

index = data_for_stat.groupby("Program").indices
for program in index.keys():
    oresult = stats.mannwhitneyu(x=data_for_stat.loc[index[program],"Original_I"],y=data_for_stat.loc[index[program],"Original_F"])
    
    df_result_r = test(robjects.FloatVector(data_for_stat.loc[index[program],"Original_I"].values),
                       robjects.FloatVector(data_for_stat.loc[index[program],"Original_F"].values))
    
    mag = str(df_result_r[2]).split("\n")[0].split()[-1]
    oeffect = float(str(df_result_r[3]).split()[-1])
    oeffect = oeffect                                 #smaller values mean better performance
    stat_data_original = stat_data_original.append({"Program":program,
                                  "Pvalue":oresult.pvalue,
                                  "Avalue":oeffect,
                                  "Mag":mag},ignore_index=True)
    
    oresult = stats.mannwhitneyu(x=data_for_stat.loc[index[program],"Mutant_1_I"],y=data_for_stat.loc[index[program],"Mutant_1_F"])
    
    df_result_r = test(robjects.FloatVector(data_for_stat.loc[index[program],"Mutant_1_I"].values),
                       robjects.FloatVector(data_for_stat.loc[index[program],"Mutant_1_F"].values))
    
    mag = str(df_result_r[2]).split("\n")[0].split()[-1]
    oeffect = float(str(df_result_r[3]).split()[-1])
    oeffect = oeffect                                 #smaller values mean better performance
    stat_data_mutant1 = stat_data_mutant1.append({"Program":program,
                                  "Pvalue":oresult.pvalue,
                                  "Avalue":oeffect,
                                  "Mag":mag},ignore_index=True)
    
    oresult = stats.mannwhitneyu(x=data_for_stat.loc[index[program],"Mutant_2_I"],y=data_for_stat.loc[index[program],"Mutant_2_F"])
    
    df_result_r = test(robjects.FloatVector(data_for_stat.loc[index[program],"Mutant_2_I"].values),
                       robjects.FloatVector(data_for_stat.loc[index[program],"Mutant_2_F"].values))
    
    mag = str(df_result_r[2]).split("\n")[0].split()[-1]
    oeffect = float(str(df_result_r[3]).split()[-1])
    oeffect = oeffect                                 #smaller values mean better performance
    stat_data_mutant2 = stat_data_mutant2.append({"Program":program,
                                  "Pvalue":oresult.pvalue,
                                  "Avalue":oeffect,
                                  "Mag":mag},ignore_index=True)
    
    oresult = stats.mannwhitneyu(x=data_for_stat.loc[index[program],"Mutant_3_I"],y=data_for_stat.loc[index[program],"Mutant_3_F"])
    
    df_result_r = test(robjects.FloatVector(data_for_stat.loc[index[program],"Mutant_3_I"].values),
                       robjects.FloatVector(data_for_stat.loc[index[program],"Mutant_3_F"].values))
    
    mag = str(df_result_r[2]).split("\n")[0].split()[-1]
    oeffect = float(str(df_result_r[3]).split()[-1])
    oeffect = oeffect                                 #smaller values mean better performance
    stat_data_mutant3 = stat_data_mutant3.append({"Program":program,
                                  "Pvalue":oresult.pvalue,
                                  "Avalue":oeffect,
                                  "Mag":mag},ignore_index=True)


# In[13]:

stat_data_original.round(2).to_csv("results/RQ2_statistics_original_programs.csv",index=False)
stat_data_mutant1.round(2).to_csv("results/RQ2_statistics_faulty1_programs.csv",index=False)
stat_data_mutant2.round(2).to_csv("results/RQ2_statistics_faulty2_programs.csv",index=False)
stat_data_mutant3.round(2).to_csv("results/RQ2_statistics_faulty3_programs.csv",index=False)

stat_data_original


# In[14]:


stat_data_mutant1


# In[15]:


stat_data_mutant2


# In[16]:


stat_data_mutant3


# In[17]:


df = pd.DataFrame(columns=["Programs","Score","Type"])
for i in range(data1.shape[0]):
    P = data1.loc[i,"Program"]
    S = data1.loc[i,"Original_score"]
    T = "Ideal"
    df = df.append({"Programs":P,"Score":S,"Type":T},ignore_index=True)
    
for i in range(data2.shape[0]):
    P = data2.loc[i,"Program"]
    S = data2.loc[i,"Original_score"]
    T = "Noisy"
    df = df.append({"Programs":P,"Score":S,"Type":T},ignore_index=True)
    
for i in range(data3.shape[0]):
    P = data3.loc[i,"Program"]
    S = data3.loc[i,"Original_score"]
    T = "Filtered"
    df = df.append({"Programs":P,"Score":S,"Type":T},ignore_index=True)
df.head()


# In[18]:


data = {"line_x": [], "line_y": []}
original_cases_diviation = 0
original_cases_nodiviation = 0

for program in data1["Program"].values:
    ideal = df.loc[(df.Type == "Ideal") & (df.Programs == program)]["Score"].values[0]
    filtered = df.loc[(df.Type == "Filtered") & (df.Programs == program)]["Score"].values[0]
    if ideal-filtered<0:
        data["line_x"].extend(
            [
                ideal,
                filtered,
                None,
            ]
        )
        data["line_y"].extend([program, program, None])
        original_cases_diviation+=1
    else:
        original_cases_nodiviation+=1
        
data_effect = {"Significance": [], "line_y": [],"text":[]}
for program in data1["Program"].values:
    ideal = df.loc[(df.Type == "Ideal") & (df.Programs == program)]["Score"].values[0]
    filtered = df.loc[(df.Type == "Filtered") & (df.Programs == program)]["Score"].values[0]
    pvalue = stat_data_original.loc[stat_data_original.Program==program]["Pvalue"].values[0]
    mag = stat_data_original.loc[stat_data_original.Program==program]["Mag"].values[0]
    if pvalue<0.05:
        if mag=="large":
            data_effect["Significance"].extend(
                [
                    filtered
                ]
            )
            data_effect["line_y"].extend([program])
            data_effect["text"].extend(["  Pvalue={:.3f}, Effect={}".format(pvalue,mag)])
        else:
            data_effect["Significance"].extend(
                [
                    filtered
                ]
            )
            data_effect["line_y"].extend([program])
            data_effect["text"].extend(["  Pvalue={:.3f}".format(pvalue)])


# In[33]:


case1o = original_cases_nodiviation
case3o = original_cases_diviation
case2o = len(CUTs)-(case1o+case3o)
print(original_cases_diviation,original_cases_nodiviation)


# In[34]:


significanto = stat_data_original[stat_data_original["Pvalue"]<0.05].shape[0]
effectsizeo = stat_data_original[stat_data_original["Mag"]=="large"].shape[0]
print(stat_data_original[stat_data_original["Pvalue"]<0.05].shape[0])
print(stat_data_original[stat_data_original["Mag"]=="large"].shape[0])


# In[35]:


df = pd.DataFrame(columns=["Programs","Score","Type"])
for i in range(data1.shape[0]):
    P = data1.loc[i,"Program"]
    S = data1.loc[i,"Mutant 1 score"]
    T = "Ideal"
    df = df.append({"Programs":"{} F1".format(P),"Score":S,"Type":T},ignore_index=True)
    P = data1.loc[i,"Program"]
    S = data1.loc[i,"Mutant 2 score"]
    T = "Ideal"
    df = df.append({"Programs":"{} F2".format(P),"Score":S,"Type":T},ignore_index=True)
    P = data1.loc[i,"Program"]
    S = data1.loc[i,"Mutant 3 score"]
    T = "Ideal"
    df = df.append({"Programs":"{} F3".format(P),"Score":S,"Type":T},ignore_index=True)
    
for i in range(data2.shape[0]):
    P = data2.loc[i,"Program"]
    S = data2.loc[i,"Mutant 1 score"]
    T = "Noisy"
    df = df.append({"Programs":"{} F1".format(P),"Score":S,"Type":T},ignore_index=True)
    P = data2.loc[i,"Program"]
    S = data2.loc[i,"Mutant 2 score"]
    T = "Noisy"
    df = df.append({"Programs":"{} F2".format(P),"Score":S,"Type":T},ignore_index=True)
    P = data2.loc[i,"Program"]
    S = data2.loc[i,"Mutant 3 score"]
    T = "Noisy"
    df = df.append({"Programs":"{} F3".format(P),"Score":S,"Type":T},ignore_index=True)
    
for i in range(data3.shape[0]):
    P = data3.loc[i,"Program"]
    S = data3.loc[i,"Mutant 1 score"]
    T = "Filtered"
    df = df.append({"Programs":"{} F1".format(P),"Score":S,"Type":T},ignore_index=True)
    P = data3.loc[i,"Program"]
    S = data3.loc[i,"Mutant 2 score"]
    T = "Filtered"
    df = df.append({"Programs":"{} F2".format(P),"Score":S,"Type":T},ignore_index=True)
    P = data3.loc[i,"Program"]
    S = data3.loc[i,"Mutant 3 score"]
    T = "Filtered"
    df = df.append({"Programs":"{} F3".format(P),"Score":S,"Type":T},ignore_index=True)

df.head()


# In[36]:


data = {"line_x": [], "line_y": []}

mutant_cases_left_diviation = 0
mutant_cases_right_diviation = 0
mutant_cases_nodiviation = 0

for program in df["Programs"].unique():
    ideal = df.loc[(df.Type == "Ideal") & (df.Programs == program)]["Score"].values[0]
    filtered = df.loc[(df.Type == "Filtered") & (df.Programs == program)]["Score"].values[0]
    if ideal-filtered<0:
        data["line_x"].extend(
            [
                ideal,
                filtered,
                None,
            ]
        )
        data["line_y"].extend([program, program, None])
        mutant_cases_right_diviation+=1
    elif ideal-filtered==0:
        mutant_cases_nodiviation+=1



data = {"line_x": [], "line_y": []}

for program in df["Programs"].unique():
    ideal = df.loc[(df.Type == "Ideal") & (df.Programs == program)]["Score"].values[0]
    filtered = df.loc[(df.Type == "Filtered") & (df.Programs == program)]["Score"].values[0]
    if ideal-filtered>0:
        data["line_x"].extend(
            [
                ideal,
                filtered,
                None,
            ]
        )
        data["line_y"].extend([program, program, None])
        mutant_cases_left_diviation+=1
    
        

data_effect = {"Significance": [], "line_y": [],"text":[]}
for program in df["Programs"].unique():
    ideal = df.loc[(df.Type == "Ideal") & (df.Programs == program)]["Score"].values[0]
    filtered = df.loc[(df.Type == "Filtered") & (df.Programs == program)]["Score"].values[0]
    proc = program.split()[0]
    if "F1" in program:
        pvalue = stat_data_mutant1.loc[stat_data_mutant1.Program==proc]["Pvalue"].values[0]
        mag = stat_data_mutant1.loc[stat_data_mutant1.Program==proc]["Mag"].values[0]
        if pvalue<0.05:
            if mag=="large":
                data_effect["Significance"].extend(
                    [
                        filtered
                    ]
                )
                data_effect["line_y"].extend([program])
                data_effect["text"].extend(["  Pvalue={:.3f}, Effect={}".format(pvalue,mag)])
            else:
                data_effect["Significance"].extend(
                    [
                        filtered
                    ]
                )
                data_effect["line_y"].extend([program])
                data_effect["text"].extend(["  Pvalue={:.3f}".format(pvalue)])
                
    elif "F2" in program:
        pvalue = stat_data_mutant2.loc[stat_data_mutant1.Program==proc]["Pvalue"].values[0]
        mag = stat_data_mutant2.loc[stat_data_mutant1.Program==proc]["Mag"].values[0]
        if pvalue<0.05:
            if mag=="large":
                data_effect["Significance"].extend(
                    [
                        filtered
                    ]
                )
                data_effect["line_y"].extend([program])
                data_effect["text"].extend(["  Pvalue={:.3f}, Effect={}".format(pvalue,mag)])
            else:
                data_effect["Significance"].extend(
                    [
                        filtered
                    ]
                )
                data_effect["line_y"].extend([program])
                data_effect["text"].extend(["  Pvalue={:.3f}".format(pvalue)])
                
    elif "F3" in program:
        pvalue = stat_data_mutant3.loc[stat_data_mutant1.Program==proc]["Pvalue"].values[0]
        mag = stat_data_mutant3.loc[stat_data_mutant1.Program==proc]["Mag"].values[0]
        if pvalue<0.05:
            if mag=="large":
                data_effect["Significance"].extend(
                    [
                        filtered
                    ]
                )
                data_effect["line_y"].extend([program])
                data_effect["text"].extend(["  Pvalue={:.3f}, Effect={}".format(pvalue,mag)])
            else:
                data_effect["Significance"].extend(
                    [
                        filtered
                    ]
                )
                data_effect["line_y"].extend([program])
                data_effect["text"].extend(["  Pvalue={:.3f}".format(pvalue)])


# In[37]:


case1f = mutant_cases_nodiviation
case2f = mutant_cases_left_diviation
case3f = mutant_cases_right_diviation
print(mutant_cases_left_diviation,mutant_cases_right_diviation,mutant_cases_nodiviation)


# In[38]:


m1 = stat_data_mutant1[stat_data_mutant1["Pvalue"]<0.05].shape[0]
m2 = stat_data_mutant2[stat_data_mutant2["Pvalue"]<0.05].shape[0]
m3 = stat_data_mutant3[stat_data_mutant3["Pvalue"]<0.05].shape[0]
significantf = m1+m2+m3
print(m1+m2+m3)
m1 = stat_data_mutant1[stat_data_mutant1["Mag"]=="large"].shape[0]
m2 = stat_data_mutant2[stat_data_mutant2["Mag"]=="large"].shape[0]
m3 = stat_data_mutant3[stat_data_mutant3["Mag"]=="large"].shape[0]
effectsizef = m1+m2+m3
print(m1+m2+m3)


# In[39]:


data = pd.DataFrame(columns=["Program","Precision_O","Recall_O","Precision_M1","Recall_M1",
                            "Precision_M2","Recall_M2","Precision_M3","Recall_M3",
                            "F1_O","F1_M1","F1_M2","F1_M3"])

total_input = []
filter_FP = []
filter_FN = []


for i in range(data1.shape[0]):
    algo = get_circuit_class_object(data1.loc[i,"Program"])
    total = len(algo.get_full_inputs())
    total_input.append(total)
    total_input.append(total)
    total_input.append(total)
    total_input.append(total)
    
    Ipositives = total-((data1.loc[i,"Original_score"]/100)*total)
    Inegatives = (data1.loc[i,"Original_score"]/100)*total
    Fpositives = total-((data3.loc[i,"Original_score"]/100)*total)
    Fnegatives = (data3.loc[i,"Original_score"]/100)*total
    TP = abs(Ipositives-abs(Ipositives-Fpositives))
    FP = Fpositives-TP
    TN = abs(Inegatives-abs(Inegatives-Fnegatives))
    FN = Fnegatives-TN
    precision = TP/(TP+FP)
    recall = TP/(TP+FN) 
    data.loc[i,"Precision_O"] = precision
    data.loc[i,"Recall_O"] = recall
    f1 = 2 * (precision * recall) / (precision + recall)
    data.loc[i,"F1_O"] = f1
    
    filter_FP.append(FP)
    filter_FN.append(FN)
    
    
    Ipositives = (data1.loc[i,"Mutant 1 score"]/100)*total
    Inegatives = total-Ipositives
    Fpositives = (data3.loc[i,"Mutant 1 score"]/100)*total
    Fnegatives = total-Fpositives
    TP = abs(Ipositives-abs(Ipositives-Fpositives))
    FP = Fpositives-TP
    TN = abs(Inegatives-abs(Inegatives-Fnegatives))
    FN = Fnegatives-TN
    precision = TP/(TP+FP)
    recall = TP/(TP+FN) 
    data.loc[i,"Precision_M1"] = precision
    data.loc[i,"Recall_M1"] = recall
    f1 = 2 * (precision * recall) / (precision + recall)
    data.loc[i,"F1_M1"] = f1
    
    filter_FP.append(FP)
    filter_FN.append(FN)

    
    Ipositives = (data1.loc[i,"Mutant 2 score"]/100)*total
    Inegatives = total-Ipositives
    Fpositives = (data3.loc[i,"Mutant 2 score"]/100)*total
    Fnegatives = total-Fpositives
    TP = abs(Ipositives-abs(Ipositives-Fpositives))
    FP = Fpositives-TP
    TN = abs(Inegatives-abs(Inegatives-Fnegatives))
    FN = Fnegatives-TN
    precision = TP/(TP+FP)
    recall = TP/(TP+FN) 
    data.loc[i,"Precision_M2"] = precision
    data.loc[i,"Recall_M2"] = recall
    f1 = 2 * (precision * recall) / (precision + recall)
    data.loc[i,"F1_M2"] = f1
    
    filter_FP.append(FP)
    filter_FN.append(FN)

    
    Ipositives = (data1.loc[i,"Mutant 3 score"]/100)*total
    Inegatives = total-Ipositives
    Fpositives = (data3.loc[i,"Mutant 3 score"]/100)*total
    Fnegatives = total-Fpositives
    TP = abs(Ipositives-abs(Ipositives-Fpositives))
    FP = Fpositives-TP
    TN = abs(Inegatives-abs(Inegatives-Fnegatives))
    FN = Fnegatives-TN
    precision = TP/(TP+FP)
    recall = TP/(TP+FN) 
    data.loc[i,"Precision_M3"] = precision
    data.loc[i,"Recall_M3"] = recall
    f1 = 2 * (precision * recall) / (precision + recall)
    data.loc[i,"F1_M3"] = f1
    
    filter_FP.append(FP)
    filter_FN.append(FN)
    
    data.loc[i,"Program"] = data1.loc[i,"Program"]
    
data = data.fillna(0)


# In[40]:


data


# In[41]:


filteredF1 = data["F1_O F1_M1 F1_M2 F1_M3".split()].stack().mean()
print(data["F1_O F1_M1 F1_M2 F1_M3".split()].stack().mean())


# In[44]:


TotalInputs = sum(total_input)
TotalInputs


# In[46]:


filterFP = sum(filter_FP)
filterFN = sum(filter_FN)
print((sum(filter_FP)))
print((sum(filter_FN)))


# # for noise

# In[47]:


data = pd.DataFrame(columns=["Program","Precision_O","Recall_O","Precision_M1","Recall_M1",
                            "Precision_M2","Recall_M2","Precision_M3","Recall_M3",
                            "F1_O","F1_M1","F1_M2","F1_M3"])

# data = pd.DataFrame(columns=["Program","Precision_O","Recall_O","Precision_M1","Recall_M1",
#                             "Precision_M2","Recall_M2","Precision_M3","Recall_M3",
#                             "F1_O","F1_baseline_O","F1_M1","F1_baseline_M1","F1_M2","F1_baseline_M2","F1_M3","F1_baseline_M3"])

total_inputs = []
Noise_FP = []
Noise_FN = []

for i in range(data1.shape[0]):
    algo = get_circuit_class_object(data1.loc[i,"Program"])
    total = len(algo.get_full_inputs())
    total_inputs.append(total)
    
    Ipositives = total-((data1.loc[i,"Original_score"]/100)*total)
    Inegatives = (data1.loc[i,"Original_score"]/100)*total
    Fpositives = total-((data2.loc[i,"Original_score"]/100)*total)
    Fnegatives = (data2.loc[i,"Original_score"]/100)*total
    TP = abs(Ipositives-abs(Ipositives-Fpositives))
    FP = Fpositives-TP
    TN = abs(Inegatives-abs(Inegatives-Fnegatives))
    FN = Fnegatives-TN
    precision = TP/(TP+FP)
    recall = TP/(TP+FN) 
    data.loc[i,"Precision_O"] = precision
    data.loc[i,"Recall_O"] = recall
    f1 = 2 * (precision * recall) / (precision + recall)
    data.loc[i,"F1_O"] = f1
    
    Noise_FP.append(FP)
    Noise_FN.append(FN)
    
    Ipositives = (data1.loc[i,"Mutant 1 score"]/100)*total
    Inegatives = total-Ipositives
    Fpositives = (data2.loc[i,"Mutant 1 score"]/100)*total
    Fnegatives = total-Fpositives
    TP = abs(Ipositives-abs(Ipositives-Fpositives))
    FP = Fpositives-TP
    TN = abs(Inegatives-abs(Inegatives-Fnegatives))
    FN = Fnegatives-TN
    precision = TP/(TP+FP)
    recall = TP/(TP+FN) 
    data.loc[i,"Precision_M1"] = precision
    data.loc[i,"Recall_M1"] = recall
    f1 = 2 * (precision * recall) / (precision + recall)
    data.loc[i,"F1_M1"] = f1
    
    Noise_FP.append(FP)
    Noise_FN.append(FN)
    
    Ipositives = (data1.loc[i,"Mutant 2 score"]/100)*total
    Inegatives = total-Ipositives    
    Fpositives = (data2.loc[i,"Mutant 2 score"]/100)*total
    Fnegatives = total-Fpositives
    TP = abs(Ipositives-abs(Ipositives-Fpositives))
    FP = Fpositives-TP
    TN = abs(Inegatives-abs(Inegatives-Fnegatives))
    FN = Fnegatives-TN
    precision = TP/(TP+FP)
    recall = TP/(TP+FN) 
    data.loc[i,"Precision_M2"] = precision
    data.loc[i,"Recall_M2"] = recall
    f1 = 2 * (precision * recall) / (precision + recall)
    data.loc[i,"F1_M2"] = f1
    
    Noise_FP.append(FP)
    Noise_FN.append(FN)
    
    Ipositives = (data1.loc[i,"Mutant 3 score"]/100)*total
    Inegatives = total-Ipositives
    Fpositives = (data2.loc[i,"Mutant 3 score"]/100)*total
    Fnegatives = total-Fpositives
    TP = abs(Ipositives-abs(Ipositives-Fpositives))
    FP = Fpositives-TP
    TN = abs(Inegatives-abs(Inegatives-Fnegatives))
    FN = Fnegatives-TN
    precision = TP/(TP+FP)
    recall = TP/(TP+FN) 
    data.loc[i,"Precision_M3"] = precision
    data.loc[i,"Recall_M3"] = recall
    f1 = 2 * (precision * recall) / (precision + recall)
    data.loc[i,"F1_M3"] = f1
    
    Noise_FP.append(FP)
    Noise_FN.append(FN)
    
    data.loc[i,"Program"] = data1.loc[i,"Program"]
    
data = data.fillna(0)


# In[48]:


noiseF1 = data["F1_O F1_M1 F1_M2 F1_M3".split()].stack().mean() 
print(data["F1_O F1_M1 F1_M2 F1_M3".split()].stack().mean())


# In[50]:


NoiseFP = sum(Noise_FP)
NoiseFN = sum(Noise_FN) 
print((sum(Noise_FP)))
print((sum(Noise_FN)))


# In[51]:


with open("results/RQ2_cases.txt","w") as file:
    file.write("Original Case1 = {}\n".format(case1o))
    file.write("Original Case2 = {}\n".format(case2o))
    file.write("Original Case3 = {}\n".format(case3o))
    file.write("Faulty Case1 = {}\n".format(case1f))
    file.write("Faulty Case2 = {}\n".format(case2f))
    file.write("Faulty Case3 = {}\n".format(case3f))
    
    file.write("Original Significant = {}\n".format(significanto))
    file.write("Faulty Significant = {}\n".format(significantf))
    file.write("Original Large = {}\n".format(effectsizeo))
    file.write("Faulty Large = {}\n".format(effectsizef))
    
    file.write("F1_filtered = {}\n".format(filteredF1))
    file.write("F1_Noise = {}\n".format(noiseF1))

    file.write("FalsePositives Filtered = {}\n".format(filterFP))
    file.write("FalseNegatives Filtered = {}\n".format(filterFN))

    file.write("FalsePositives Noise = {}\n".format(NoiseFP))
    file.write("FalseNegatives Noise = {}\n".format(NoiseFN))
    
    file.write("Total Inputs = {}\n".format(TotalInputs))


# In[ ]:




