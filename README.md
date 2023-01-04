#  Welcome to use CCI on SCLC patients
![image](https://github.com/zhangzc-bio/CCI-png/blob/main/SCLC%20graphic%20abstract.png)

# CCI 
CCI using machine learning method as a personalized prognosticator of immune subtyping which could accurately predict the survival and therapeutic response of SCLC patients in multicenter bulk transcriptomic data cohorts and immunohistochemistry cohorts. 

# Description 
If you want to use CCI smoothly, please strictly follow the instructions given below:

 ① You must keep all necessary documents in same work path, including 'CCI.R' ; 'training_profile.RDS' ; 'RNA_testing_profile.txt' ; 'IHC_testing_profile.txt' and anyother SCLC patient profiles you had.

 ② Profiles preparation: you should use the 'xxx.txt' separated by tabs as input on CCI.

 ③ Data read: the function '' data_read('xxx.txt') " is used to read candidate xxx.txt profiles obeyed 'Profiles preparation'.

 ④ CCI model：the CCI (continuous) is calculated with " CCI() " function ; the CCI label is calculated with " CCI_label() " function.

# Exsample in R
 ```jsx
source("CCI.R") # loading the CCI model
data_rna <- data_read("RNA_testing_profile.txt")  # loading RNA profiles
data_ihc <- data_read("IHC_testing_profile.txt")  # loading IHC profiles
CCI(data_rna) # calculate the CCI (continuous) with scaled RNA profiles
CCI(data_ihc) # calculate the CCI (continuous) with scaled IHC profiles
CCI_label(data_rna) # calculate the CCI label with scaled RNA profiles
CCI_label(data_ihc) # calculate the CCI label with scaled IHC profiles
```

## If you have any problems and troubles, please contact us in time !  <br>  Professor Meng Zhou: biofomeng@hotmail.com









