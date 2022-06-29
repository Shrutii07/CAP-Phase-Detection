# CAP-Phase-Detection

A deep learning model based on 1-D Convolutional Neural Network (CNN) to classify Cyclic Alternating Pattern (CAP) sleep phases A & B.
The proposed model uses single-channel standardized electroencephalogram (EEG) recordings provided by the CAP sleep database.
No manual feature extraction or pre/post processing is required making the approach completely autonomous. 
The model classifies CAP phases for healthy as well as for unhealthy subjects like narcolepsy, RBD, PLM, NFLE and insomnia.
For more information, please visit our publication on the work [here](https://doi.org/10.1016/j.compbiomed.2022.105594).


### Instructions

* The CAP sleep dataset can be downloaded from [here](https://physionet.org/content/capslpdb/1.0.0/). Download the edf file and txt file of 512 Hz sampling frequency for required disorders.
* Open the folder [Dataset Preparation](https://github.com/Shrutii07/CAP-Phase-Detection/tree/main/Dataset%20Preparation) of this repository and download the [Data_preparation_from_annotations.m](https://github.com/Shrutii07/CAP-Phase-Detection/blob/main/Dataset%20Preparation/Data_preparation_from_annotations.m) and [edfread.m](https://github.com/Shrutii07/CAP-Phase-Detection/blob/main/Dataset%20Preparation/edfread.m) in the same folder in which edf and txt files are downloaded. Run Data_preparation_from_annotations.m using [MATLAB](https://in.mathworks.com/products/matlab.html) or [Octave](https://www.gnu.org/software/octave/download) software. Give proper file name in Data_preparation_from_annotations.m code. 
* Upload the generated files on drive to keep your data on cloud
* Run the colab file [Dataset_preparation_CAP_phases.ipynb](https://github.com/Shrutii07/CAP-Phase-Detection/blob/main/Dataset%20Preparation/Dataset_preparation_CAP_phases.ipynb) from the folder Dataset Preparation. Give proper path to previously uploaded files and folder in which dataset is to be stored.
* You can directly download this balanced dataset for healthy and disordered participants from [here](https://www.kaggle.com/datasets/shrutimurarka/cap-sleep-unbalanced-dataset).
* Run the colab file [CAP_phase_detection.ipynb](https://github.com/Shrutii07/CAP-Phase-Detection/blob/main/CAP_phase_detection.ipynb) to train models and observe results. Give proper path to load dataset and save models.
* You can observe the results of our proposed models by downloading our trained models, test data and history from [here](https://drive.google.com/drive/folders/1yx1fst6jubcbUUhA-ll8l-zY3bDMMVrO?usp=sharing).

This repo contains the implementation of our paper, [Automated classification of cyclic alternating pattern sleep phases in healthy and sleep-disordered subjects using convolutional neural network](https://doi.org/10.1016/j.compbiomed.2022.105594). If you find this code useful in your research, please consider citing:

    @article{MURARKA2022105594,
      title = {Automated classification of cyclic alternating pattern sleep phases in healthy and sleep-disordered subjects using convolutional neural network},
      journal = {Computers in Biology and Medicine},
      pages = {105594},
      year = {2022},
      issn = {0010-4825},
      doi = {https://doi.org/10.1016/j.compbiomed.2022.105594},
      url = {https://www.sciencedirect.com/science/article/pii/S0010482522003869},
      author = {Shruti Murarka and Aditya Wadichar and Ankit Bhurane and Manish Sharma and U. Rajendra Acharya}
    }
    
in .tex format: 

    Shruti Murarka, Aditya Wadichar, Ankit Bhurane, Manish Sharma, U. Rajendra Acharya, Automated classification of cyclic alternating pattern sleep phases in healthy and sleep-disordered subjects using convolutional neural network, Computers in Biology and Medicine, 2022, 105594, ISSN 0010-4825, https://doi.org/10.1016/j.compbiomed.2022.105594.

