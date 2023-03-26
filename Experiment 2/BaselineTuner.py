#!/usr/bin/env python
# coding: utf-8

# In[1]:


#get_ipython().run_line_magic('reload_ext', 'autoreload')
#get_ipython().run_line_magic('autoreload', '2')
#get_ipython().run_line_magic('matplotlib', 'inline')
import os
os.environ["CUDA_DEVICE_ORDER"]="PCI_BUS_ID";
os.environ["CUDA_VISIBLE_DEVICES"]="0"; 

import urllib.request
import pandas as pd
import numpy as np
import time
import ktrain
from ktrain import tabular
from sklearn.model_selection import train_test_split
from tqdm import *
import json
#pd.set_option('display.max_columns', None)


# In[2]:


from benchmark_circuits import *
import random
import pandas as pd
from tqdm import *
import pkgutil
import warnings
import exrex
import math
import time
load_circuits()
warnings.filterwarnings('ignore')


# # Select CUTs

# In[3]:


backends = [('FakeAlmaden', 20), ('FakeBoeblingen', 20), ('FakeBrooklyn', 65), ('FakeCairo', 27), ('FakeCambridge', 28), ('FakeCambridgeAlternativeBasis', 28), ('FakeCasablanca', 7), ('FakeGuadalupe', 16), ('FakeHanoi', 27), ('FakeJakarta', 7), ('FakeJohannesburg', 20), ('FakeKolkata', 27), ('FakeLagos', 7), ('FakeManhattan', 65), ('FakeMontreal', 27), ('FakeMumbai', 27), ('FakeNairobi', 7), ('FakeParis', 27), ('FakeRochester', 53), ('FakeSingapore', 20), ('FakeSydney', 27), ('FakeToronto', 27), ('FakeWashington', 127)]
BaselineCircuits,CUTs = train_test_split(get_all_circuits(),train_size=0.2,random_state=13)
len(BaselineCircuits),len(CUTs)


# # Start Transfer learning

# In[5]:

backend_factory = BackendFactory()
backend = backend_factory.initialize_backend()
for cut in tqdm(CUTs):
    print("Current circuit: ",cut)
    circuit = get_circuit_class_object(cut)
    test_inputs = circuit.get_inputs()
    bkiter = 0
    while bkiter<len(backends):
    #for bk, qubit_size in backends:
        try:
            bk, qubit_size = backends[bkiter]
            data_rows = []
            single_row = []

            print("Generating Data For {} Backend".format(bk))
            print("------------------------------------------")

            print("Executing CUT circuit ID: {}".format(circuit.key_aurguments["ID"]))
            start_time = time.time()

    #         for iteration in tqdm(range(100)):
            inps = [test_inputs[iteration%len(test_inputs)] for iteration in range(100)]
            Ideal = circuit.get_result(backend,inps)
            for inp in inps:
                ideal = Ideal[inp]
                ndata = open("./generated_data/{}_P{}.json".format(bk,circuit.key_aurguments["ID"]),"r")
                noise_data = json.load(ndata)
                ndata.close()
                Noise = noise_data[inp]

                for outputs in ideal["probability"]:
                    target_variable_prob = None
                    target_variable_odds = None
                    actual_target_prob = outputs["prob"]
                    all_other_probs = 0
                    for noise_outputs in Noise["probability"]:
                        if outputs["bin"] == noise_outputs["bin"]:
                            target_variable_prob = noise_outputs["prob"]
                            target_variable_odds = noise_outputs["odds"]
                        else:
                            all_other_probs += noise_outputs["prob"]
                    temp_row = [x for x in single_row]
                    temp_row.extend([all_other_probs,target_variable_odds,target_variable_prob,actual_target_prob])
                    data_rows.append(temp_row)

                #0----0-0-----------0-0-00000000000000-0-0-00000000000000000--0-0----------------
                for outputs in Noise["probability"]:
                    if outputs["bin"] not in [x["bin"] for x in ideal["probability"]]:
                        target_variable_prob = None
                        target_variable_odds = None
                        actual_target_prob = 0
                        all_other_probs = 0
                        for noise_outputs in Noise["probability"]:
                            if outputs["bin"] == noise_outputs["bin"]:
                                target_variable_prob = noise_outputs["prob"]
                                target_variable_odds = noise_outputs["odds"]
                            else:
                                all_other_probs += noise_outputs["prob"]
                        temp_row = [x for x in single_row]
                        temp_row.extend([all_other_probs,target_variable_odds,target_variable_prob,actual_target_prob])
                        data_rows.append(temp_row)
        except Exception as e:
            print("Exception occured..")
            print(e)
            print("Retrying for bk ",bk)
            continue
        bkiter+=1


        # #-=-=-=-=-=-=-==-=-=-=-=-=-=-==-Appending to CSV-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

        columns = []
        columns.extend(["POF","ODR","POS","Target Value"])
        data_frame = pd.DataFrame(data_rows,columns=columns)
        data_frame.to_csv("baseline_tunning_data/{}_{}.csv".format(bk,cut),index=False)
        
            
        # Transfer learning
        bkfile = "baseline_tunning_data/{}_{}.csv".format(bk,cut)
        train_df = pd.read_csv(bkfile)
        train_df = train_df.dropna()
        trn, val, preproc = tabular.tabular_from_df(train_df, is_regression=True, 
                                                     label_columns='Target Value', random_state=42)
        
        print("Loading baseline model for backend ",bk)
        predictor = ktrain.load_predictor('baseline_models/{}_baseline'.format(bk))
        
        model = predictor.model
        
        learner = ktrain.get_learner(model, train_data=trn, val_data=val, batch_size=16)

        #learner.lr_find(show_plot=True, max_epochs=16)
        
        print("Strating transfer learning")

        learner.autofit(1e-3)

        epochs = len(learner.history.history["loss"])

        fig = learner.plot(return_fig=True)
        fig.savefig("figures/loss_{}_{}.png".format(bk,cut),dpi=400)

        trainingloss = learner.evaluate(test_data=trn)[0][-1]

        validationloss = learner.evaluate()[0][-1]


        ktrain.get_predictor(learner.model, preproc).save('tunning_models/{}_{}'.format(bk,cut))

        file =  open("baseline_tunning_data/{}_{}_ToT.csv".format(bk,cut),"w")
        file.write(",".join([str(trainingloss),str(validationloss),str(time.time()-start_time),str(epochs)]))
        file.close()
            


# In[ ]:




