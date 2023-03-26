from util_imports import *


class expression(abstract_interface):

    def __init__(self, **kwargs):
        self.key_aurguments = kwargs

    def get_result(self, backend, input_data, number_of_runs=1024, seed=1997):
        quantum_instance = QuantumInstance(backend, shots=number_of_runs, seed_transpiler=seed, seed_simulator=seed)

        def is_good_state(bitstr):
            return sum(map(int, bitstr)) == 2

        oracle = PhaseOracle(input_data)
        problem = AmplificationProblem(oracle=oracle, is_good_state=oracle.evaluate_bitstring)
        grover = Grover(quantum_instance=quantum_instance)
        result = grover.amplify(problem)
        circ = grover.construct_circuit(problem, result.iterations[0], measurement=True)
        if self.key_aurguments["circuit"]:
            self.key_aurguments["circuit"] = circ

        counts = result.circuit_results[0]

        data = {"probability": [], "output": result.top_measurement}
        for k, v in counts.items():
            bin_str = k
            dec_str = convert_to_int(k)
            str_str = convert_to_str(k)
            try:
                odds = v / sum([value for key, value in counts.items() if key != k])
                prob = v / sum([value for key, value in counts.items()])
            except:
                odds = 1
            data["probability"].append({"bin": bin_str, "dec": dec_str, "ascii": str_str, "count": v, "odds": odds,"prob":prob})

        return data

    def get_collective_result(self, backend, input_data, number_of_runs=1024, seed=1997, iterations=2):
        return [self.get_result(backend, input_data, number_of_runs, seed) for x in range(iterations)]

    def get_happy_scene(self):
        return {"input": '(a & b)& ~(c)', "output": "011", "probability": [
            {'bin': '011', 'dec': 3, 'ascii': '\x03', 'count': 784, 'odds': 3.2666666666666666, 'prob': 0.765625},
            {'bin': '001', 'dec': 1, 'ascii': '\x01', 'count': 38, 'odds': 0.038539553752535496, 'prob': 0.037109375},
            {'bin': '000', 'dec': 0, 'ascii': '\x00', 'count': 39, 'odds': 0.03959390862944162, 'prob': 0.0380859375},
            {'bin': '111', 'dec': 7, 'ascii': '\x07', 'count': 37, 'odds': 0.037487335359675786, 'prob': 0.0361328125},
            {'bin': '010', 'dec': 2, 'ascii': '\x02', 'count': 29, 'odds': 0.02914572864321608, 'prob': 0.0283203125},
            {'bin': '101', 'dec': 5, 'ascii': '\x05', 'count': 26, 'odds': 0.026052104208416832, 'prob': 0.025390625},
            {'bin': '110', 'dec': 6, 'ascii': '\x06', 'count': 37, 'odds': 0.037487335359675786, 'prob': 0.0361328125},
            {'bin': '100', 'dec': 4, 'ascii': '\x04', 'count': 34, 'odds': 0.03434343434343434, 'prob': 0.033203125}
            ]}