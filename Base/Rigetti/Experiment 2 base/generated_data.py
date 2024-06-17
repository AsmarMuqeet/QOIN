import random
import pandas as pd
from tqdm import *
from Abstract_Interface import BackendFactory
from benchmark_circuits import *
from util_imports import *
import json

class NpEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, np.integer):
            return int(obj)
        if isinstance(obj, np.floating):
            return float(obj)
        if isinstance(obj, np.ndarray):
            return obj.tolist()
        return super(NpEncoder, self).default(obj)

backend_factory = BackendFactory()

backend_names = [('9q-square', 9)]
import warnings
warnings.filterwarnings('ignore')
load_circuits()


# In[ ]:


programs = get_all_circuits()
for program in programs:
    try:
        algo = get_circuit_class_object(program)
        m1 = get_circuit_class_object_mutation(program+"_M1")
        m2 = get_circuit_class_object_mutation(program+"_M2")
        m3 = get_circuit_class_object_mutation(program+"_M3")
        for bk,_ in tqdm(backend_names):
            filename = "./generated_data/{}_{}.json".format(bk,program)
            filename_m1 = "./generated_data/{}_{}.json".format(bk,program+"_M1")
            filename_m2 = "./generated_data/{}_{}.json".format(bk,program+"_M2")
            filename_m3 = "./generated_data/{}_{}.json".format(bk,program+"_M3")
        
            if os.path.isfile(filename) and os.path.isfile(filename_m1) and os.path.isfile(filename_m2) and os.path.isfile(filename_m3):
                continue
    
            backend_f = backend_factory.initialize_backend(name=bk)
            results = algo.get_result(backend_f,algo.get_full_inputs())
            results_m1 = m1.get_result(backend_f,algo.get_full_inputs())
            results_m2 = m2.get_result(backend_f,algo.get_full_inputs())
            results_m3 = m3.get_result(backend_f,algo.get_full_inputs())
            with open(filename,"w") as file:
                json.dump(results,file,cls=NpEncoder)
            with open(filename_m1,"w") as file:
                json.dump(results_m1,file,cls=NpEncoder)
            with open(filename_m2,"w") as file:
                json.dump(results_m2,file,cls=NpEncoder)
            with open(filename_m3,"w") as file:
                json.dump(results_m3,file,cls=NpEncoder)
            #break
        #break
    except Exception as e:
        print(e)
        continue