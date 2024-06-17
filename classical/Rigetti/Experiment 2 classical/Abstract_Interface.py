from abc import abstractmethod
import pickle
from qbraid.transpiler import convert_to_cirq, conversions
import numpy as np
from pyquil import get_qc
from qiskit import Aer, transpile
import pyquil as pquil
from multiprocessing.pool import ThreadPool
import sys
sys.setrecursionlimit(sys.getrecursionlimit()*2)

    

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


class RigettiBackends:

    def __init__(self, noise=False, model=None):
        if noise:
            self.sim = get_qc('9q-square', as_qvm=True, noisy=True,
                              compiler_timeout=300, execution_timeout=300)
        else:
            self.sim = Aer.get_backend('aer_simulator')
        self.noise = noise
        self.seed = 1997
        self.shots = 1024
        
    def execute_one(self, onecirc):
        cirq_qc, _ = convert_to_cirq(onecirc)
        circ = conversions.to_pyquil(cirq_qc)
        np.random.seed(self.seed)
        answer = {}
        temp = circ.instructions.copy()
        for x in circ.instructions:
            if isinstance(x, pquil.quilbase.Measurement):
                temp.remove(x)
        for x in circ.instructions:
            if isinstance(x, pquil.quilbase.Measurement):
                temp.append(x)
    
        circ = pquil.Program(temp)
        circ.wrap_in_numshots_loop(self.shots)
        
        result = self.sim.run(self.sim.compile(circ))
        bitstrings = np.apply_along_axis(''.join, 0, [x.astype(str) for x in result.readout_data.values()])
        keys, counts = np.unique(bitstrings, return_counts=True)
        answer = dict(zip(keys, counts))
        return answer

    def execute(self, circuit, shots=1024):
        self.shots = shots
        if isinstance(circuit, list):
            circuit_results = []
            if self.noise:
                with ThreadPool(len(circuit)) as pool:
                    answer = pool.map(self.execute_one, circuit)
                for onecirc,ans in zip(circuit,answer):
                    qubits = onecirc.num_qubits
                    #cirq_qc, _ = convert_to_cirq(onecirc)
                    #circ = conversions.to_pyquil(cirq_qc)
                    #np.random.seed(self.seed)
                    #answer = {}
                    #temp = circ.instructions.copy()
                    #for x in circ.instructions:
                    #    if isinstance(x, pquil.quilbase.Measurement):
                    #        temp.remove(x)
                    #for x in circ.instructions:
                    #    if isinstance(x, pquil.quilbase.Measurement):
                    #        temp.append(x)

                    #circ = pquil.Program(temp)
                    #circ.wrap_in_numshots_loop(shots)
                    #result = self.sim.run(self.sim.compile(circ))
                    #bitstrings = np.apply_along_axis(
                    #    ''.join, 0, [x.astype(str) for x in result.readout_data.values()])
                    #keys, counts = np.unique(bitstrings, return_counts=True)
                    #answer = dict(zip(keys, counts))
                    #answer = {"".join((["0"]*(qubits-len(k)))+list(k)): v for k, v in answer.items()}
                    #circuit_results.append(answer)
                    temp_answer = {"".join((["0"]*(qubits-len(k)))+list(k)): v for k, v in ans.items()}
                    circuit_results.append(temp_answer)
                    
            else:
                circ_trans = transpile(
                    circuit, backend=self.sim, seed_transpiler=self.seed)
                answer = self.sim.run(
                    circ_trans, shots=shots, seed_simulator=self.seed).result().get_counts()
                    
                for circ,ans in zip(circuit,answer):
                    qubits = circ.num_qubits
                    temp_answer = {"".join((["0"]*(qubits-len(k)))+list(k)): v for k, v in ans.items()}
                    circuit_results.append(temp_answer)
            return circuit_results

        else:
            qubits = circuit.num_qubits
            cirq_qc, _ = convert_to_cirq(circuit)
            circ = conversions.to_pyquil(cirq_qc)
            np.random.seed(self.seed)
            answer = {}
            if self.noise:
                temp = circ.instructions.copy()
                for x in circ.instructions:
                    if isinstance(x, pquil.quilbase.Measurement):
                        temp.remove(x)
                for x in circ.instructions:
                    if isinstance(x, pquil.quilbase.Measurement):
                        temp.append(x)

                circ = pquil.Program(temp)
                circ.wrap_in_numshots_loop(shots)
                result = self.sim.run(self.sim.compile(circ))
                bitstrings = np.apply_along_axis(
                    ''.join, 0, [x.astype(str) for x in result.readout_data.values()])
                keys, counts = np.unique(bitstrings, return_counts=True)
                answer = dict(zip(keys, counts))
            else:
                circ_trans = transpile(
                    circuit, backend=self.sim, seed_transpiler=self.seed)
                answer = self.sim.run(
                    circ_trans, shots=shots, seed_simulator=self.seed).result().get_counts()

            answer = {"".join((["0"]*(qubits-len(k)))+list(k)): v for k, v in answer.items()}
            return answer


class BackendFactory:

    def __init__(self):

        backends = {}
        for processor_id in ["9q-square"]:
            backends[processor_id] = "9q-square"

        self.backends = backends

    def get_backends_list(self):
        return list(self.backends.keys())

    def initialize_backend(self, name=None, real=None):
        if name == None:
            return RigettiBackends()
        else:
            return RigettiBackends(noise=True, model=self.backends[name])
