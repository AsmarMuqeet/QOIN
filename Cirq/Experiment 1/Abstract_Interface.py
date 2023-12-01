from abc import abstractmethod
import cirq
import cirq_google
import qsimcirq
import pickle
from qbraid.transpiler import convert_to_cirq
import numpy as np


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
            self.sim = cirq.Simulator(seed=1997)
            
        self.noise = noise
        self.seed = 1997

    def execute(self,circuit,shots=1024):

        cirq_qc,_ = convert_to_cirq(circuit)
        np.random.seed(self.seed)
        
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
            result = convert_cirq_result(self.sim.run(cirq_qc_device_ready,repetitions=shots))
            return result
        else:
            result = convert_cirq_result(self.sim.run(cirq_qc,repetitions=shots))
            return result




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