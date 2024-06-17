from util_imports import *


class GHZ(abstract_interface):

    def __init__(self, **kwargs):
        self.key_aurguments = kwargs

    def get_result(self, backend, input_data, number_of_runs=1024, seed=1997):
        quantum_instance = QuantumInstance(backend, shots=number_of_runs, seed_transpiler=seed, seed_simulator=seed)

        circ = QuantumCircuit(input_data, input_data)
        initial_state = [1, 0]  # Define initial_state as |0>
        circ.initialize(initial_state, 0)
        circ.h(0)
        circ.cx(0, 1)
        circ.cx(1, 2)
        circ.measure([0, 1, 2], [0, 1, 2])
        if self.key_aurguments["circuit"]:
            self.key_aurguments["circuit"] = circ
        result = quantum_instance.execute(circ)
        counts = result.get_counts()

        data = {"probability": [], "output": ["0"*input_data,"0"*(input_data-3)+"111"]}
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
        return {"input": 3, "output": ["000", "111"], "probability": [
            {'bin': '111', 'dec': 7, 'ascii': '\x07', 'count': 517, 'odds': 1.0197238658777121, 'prob': 0.5048828125},
            {'bin': '000', 'dec': 0, 'ascii': '\x00', 'count': 507, 'odds': 0.9806576402321083, 'prob': 0.4951171875}
            ]}