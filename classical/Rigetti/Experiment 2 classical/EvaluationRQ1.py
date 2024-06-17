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


class NpEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, np.integer):
            return int(obj)
        if isinstance(obj, np.floating):
            return float(obj)
        if isinstance(obj, np.ndarray):
            return obj.tolist()
        return super(NpEncoder, self).default(obj)

def getIntegers(startRange,upperlimit):
    return [x for x in range(startRange,startRange+upperlimit)]

def getallBinaryValues(number_bits):
    max_number = np.power(2,number_bits)-1
    data = []
    for x in range(0,max_number):
        value = bin(x).replace("0b","")
        value = "0"*(number_bits-len(value))+value
        data.append(value)
    return data

def getexpression(regex,upperlimit):
    return [exrex.getone(regex) for x in range(upperlimit)]


def generate_data(Format,startRange,endRange,percentage,regex,circuit):
    data = []
    if Format=="int":
        upperlimit = int(np.ceil((endRange-startRange)*percentage))
        data = getIntegers(startRange,upperlimit)
    if Format=="binary":
        upperlimit = int(np.ceil((endRange-startRange)*percentage))
        data = getallBinaryValues(startRange+upperlimit)
    if Format=="expression":
        upperlimit = int(np.ceil((math.factorial(startRange))*percentage))
        data = getexpression(regex,upperlimit)
    return data,circuit

def read_configuration(filepath):
    with open(filepath,"r") as file:
        content = file.read()
    rules = content.split("-"*20)
    rules_dict = {}
    for rule in rules:
        try:
            parameters = rule.split("\n")
            parameter_dict = {}
            for parameter in parameters:
                if parameter!="":
                    key,value = parameter.split(":")
                    value = value.strip()
                    if value.isdigit():
                        value = int(value)
                    else:
                        try:
                            value = float(value)
                        except:
                            pass
                    parameter_dict[key] = value
            rules_dict[parameter_dict.pop("ID")] = parameter_dict
        except:
            continue
    return rules_dict


# # Select CUTs

# In[2]:


backends = [('9q-square', 9)]
load_circuits()
BaselineCircuits,CUTs = train_test_split(get_all_circuits(),train_size=0.2,random_state=13)
BaselineCircuits,CUTs


# # Get Evaluation data for CUTs

# In[3]:


rules = read_configuration("Configuration.txt")
data_circuit_pairs = []
for baseline_circuit in CUTs:
    circuit = get_circuit_class_object(baseline_circuit)
    print("Generating data for CUT circuit: {}, ID:{}".format(baseline_circuit,circuit.key_aurguments["ID"]))
    rule = rules[circuit.key_aurguments["ID"]]
    data,circuit = generate_data(Format=rule["FORMAT"],startRange=rule["START"],
                                 endRange=rule["END"],percentage=rule["PERCENTAGE"],
                                 regex=rule["REGEX"],circuit=circuit)
    data_circuit_pairs.append((data,circuit,baseline_circuit))

#data_circuit_pairs

def convertNaQp2QuCAT_notation(output,value="prob"):
    program_specification = {}
    for x in output["probability"]:
        program_specification[x["bin"]] = x[value]
    return program_specification

# # Execute on Backends

# In[4]:


backend_factory = BackendFactory()
backend = backend_factory.initialize_backend()
for bk, qubit_size in tqdm(backends):

    print("Generating Data For {} Backend".format(bk))
    print("------------------------------------------")

    for data,circuit,name in data_circuit_pairs:
        noise_data = []
        #print("Executing CUT circuit ID: {}".format(circuit.key_aurguments["ID"]))

        if circuit.key_aurguments["input_type"]==1:
            inps = [inp for inp in data]
            Ideal = circuit.get_result(backend,inps)
            for inp in inps:
                
                ideal = convertNaQp2QuCAT_notation(Ideal[inp])
                ndata = open("./generated_data/{}_P{}.json".format(bk,circuit.key_aurguments["ID"]),"r")
                Noise_data = json.load(ndata)
                ndata.close()
                ndt = convertNaQp2QuCAT_notation(Noise_data[inp])
                Noise = [ndt for sd in range(10)]

                rep_noise = defaultdict(lambda:{"x":[],"y":[]})
                states = list(Noise[0].keys())
                for state in states:
                    for reps in Noise:
                        if state in reps.keys():
                            rep_noise[state]["x"].append([reps[state],0])
                        else:
                            rep_noise[state]["x"].append([0,0])
                    if state in ideal.keys():
                        rep_noise[state]["y"].append([ideal[state],0])
                    else:
                        rep_noise[state]["y"].append([0,0])

                Noise = {}
                for key in rep_noise.keys():
                    Noise[key] = rep_noise[key]
                
                
                noise_data.append({"{}".format(inp):Noise})

                

    # #-=-=-=-=-=-=-==-=-=-=-=-=-=-==-Saving json-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        with open("evaluation_data/{}_{}.json".format(bk,name),"w") as file:
            json.dump(noise_data,file,cls=NpEncoder)
        #break
    #break
