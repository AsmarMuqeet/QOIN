# QOIN: Noise-Aware Quantum Software Testing using Machine Learning
This repository contains the code necessary to reproduce the results of QOIN.

# Installation
Currently the repository is only tested on Linux distribution Ubuntu 20.

### Dependencies

1. Anaconda Python distribution is required [here](https://www.anaconda.com/products/distribution):
2. R distribution [here](https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html)
3. Install R package effsize

    install.packages('effsize')
	
4. Install Rigetti forrest SDk [here](https://docs.rigetti.com/qcs/getting-started/installing-locally) for qvm and quilc

Steps:

    1. Clone repository
    2. cd QOIN
    3  conda env create -f QOIN.yml
    4. conda activate qoin
	5. Open two terminals and start Rigetti QVM and quilc
	   
	   qvm -S
	   quilc -P -S

> **_NOTE:_** The Experiment 1 directory is for Real-world programs and Experiment 2 directory is for 1000 artificial programs. Each (Library Qiskit, Cirq, Rigetti) has their own respective Expriment 1 and 2 directories.

	6. Donwload the pretrained networks and data files [Here](https://drive.google.com/drive/folders/1yW1oB9IlYWEh0umZuMceFHPk0BSsKvX5?usp=sharing)
	7. Extract the data in the root folder of each experiment
    
		Library-Experiment 1.zip ---> Library/Experiment_1/
    
		Library-Experiment 2.zip ---> Library/Experiment_2/

	8. After extraction you should be able to several folders such as /tunning_data , /baseline_models, etc.

# Results:
The results for each Research question for a single Library is presented in the /results subdirectory in Library/Experiment_1 and Library/Experiment_2 directories.

> **_NOTE:_** The merged results for each Research question is presented in /results subdirectory in the parrent QOIN directory.

## Files related to RQ1 (Experiment 1):
1. RQ1_HL_BP.csv  (Backend aspect)
2. RQ1_HL_PP.csv  (Program aspect) 
3. RQ1_statistics (Results of kruskal-wallis test)
4. RQ1_dunns_PP.png (Results of Dunns test for program aspect)

## Files related to RQ1 (Experiment 2):
1. RQ1_HL_BP.csv  (Backend aspect)
2. RQ1_HL_PP.csv  (Program aspect) 
3. RQ1_statistics (Results of kruskal-wallis test)
4. RQ1_dunns_PP.csv (Results od Dunns test for program aspect)
5. RQ1_dunns_BP.csv (Results od Dunns test for backend aspect)
6. RQ1_Diversity_PP.csv (Results of the Pairwise Similar program groups)

## Files related to RQ2 (Experiment 1):
1. RQ2B1.png    (Graphical view for test assessment)
2. RQ2_statistics_original_programs.csv (Mann-whitney and A12 for original programs)
3. RQ2_statistics_fault1_programs.csv (Mann-whitney and A12 for faulty programs)
4. RQ2_statistics_fault2_programs.csv (Mann-whitney and A12 for faulty programs)
5. RQ2_statistics_fault3_programs.csv (Mann-whitney and A12 for faulty programs)
6. RQ2_cases.txt (Summarised cases from Graph)

## Files related to RQ2 (Experiment 2):
1. RQ2_cases.txt (Summarised cases from Graph and Quality metric (F1-score))
2. RQ2_statistics_original_programs.csv (Mann-whitney and A12 for original programs)
3. RQ2_statistics_fault1_programs.csv (Mann-whitney and A12 for faulty programs)
4. RQ2_statistics_fault2_programs.csv (Mann-whitney and A12 for faulty programs)
5. RQ2_statistics_fault3_programs.csv (Mann-whitney and A12 for faulty programs)
6. RQ2_cases.txt (Summarised cases from Graph)

# Evaluate Research Questions:
To evaluate all research questions, follow these steps for each Library (Qiskit, Cirq, Rigetti)

### To simply calculate RQs
    python CalculatingRQ1.py
    python CalculatingRQ2.py
    python CalculatingRQ1_B.py (Only Experiment 2)
	F1.ipynb                   (For Quality metrics precision, recall and F1-score)
### To Re-Evaluate RQs on new data
    python EvaluationRQ1.py
    python EvaluationRQ2.py
    python CalculatingRQ1.py
    python CalculatingRQ2.py
    python CalculatingRQ1_B.py (Only Experiment 2)
> **_NOTE:_** Evaluating RQs on new data might take several days, Depeneding on the system specifications.

### To Run the experiment from scratch:
    1. python DataGeneration.py
    2. python MLPTraining.py
    3. BaselineTuner.py
    4. Follow steps form Re-Evaluate section
	
### To get final merged results:
Use the jupyter notebooks presented in QOIN folder
    calculate RQ1 merged (Experiment 1).ipynb
    calculate RQ1 merged (Experiment 2).ipynb
	calculate RQ2 merged (Experiment 1).ipynb
	calculate RQ2 merged (Experiment 2).ipynb
	calculate RQ1 merged (Experiment 1).ipynb
	Analysis.ipynb   (For time and distribution analysis)
	F1.ipynb         (For Quality metrics precision, recall and F1-score)

> **_NOTE:_** Running the experiment from scratch can take upto several days, depending on the system specifications.