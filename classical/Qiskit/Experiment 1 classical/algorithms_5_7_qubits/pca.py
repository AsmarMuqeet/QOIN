from util_imports import *


class pca(abstract_interface):

    def __init__(self, **kwargs):
        self.key_aurguments = kwargs

    def get_result(self, backend, input_data, number_of_runs=1024, seed=1997):
        quantum_instance = QuantumInstance(backend, shots=number_of_runs, seed_transpiler=seed, seed_simulator=seed)

        X_1 = input_data[0]
        X_2 = input_data[1]
        X_1 = X_1 - np.average(X_1)
        X_2 = (X_2 - np.average(X_2)) / 1000

        M = np.array([[np.dot(X_1, X_1), np.dot(X_1, X_2)], [np.dot(X_2, X_1), np.dot(X_2, X_2)]]) / (len(X_1) - 1)

        rho = M / np.trace(M)

        rho_eig_val, rho_eig_vec = np.linalg.eig(rho)
        p_vec = np.concatenate((np.sqrt(rho_eig_val), np.sqrt(rho_eig_val)), axis=0)
        U_vec = rho_eig_vec.reshape((4))
        psi = p_vec * U_vec
        rho_partial_trace = np.dot(psi.reshape((2, 2)), psi.reshape((2, 2)).transpose())

        circ = QuantumCircuit(5, 1)
        circ.initialize([1, 0], (0,))
        circ.initialize(psi, (1, 2))
        circ.initialize(psi, (3, 4))
        circ.h(0)
        circ.cswap(0, 1, 3)
        circ.h(0)
        circ.measure(0, 0)
        circ.draw()

        # Tell simulator to save statevector
        circ.save_statevector()
        result = quantum_instance.execute(circ)
        counts = result.get_counts()

        purity = (counts['0'] - counts['1']) / (counts['0'] + counts['1'])
        m_1 = (1 + np.sqrt(2 * purity - 1)) / 2 * np.trace(M)
        m_2 = (1 - np.sqrt(2 * purity - 1)) / 2 * np.trace(M)

        data = {"probability": [], "output": [m_1,m_2]}
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
        return {"input": [[4,3,4,4,3,3,3,3,4,4,4,5,4,3,4],[3028,1365,2726,2538,1318,1693,1412,1632,2875,3564,4412,4444,4278,3064,3857]], "output": [1.582322381513124, 0.09556363753449515], "probability": [
            {'bin': '0', 'dec': 0, 'ascii': '\x00', 'count': 969, 'odds': 17.618181818181817, 'prob': 0.9462890625},
            {'bin': '1', 'dec': 1, 'ascii': '\x01', 'count': 55, 'odds': 0.05675954592363261, 'prob': 0.0537109375}
            ]}