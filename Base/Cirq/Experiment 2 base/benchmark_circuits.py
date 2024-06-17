#!/usr/bin/env python
# coding: utf-8

# In[2]:


from util_imports import *
from Abstract_Interface import *
import random
import logging
import math
import textwrap

import pandas as pd
from qiskit import Aer
from qiskit import ClassicalRegister, QuantumRegister, QuantumCircuit
from qiskit.compiler import transpile
from qiskit.extensions import *
from qiskit.quantum_info.operators import Operator
from tqdm import *

logger = logging.getLogger(__name__)

def add_measurements(circ):
    cr = ClassicalRegister(3, 'c')
    circ.add_register(cr)
    circ.measure([0,1,2],[0,1,2])
    return circ

def make_circuit_instruction(circ):
    sub_circ = circ.remove_final_measurements(inplace=False)
    sub_inst = sub_circ.to_instruction()
    return sub_inst


class RandomCircuit(abstract_interface):

    def __init__(self,name="",**kwargs):
        self.key_aurguments = kwargs
        self.circ = QuantumCircuit.from_qasm_file("random_circuits/{}".format(name))

    def get_result(self, backend, input_data, number_of_runs=1024, seed=1997):
        #quantum_instance = QuantumInstance(backend, shots=number_of_runs, seed_transpiler=seed, seed_simulator=seed)

        """
        takes 3 bit binary string
        """
        if isinstance(input_data, list):
            circuits = []
            for inputs in input_data:
                sub_inst = make_circuit_instruction(self.circ)
                qr = QuantumRegister(len(self.circ.qubits), 'q')
                qc = QuantumCircuit(qr)
                for i,v in enumerate(inputs):
                    if v=="1":
                        qc.x(i)
                qc.append(sub_inst, self.circ.qubits)
                qc = add_measurements(qc)
                circuits.append(qc)
               
            results = backend.execute(circuits,shots=number_of_runs)
            total_data = {}
            for inputs,counts in zip(input_data,results):

                data = {"probability": []}
                for k, v in counts.items():
                    bin_str = k
                    dec_str = convert_to_int(k)
                    str_str = convert_to_str(k)
                    try:
                        odds = v / sum([value for key, value in counts.items() if key != k])
                        prob = v / sum([value for key, value in counts.items()])
                    except:
                        odds = 1
                        prob = 1
                    data["probability"].append({"bin": bin_str, "count": v, "odds": odds,"prob":prob})
                total_data[inputs] = data
            return total_data
            
        else:
            sub_inst = make_circuit_instruction(self.circ)
            qr = QuantumRegister(len(self.circ.qubits), 'q')
            qc = QuantumCircuit(qr)

            #define input:        
            for i,v in enumerate(input_data):
                if v=="1":
                    qc.x(i)

            qc.append(sub_inst, self.circ.qubits)
            qc = add_measurements(qc)
            self.circ = qc

            counts = backend.execute(self.circ,shots=number_of_runs)


            data = {"probability": []}
            for k, v in counts.items():
                bin_str = k
                dec_str = convert_to_int(k)
                str_str = convert_to_str(k)
                try:
                    odds = v / sum([value for key, value in counts.items() if key != k])
                    prob = v / sum([value for key, value in counts.items()])
                except:
                    odds = 1
                    prob = 1
                data["probability"].append({"bin": bin_str, "count": v, "odds": odds,"prob":prob})

        return data
    
    def get_inputs(self):
        a = [bin(x).replace("0b","") for x in range(2**2)]
        a = ["0"*(3-len(x))+x for x in a]
        return a
    
    def get_full_inputs(self):
        a = [bin(x).replace("0b","") for x in range(2**3)]
        a = ["0"*(3-len(x))+x for x in a]
        return a

    
    
    
import os

programs = {}
programs_with_mutation = {}

def load_circuits(selection=False):
    if selection:
        with open("selected_circuits.txt","r") as file:
            names = sorted(file.read().replace("\n","").split(","))
            for name in tqdm(names):
                name = name.split(".")[0]
                programs[name] = RandomCircuit(name+".qasm",ID=int(name.replace("P","")),input_type=1)
                mutant = name
                programs_with_mutation[mutant+"_M1"] = RandomCircuit(mutant+"_M1.qasm",ID=int(name.replace("P","")),input_type=1)
                programs_with_mutation[mutant+"_M2"] = RandomCircuit(mutant+"_M2.qasm",ID=int(name.replace("P","")),input_type=1)
                programs_with_mutation[mutant+"_M3"] = RandomCircuit(mutant+"_M3.qasm",ID=int(name.replace("P","")),input_type=1)
    else:
        names = sorted([x for x in os.listdir("./random_circuits/") if "_M" not in x])
        for name in tqdm(names):
            name = name.split(".")[0]
            programs[name] = RandomCircuit(name+".qasm",ID=int(name.replace("P","")),input_type=1)
            mutant = name
            programs_with_mutation[mutant+"_M1"] = RandomCircuit(mutant+"_M1.qasm",ID=int(name.replace("P","")),input_type=1)
            programs_with_mutation[mutant+"_M2"] = RandomCircuit(mutant+"_M2.qasm",ID=int(name.replace("P","")),input_type=1)
            programs_with_mutation[mutant+"_M3"] = RandomCircuit(mutant+"_M3.qasm",ID=int(name.replace("P","")),input_type=1)

    
def get_circuit_class_object(name=""):
    return programs[name]

def get_circuit_class_object_mutation(name=""):
    return programs_with_mutation[name]

def get_all_circuits():
    return list(programs.keys())