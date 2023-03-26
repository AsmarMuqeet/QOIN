# QUIN: Making Quantum Testing Noise Aware
This repository contains the code necessary to reproduce the results of QUIN.

# Installation
Currently the reposritory only supports linxu distributions and is tested on Ubuntu 20 and windows (WSL2).
To insall the python environment following distributuion are required
1. Anaconda Python distribution is required [here](https://www.anaconda.com/products/distribution):
2. R distribution [here](https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html)

.

    1. Clone repository
    2. cd submission
    3  conda env create -f ktrain.yml
# Results:
The results for each Research question is presented in the /results subdirectory in /Experiment_1 and /Experiment_2 directories.
## Files related to RQ1 (Expeiment 1):
1. RQ1_HL_BP.csv  (Backend aspect)
2. RQ1_HL_PP.csv  (Program aspect) 
3. RQ1_statistics (Results of kruskal-wallis test)
4. RQ1_dunns_PP.png (Results od Dunns test for program aspect)

## Files related to RQ1 (Expeiment 2):
1. RQ1_HL_BP.csv  (Backend aspect)
2. RQ1_HL_PP.csv  (Program aspect) 
3. RQ1_statistics (Results of kruskal-wallis test)
4. RQ1_dunns_PP.csv (Results od Dunns test for program aspect)
5. RQ1_dunns_BP.csv (Results od Dunns test for backend aspect)
6. RQ1_Diversity_PP.csv (Results of the Pairwise Similar program groups)

## Files related to RQ2 (Expeiment 1):
1. RQ2B1.png    (Graphical view for test assessment)
2. RQ2_cases.txt (Summarised cases from Graph and Quality metric (F1-score))

## Files related to RQ2 (Expeiment 2):
1. RQ2_cases.txt (Summarised cases from Graph and Quality metric (F1-score))

# Evaluate Research Questions:
To evaluate all research questions follow these steps

1. Donwload the pretrained networks [Here](https:www.shorturl.at/movDN)
2. Extract the data in the root folder of each experiment
    
    Experiment 1.rar ---> /Experiment_1/
    
    Experiment 2.rar ---> /Experiment_2/

3. After extraction you should be able to see pretrained models in /tunning_data
### To simply calculate RQs
    python CalculateRQ1.py
    python CalculateRQ2.py
    python CalculateRQ1_B.py (Only Experiment 2)
### To Re-Evaluate RQs on new data
    python EvaluationRQ1.py
    python EvaluationRQ2.py
    python CalculateRQ1.py
    python CalculateRQ2.py
    python CalculateRQ1_B.py (Only Experiment 2)
> **_NOTE:_** Evaluating RQs on new data might take several days, Depeneding on the system specifications.

### To Run the experiment from scratch:
    1. python DataGeneration.py
    2. python MLPTraining.py
    3. BaselineTuner.py
    4. Follow steps form Re-Evaluate section

> **_NOTE:_** Running the experiment from scratch can take upto several days, Depeneding on the system specifications.