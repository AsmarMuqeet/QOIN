import os
os.environ["CUDA_DEVICE_ORDER"]="PCI_BUS_ID";
os.environ["CUDA_VISIBLE_DEVICES"]="0"; 
import urllib.request
import pandas as pd
import numpy as np
import time
from sklearn.model_selection import train_test_split
from tqdm import *
pd.set_option('display.max_columns', None)

from benchmark_circuits import *
import random
import pkgutil
import warnings
import exrex
import math
import json
import scipy.stats as stats
from sklearn.metrics import mean_absolute_error
from collections import defaultdict
warnings.filterwarnings('ignore')


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


backends = [('FakeAlmaden', 20), ('FakeBoeblingen', 20), ('FakeBrooklyn', 65), ('FakeCairo', 27), ('FakeCambridge', 28), ('FakeCambridgeAlternativeBasis', 28), ('FakeCasablanca', 7), ('FakeGuadalupe', 16), ('FakeHanoi', 27), ('FakeJakarta', 7), ('FakeJohannesburg', 20), ('FakeKolkata', 27), ('FakeLagos', 7), ('FakeManhattan', 65), ('FakeMontreal', 27), ('FakeMumbai', 27), ('FakeNairobi', 7), ('FakeParis', 27), ('FakeRochester', 53), ('FakeSingapore', 20), ('FakeSydney', 27), ('FakeToronto', 27), ('FakeWashington', 127)]
BaselineCircuits,CUTs = train_test_split(get_all_circuits(),train_size=0.4,random_state=13)


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
    
def convertNaQp2QuCAT_notation(output,value="prob"):
    program_specification = {}
    for x in output["probability"]:
        program_specification[x["bin"]] = x[value]
    return program_specification

# # Execute on Backends
backend_factory = BackendFactory()
backend = backend_factory.initialize_backend()
backend_executor = {}
for bk, qubit_size in tqdm(backends):
    backend_executor[bk] = backend_factory.initialize_backend(bk)
    
for bk, qubit_size in tqdm(backends):

    print("Generating Data For {} Backend".format(bk))
    print("------------------------------------------")

    for data,circuit,name in data_circuit_pairs:
        noise_data = []
        ideal_data = []
        print("Executing CUT circuit ID: {}".format(circuit.key_aurguments["ID"]))

        if circuit.key_aurguments["input_type"]==1:
            for inp in data:
                ideal = convertNaQp2QuCAT_notation(circuit.get_result(backend,inp))
                ndt = convertNaQp2QuCAT_notation(circuit.get_result(backend_executor[bk],inp))
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

        elif circuit.key_aurguments["input_type"]==2:
            pairs = [[x,y] for y in data for x in data]
            for inp in pairs:
                ideal = convertNaQp2QuCAT_notation(circuit.get_result(backend,inp))
                ndt = convertNaQp2QuCAT_notation(circuit.get_result(backend_executor[bk],inp))
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
                    
                noise_data.append({"{}:{}".format(inp[0],inp[1]):Noise})

    # #-=-=-=-=-=-=-==-=-=-=-=-=-=-==-Saving json-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        file = open("evaluation_data/{}_{}.json".format(bk,name),"w")
        json.dump(noise_data,file)
        file.close()
        #break
    #break