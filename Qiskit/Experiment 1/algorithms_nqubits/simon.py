from util_imports import *

class simon(abstract_interface):

    def __init__(self, **kwargs):
        self.key_aurguments = kwargs

    def get_result(self, backend, input_data, number_of_runs=1024, seed=1997):
        quantum_instance = QuantumInstance(backend, shots=number_of_runs, seed_transpiler=seed, seed_simulator=seed)

        b = input_data
        n = len(b)
        simon_circuit = QuantumCircuit(n * 2, n)
        # Apply Hadamard gates before querying the oracle
        simon_circuit.h(range(n))
        simon_circuit.h(0)
        # Apply barrier for visual separation
        simon_circuit.barrier()
        simon_circuit += simon_oracle(b)
        # Apply barrier for visual separation
        simon_circuit.barrier()
        # Apply Hadamard gates to the input register
        simon_circuit.h(range(n))
        # Measure qubits
        simon_circuit.measure(range(n), range(n))
        if self.key_aurguments["circuit"]:
            self.key_aurguments["circuit"] = simon_circuit

        result = quantum_instance.execute(simon_circuit)

        def bdotz(b, z):
            accum = 0
            for i in range(len(b)):
                accum += int(b[i]) * int(z[i])
            return (accum % 2)

        counts = result.get_counts()
        output = []
        for z in counts:
            if bdotz(b, z)==0:
                output.append(z)

        data = {"probability": [], "output": output}
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
        return {"input": "110", "output": ['110', '000', '111', '001'], "probability": [
            {'bin': '110', 'dec': 6, 'ascii': '\x06', 'count': 247, 'odds': 0.3178893178893179, 'prob': 0.2412109375},
            {'bin': '000', 'dec': 0, 'ascii': '\x00', 'count': 252, 'odds': 0.32642487046632124, 'prob': 0.24609375},
            {'bin': '111', 'dec': 7, 'ascii': '\x07', 'count': 262, 'odds': 0.3438320209973753, 'prob': 0.255859375},
            {'bin': '001', 'dec': 1, 'ascii': '\x01', 'count': 263, 'odds': 0.3455978975032852, 'prob': 0.2568359375}
            ]}