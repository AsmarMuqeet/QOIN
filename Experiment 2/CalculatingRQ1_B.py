#!/usr/bin/env python
# coding: utf-8

# In[1]:


import random

import pandas as pd
from tqdm import *
from Abstract_Interface import BackendFactory
from benchmark_circuits import *
from util_imports import *
from sklearn.metrics import mean_absolute_error
import seaborn as sns
import matplotlib.pyplot as plt
from qiskit import Aer

backend_factory = BackendFactory()
names = backend_factory.get_backends_list()

backend_names = [('FakeAlmaden', 20), ('FakeBoeblingen', 20), ('FakeBrooklyn', 65), ('FakeCairo', 27), ('FakeCambridge', 28), ('FakeCambridgeAlternativeBasis', 28), ('FakeCasablanca', 7), ('FakeGuadalupe', 16), ('FakeHanoi', 27), ('FakeJakarta', 7), ('FakeJohannesburg', 20), ('FakeKolkata', 27), ('FakeLagos', 7), ('FakeManhattan', 65), ('FakeMontreal', 27), ('FakeMumbai', 27), ('FakeNairobi', 7), ('FakeParis', 27), ('FakeRochester', 53), ('FakeSingapore', 20), ('FakeSydney', 27), ('FakeToronto', 27), ('FakeWashington', 127)]
# i=5
#backend_f = backend_factory.initialize_backend(name="FakeCasablanca")
backend_f = backend_factory.initialize_backend()
#backend = Aer.get_backend('aer_simulator')
backend = backend_f
import warnings
warnings.filterwarnings('ignore')


# In[2]:


load_circuits()


# # Random circuits

# In[3]:


Results = []
bins = []
for program in tqdm(get_all_circuits()):
    #program = get_all_circuits()[0]
    algo = get_circuit_class_object(program)
    inp = algo.get_full_inputs()[0]
    result = algo.get_result(backend,inp)
    [bins.append(x["bin"]) for x in sorted(result["probability"],key=lambda x:x["bin"])]
    Results.append(sorted(result["probability"],key=lambda x:x["bin"]))


# In[4]:


outputs = []
for result in Results:
    r = [0]*len(set(bins))
    for i,b in enumerate(set(bins)):
        for rrr in result:
            if rrr["bin"]==b:
                r[i] = rrr["prob"]
    outputs.append(r)


# In[5]:


from scipy.spatial.distance import pdist, cdist
distances = cdist(np.array(outputs),np.array(outputs),metric="jensenshannon")


# In[6]:


import seaborn as sns


# In[7]:


ax = sns.kdeplot(np.mean(distances,axis=1),fill=True)
ax.set_xlabel("Avg Diversity")
figure = ax.get_figure()    
figure.savefig('results/random_circuits.png', dpi=600)


# In[8]:


len(np.mean(distances,axis=1))


# In[10]:


data = pd.DataFrame(columns=["Program","JSD","HL"])
HL = pd.read_csv("results/RQ1_HL_PP.csv")
JSD = np.mean(distances,axis=1)

#exclusion = "P16 P21 P83 P214 P216 P399 P456 P524 P543 P589 P617 P640 P671 P841 P857 P934 P960".split()
exclusion = []

for i,program in enumerate(get_all_circuits()):
    temp = HL[HL["Unnamed: 0"]==program]
    if temp.shape[0]>0 and program not in exclusion:
        hl = temp["Avg Filter HL"].values[0]
        data = data.append({"Program":program,"JSD":JSD[i],"HL":hl},ignore_index=True)


# In[11]:


data


# In[12]:


data["JSD"] = data["JSD"].round(1)


# In[13]:


bin_thresh = np.sort(data["JSD"].unique())


# In[14]:


bin_thresh


# In[15]:


data["bins"] = ""
data.loc[data[(data["JSD"]>0) & (data["JSD"]<=bin_thresh[0])].index,"bins"] = "{}".format(bin_thresh[0])
for i in range(len(bin_thresh)-1):
    data.loc[data[(data["JSD"]>bin_thresh[i]) & (data["JSD"]<=bin_thresh[i+1])].index,"bins"] = "{}".format(bin_thresh[i+1])


# In[16]:


data


# In[17]:


Bindata = pd.DataFrame(columns=["Group","PairwiseHL"])
for Bin in data["bins"].unique():
    df = abs(data[data["bins"]==Bin]["HL"].values - data[data["bins"]==Bin]["HL"].values[:, None])
    Bindata = Bindata.append({"Group":Bin,"PairwiseHL":df.mean()},ignore_index=True)
    print(Bin,df.mean())


# In[30]:


Bindata = Bindata.sort_values(by="Group")
Bindata["Counts"] = list(data["bins"].value_counts().sort_index())
Bindata.to_csv("results/RQ1_Diversity_PP.csv",index=False)


# In[ ]:




