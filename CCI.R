if(!require("xgboost")) install.packages("xgboost")
if(!require("Matrix")) install.packages("Matrix")
if(!require("verification")) install.packages("verification")
library(xgboost)
library(Matrix)
library(verification)
data <- readRDS("training_profile.RDS")
data_GSE60052_scale <- data[,c(1,2)]
label_new <- data[,3]
### data training
train_label <- label_new  ### sample clinical information
traindata1 <- data.matrix(data_GSE60052_scale)  ## 
traindata2 <- Matrix(traindata1,sparse=T)  ## 
#traindata3 <- factor(train_label,levels = c(0,1))   ### 
traindata4 <- list(data=traindata2,label=train_label)  ### candidate training data
dtrain <- xgb.DMatrix(data = traindata4$data, label = traindata4$label)
set.seed(4)
mxgb4m <- xgboost(data = dtrain,   
                  objective='binary:logistic',
                  nround=3000, 
                  nfold = 10,  
                  max_depth=4,  
                  subsample = 0.5,
                  colsample_bytree = 0.5,
                  eta=0.7,
                  eval_metric = "error")
remove(data)
remove(data_GSE60052_scale)
remove(traindata1)
remove(traindata2)
remove(traindata4)
remove(dtrain)
remove(label_new)
remove(train_label)

data_read <- function(x){read.table(x,stringsAsFactors = F,row.names = 1,sep = "\t",header = T)}

rna_scale_largesample <- function(x){apply(x,2,scale)}
ihc_scale_largesample <- function(x){apply(x,2,scale)}

#ihc_scale_singlesample_CCL5 <- function(x){scale(x,center = 137.955,scale = 70.94991)}
#ihc_scale_singlesample_CXCL9 <- function(x){scale(x,center = 182.1193,scale = 46.05845)}

CCI <- function(x){predict(mxgb4m,x,type = "response")}

CCI_label <- function(x){
  y <- x
  for (i in 1:length(x)){
    if (x[i] < 0.4){
      y[i] <- "CCI-low (IDs)"
    }
    else if (x[i] >= 0.4) {
      y[i] <- "CCI-high (IEs)"
    }
  }
  return(y)
}

cat("\f")
print("Welcome to use CCL5/CXCL9 Index (CCI) !!")


ihc <- data_read("IHC_testing_profile.txt")
























