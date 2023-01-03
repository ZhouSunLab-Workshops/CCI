#  Welcome to use CCI on SCLC patients
![image](https://github.com/zhangzc-bio/CCI-png/blob/main/SCLC%20graphic%20abstract.png)

### CCI using machine learning method as a personalized prognosticator of immune subtyping which could accurately predict the survival and therapeutic response of SCLC patients in multicenter bulk transcriptomic data cohorts and immunohistochemistry cohorts. 

### If you want to use CCI smoothly, please strictly follow the instructions given below:

### ① You must keep all necessary documents in same work path, including 'CCI.R' ; 'training_profile.RDS' ; 'RNA_testing_profile.txt' ; 'IHC_testing_profile.txt' and anyother SCLC patient profiles you had.

### ② Profiles preparation: you should use the 'xxx.txt' separated by tabs as input on CCI.

### ③ Data read: the function '' data_read('xxx.txt') " is used to read candidate xxx.txt profiles obeyed 'Profiles preparation'.

### ④ Data scale: IHC profiles using " ihc_scale_largesample() " function ;  RNA profiles using " rna_scale_largesample() " function.

### ⑤ CCI model：the CCI (continuous) is calculated with " CCI() " function ; the CCI label is calculated with " CCI_label() " function.

## Exsample in R
####
setwd("C:\\...") # set your work path
####
source("CCI.R") # loading the CCI model
####
data_rna <- data_read("RNA_testing_profile.txt")  # loading RNA profiles
####
data_ihc <- data_read("IHC_testing_profile.txt")  # loading IHC profiles
####
data_rna_scale <-  rna_scale_largesample(data_rna) # scale the RNA profiles before CCI model input
####
data_ihc_scale <-  ihc_scale_largesample(data_ihc) # scale the IHC profiles before CCI model input
####
CCI_score_rna <- CCI(data_rna_scale ) # calculate the CCI (continuous) with scaled RNA profiles
####
CCI_score_rna # showing the CCI result
####
CCI_score_ihc <- CCI(data_ihc_scale ) # calculate the CCI (continuous) with scaled IHC profiles
####
CCI_score_ihc # showing the CCI result
####
CCI_label_rna <- CCI_label(CCI_score_rna ) # calculate the CCI label with scaled RNA profiles
####
CCI_label_rna # showing the CCI label result
####
CCI_label_ihc <- CCI_label(CCI_score_ihc ) # calculate the CCI label with scaled IHC profiles
####
CCI_label_ihc # showing the CCI label result

## If you have any problems and troubles, please contact us in time !
## Meng Zhou: biofomeng@hotmail.com









