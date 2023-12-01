from util_imports import *


class addition(abstract_interface):

    def __init__(self, **kwargs):
        self.key_aurguments = kwargs

    def get_result(self, backend, input_data, number_of_runs=1024, seed=1997):
        quantum_instance = QuantumInstance(backend, shots=number_of_runs, seed_transpiler=seed, seed_simulator=seed)

        def get_addition_circuit(a, b):
            first = bin(a)[2:]
            second = bin(b)[2:]
            answer = bin(a + b)[2:]

            l = len(first)
            l2 = len(second)
            if l > l2:
                n = l
            else:
                n = l2
            # Initializing the registers; two quantum registers with n bits each
            # 1 more with n+1 bits, which will also hold the sum of the two #numbers
            # The classical register has n+1 bits, which is used to make the sum #readable
            a = QuantumRegister(n)  # First number
            b = QuantumRegister(n + 1)  # Second number, then sum
            c = QuantumRegister(n)  # Carry bits
            cl = ClassicalRegister(n + 1)  # Classical output
            # Combining all of them into one quantum circuit
            qc = QuantumCircuit(a, b, c, cl)

            # Setting up the registers using the values inputted
            for i in range(l):
                if first[i] == "1":
                    qc.x(a[l - (i + 1)])  # Flip the qubit from 0 to 1
            for i in range(l2):
                if second[i] == "1":
                    qc.x(b[l2 - (i + 1)])  # Flip the qubit from 0 to 1

            # Implementing a carry gate that is applied on all (c[i], a[i], b[i]) #with output fed to c[i+1]
            for i in range(n - 1):
                qc.ccx(a[i], b[i], c[i + 1])
                qc.cx(a[i], b[i])
                qc.ccx(c[i], b[i], c[i + 1])

            # For the last iteration of the carry gate, instead of feeding the #result to c[n], we use b[n], which is why c has only n bits, with #c[n-1] being the last carry bit
            qc.ccx(a[n - 1], b[n - 1], b[n])
            qc.cx(a[n - 1], b[n - 1])
            qc.ccx(c[n - 1], b[n - 1], b[n])

            # Reversing the gate operation performed on b[n-1]
            qc.cx(c[n - 1], b[n - 1])
            # Reversing the gate operations performed during the carry gate implementations
            # This is done to ensure the sum gates are fed with the correct input bit states
            for i in range(n - 1):
                qc.ccx(c[(n - 2) - i], b[(n - 2) - i], c[(n - 1) - i])
                qc.cx(a[(n - 2) - i], b[(n - 2) - i])
                qc.ccx(a[(n - 2) - i], b[(n - 2) - i], c[(n - 1) - i])
                # These two operations act as a sum gate; if a control bit is at
                # the 1> state then the target bit b[(n-2)-i] is flipped
                qc.cx(c[(n - 2) - i], b[(n - 2) - i])
                qc.cx(a[(n - 2) - i], b[(n - 2) - i])

            # Measure qubits and store results in classical register cl
            for i in range(n + 1):
                qc.measure(b[i], cl[i])

            return qc, answer

        circ, key = get_addition_circuit(input_data[0], input_data[1])
        if self.key_aurguments["circuit"]:
            self.key_aurguments["circuit"] = circ
        result = quantum_instance.execute(circ)
        counts = result.get_counts()


        data = {"probability": [], "output": ""}
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
            data["probability"].append({"bin": bin_str, "dec": dec_str, "ascii": str_str, "count": v, "odds": odds,"prob":prob})

        for d in data["probability"]:
            if d["dec"]==sum(input_data):
                data["output"] = d["bin"]

        return data

    def get_collective_result(self, backend, input_data, number_of_runs=1024, seed=1997, iterations=2):
        return [self.get_result(backend, input_data, number_of_runs, seed) for x in range(iterations)]

    def get_happy_scene(self):
        return {"input": [1,1], "output": "10", "probability": [
            {'bin': '011', 'dec': 3, 'ascii': '\x03', 'count': 1024, 'odds': 1, 'prob': 1}
            ]}