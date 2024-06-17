from abc import abstractmethod
import cirq
import cirq_google
import qsimcirq
import pickle
from qbraid.transpiler import convert_to_cirq
import numpy as np
from qiskit import Aer, transpile
from tqdm import *
import sys
sys.setrecursionlimit(sys.getrecursionlimit()*2)


def convert_cirq_result(samples):
    columns = samples.data.columns
    samples.data['merged_column'] = samples.data[columns].astype(str).agg(''.join, axis=1)
    key,count = np.unique(samples.data["merged_column"].values,return_counts=True)
    result = {}
    for k,c in zip(key,count):
        result[k] = c
    return result

class abstract_interface:

    @abstractmethod
    def get_result(self, backend, input_data, number_of_runs, seed):
        raise NotImplementedError("Please Implement this method")

    @abstractmethod
    def get_collective_result(self, backend, input_data, number_of_runs, seed, iterations):
        raise NotImplementedError("Please Implement this method")

    @abstractmethod
    def get_happy_scene(self):
        raise NotImplementedError("Please Implement this method")




class CirqBackends:

    def __init__(self,noise=False,model=None):
        if noise:
            self.sim = qsimcirq.QSimSimulator(noise=model,seed=1997)
        else:
            self.sim = Aer.get_backend('aer_simulator')
        self.noise = noise
        self.seed = 1997

    def execute(self,circuit,shots=1024):
        if isinstance(circuit, list):
            circuit_result = []
            if self.noise:
                cirq_qc_device_ready_list = []
                for circ in circuit:
                    cirq_qc,_ = convert_to_cirq(circ)
                    np.random.seed(self.seed)
                    device_qubits = []
                    device_qubits.append(cirq.GridQubit(5,2))
                    device_qubits.append(cirq.GridQubit(5,3))
                    device_qubits.append(cirq.GridQubit(5,4))
                    device_qubits.append(cirq.GridQubit(6,2))
                    device_qubits.append(cirq.GridQubit(6,3))
                    device_qubits.append(cirq.GridQubit(6,4))
                    device_qubits.append(cirq.GridQubit(6,5))
                    
                    cirq_qc_translated = cirq.optimize_for_target_gateset(cirq_qc,
                                                              context=cirq.TransformerContext(deep=True),
                                                              gateset=cirq.SqrtIswapTargetGateset())
                    
                    qubit_map = dict(zip(cirq_qc_translated.all_qubits(),device_qubits))
                    cirq_qc_device_ready = cirq_qc_translated.transform_qubits(lambda q: qubit_map[q])
                    cirq_qc_device_ready_list.append(cirq_qc_device_ready)
                
                answer = self.sim.run_batch(cirq_qc_device_ready_list,repetitions=shots)
                for ans,circ in zip(answer,circuit):
                    qubits = circ.num_qubits
                    ans_converted = convert_cirq_result(ans[0])
                    result = { "".join((["0"]*(qubits-len(k)))+list(k)): v for k, v in ans_converted.items() }
                    circuit_result.append(result)
            else:
                circ_trans = transpile(circuit,backend=self.sim,seed_transpiler=self.seed)
                answer = self.sim.run(circ_trans,shots=shots,seed_simulator=self.seed).result().get_counts()
                #print("ideal:answer",answer)
                for ans,circ in zip(answer,circuit):
                    qubits = circ.num_qubits
                    result = { "".join((["0"]*(qubits-len(k)))+list(k)): v for k, v in ans.items() }
                    circuit_result.append(result)
                    
            return circuit_result

        else:
            cirq_qc,_ = convert_to_cirq(circuit)
            np.random.seed(self.seed)
            qubits = circuit.num_qubits
            
            if self.noise:
                device_qubits = []
                device_qubits.append(cirq.GridQubit(5,2))
                device_qubits.append(cirq.GridQubit(5,3))
                device_qubits.append(cirq.GridQubit(5,4))
                device_qubits.append(cirq.GridQubit(6,2))
                device_qubits.append(cirq.GridQubit(6,3))
                device_qubits.append(cirq.GridQubit(6,4))
                device_qubits.append(cirq.GridQubit(6,5))
                
                cirq_qc_translated = cirq.optimize_for_target_gateset(cirq_qc,
                                                          context=cirq.TransformerContext(deep=True),
                                                          gateset=cirq.SqrtIswapTargetGateset())
                
                qubit_map = dict(zip(cirq_qc_translated.all_qubits(),device_qubits))
                cirq_qc_device_ready = cirq_qc_translated.transform_qubits(lambda q: qubit_map[q])
                answer = convert_cirq_result(self.sim.run(cirq_qc_device_ready,repetitions=shots))
                answer = { "".join((["0"]*(qubits-len(k)))+list(k)): v for k, v in answer.items() }
                return answer
            else:
                circ_trans = transpile(circuit,backend=self.sim,seed_transpiler=self.seed)
                answer = self.sim.run(circ_trans,shots=shots,seed_simulator=self.seed).result().get_counts()
                answer = { "".join((["0"]*(qubits-len(k)))+list(k)): v for k, v in answer.items() }
                return answer




class BackendFactory:

    def __init__(self):

        backends = {}
        for processor_id in ["rainbow","weber"]:
            # Load the calibration data
            with open("{}.pkl".format(processor_id),"rb") as file:
                cal = pickle.load(file)
            # Turn calibration data into a noise properties object
            noise_props = cirq_google.noise_properties_from_calibration(cal)
            # Build a noise model from the noise properties
            noise_model = cirq_google.NoiseModelFromGoogleNoiseProperties(noise_props)
            backends[processor_id] = noise_model

        self.backends = backends

    def get_backends_list(self):
        return list(self.backends.keys())

    def initialize_backend(self,name=None,real=None):
        if name==None:
            return CirqBackends()
        else:
            return CirqBackends(noise=True,model = self.backends[name])