# CAP-Phase-Detection

A deep learning model based on 1-D Convolutional Neural Network (CNN) to classify Cyclic Alternating Pattern (CAP) sleep phases A & B.
The proposed model uses single-channel standardized electroencephalogram (EEG) recordings provided by the CAP sleep database.
No manual feature extraction or pre/post processing is required making the approach completely autonomous. 
The model classifies CAP phases for healthy as well as for unhealthy subjects like narcolepsy, RBD, PLM, NFLE and insomnia.
For more information, please visit our publication on the work [here](https://doi.org/10.1016/j.compbiomed.2022.105594).


### Instructions

* The CAP sleep dataset can be downloaded from [here](https://physionet.org/content/capslpdb/1.0.0/). Download the edf file and txt file of 512 Hz sampling frequency for required disorders.
* Download the [Data_preparation_from_annotations.m](https://github.com/Shrutii07/CAP-Phase-Detection/blob/main/Dataset%20Preparation/Data_preparation_from_annotations.m) and [edfread.m](https://github.com/Shrutii07/CAP-Phase-Detection/blob/main/Dataset%20Preparation/edfread.m) in the same folder. Run Data_preparation_from_annotations.m using MATLAB or Octave software. Give proper file name in Data_preparation_from_annotations.m code. 
* 
