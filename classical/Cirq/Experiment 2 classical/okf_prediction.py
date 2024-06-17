#!/usr/bin/env python
# coding: utf-8

# In[1]:


import os
import okf
from okf.example import simple_lidar_simulator as SIM
from okf.example import simple_lidar_model as LID
from tqdm import *
import json
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
import torch
import time


# In[2]:


def transform_data(data):
    training_data = data[0:4]
    X = []
    Y = []
    for train in training_data:
        for inp in train.keys():
            for state in train[inp].keys():
                
                X.append(np.array(train[inp][state]["x"],dtype=np.double))
                len_x = len(train[inp][state]["x"])
                Y.append(np.array([train[inp][state]["y"] for _ in range(len(train[inp][state]["x"]))],dtype=np.double).reshape((len_x,2)))
                
    return X,Y

def transform_test(data):
    training_data = data
    X = []
    Y = []
    for train in training_data:
        for inp in train.keys():
            for state in train[inp].keys():
                
                X.append(np.array(train[inp][state]["x"],dtype=np.double))
                len_x = len(train[inp][state]["x"])
                Y.append(np.array([train[inp][state]["y"] for _ in range(len(train[inp][state]["x"]))],dtype=np.double).reshape((len_x,2)))
                
    return X,Y


def loss_fun():
    return lambda pred, x: ((pred[:1]-x[:1])**2).sum()

def get_F():
    # x,y,vx,vy
    return torch.tensor([
        [1,0],
        [1,0]
    ], dtype=torch.double)

def get_H():
    # x,y,vx,vy -> x,y
    return torch.tensor([
        [1,0],
        [1,0],
    ], dtype=torch.double)

def initial_observation_to_state(z):
    # x,y -> (x=x, y=y, vx=0, vy=0)
    return z



def train_okf(data):
    X,Y = transform_data(data)
    lidar_model_args = dict(
        dim_x = 2,                                    
        dim_z = 2,                                    
        init_z2x = initial_observation_to_state,  
        F = get_F(),                              
        H = get_H(),                              
        loss_fun=loss_fun(),                      
        model_files_path = 'models',
    )
    model = okf.OKF(model_name='OKF', optimize=True,  **lidar_model_args)
    res_per_iter, res_per_sample = okf.train(model, X, Y, verbose=0, n_epochs=100,batch_size=32)
    model.save_model()
    model.load_model()
    return model

def predict(model, X, Y,count_base=0):
    with torch.no_grad():
        model.eval()
        loss_fun = model.loss_fun
        # per-step data
        targets = []
        times = []
        predictions = []
        # per-batch data
        tot_loss = 0
        count = 0
        for tar, (XX, YY) in enumerate(zip(X, Y)):
            model.init_state()
            for t in range(len(XX)):
                count += 1
                x = XX[t,:]
                y = YY[t,:]

                model.predict()
                model.update(x)
                
                pred = model.x.numpy()[0]
                targets.append(count_base+tar)
                times.append(t)
                predictions.append(pred)

        return pd.DataFrame(dict(
            model = len(times) * [model.model_name],
            target = targets,
            t = times,
            prediction = predictions,
        ))


# In[ ]:





# In[ ]:





# In[3]:


for datafiles in tqdm(os.listdir("evaluation_data/")):
    print(datafiles)
    bk,name = datafiles.split(".")[0].split("_")
    with open("evaluation_data/{}_{}.json".format(bk,name),"r") as file:
        data = json.load(file)

    model = train_okf(data)
    result = {}
    for data_values in data:
        for inp in data_values.keys():
            inp_result = {"ideal":{},"noise":{}}
            testX,testY = transform_test([data_values])
            df = predict(model,testX,testY)
            for state,tar in zip(list(data_values[inp].keys()),df["target"].unique()):

                Q = df[df["target"]==tar]["prediction"].mean()
                P = data_values[inp][state]["y"][0][0]
                inp_result["ideal"][state] = P
                inp_result["noise"][state] = Q
            result[inp] = inp_result
            
    with open("predictions/{}_{}.json".format(bk,name),"w") as file:
        json.dump(result,file)


# In[ ]:




