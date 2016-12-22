# Random forest


## download the data
https://archive.ics.uci.edu/ml/machine-learning-databases/adult/

# This data set presents a binary classification problem to solve. 
# task: Given a set of features, we need to predict if a person's salary is <=50K or >=50k. 
  

# preprocessing
# Since the given data isn't well structured, 
# we'll need to make some modification while reading the data set.


##load libraries
library(data.table)
library(mlr)

##set variable names
setcol <- c("age",
            "workclass",
            "fnlwgt",
            "education",
            "education-num",
            "marital-status",
            "occupation",
            "relationship",
            "race",
            "sex",
            "capital-gain",
            "capital-loss",
            "hours-per-week",
            "native-country",
            "target")


## load data
train <- read.table("~/Dropbox/NTU.class/dsR.ntu.16-17/data/txt/adult.train.txt",
                    header = F,sep = ",", col.names = setcol, na.strings = c(" ?"),
                    stringsAsFactors = F)
test <- read.table("~/Dropbox/NTU.class/dsR.ntu.16-17/data/txt/adult.test.txt",
                   header = F,sep = ",",col.names = setcol,skip = 1, 
                   na.strings = c(" ?"),stringsAsFactors = F)


#
library(data.table)
setDT(train)
setDT(test)

## quick look
dim(train) 
dim(test) 
str(train)
str(test)


## check missing values
table(is.na(train))


setDT(train)[,.N/nrow(train),target]
setDT(test)[,.N/nrow(test),target]



#install.packages('mlr')
#listLearners("classif")[c("class","package")]
library(mlr)
data(iris)

## Define the task
#task = makeClassifTask(id = "tutorial", data = iris, target = "Species")

## Define the learner
### Classification tree, set it up for predicting probabilities
classif.lrn = makeLearner("classif.randomForest", predict.type = "prob",
                          fix.factors.prediction = TRUE)
#classif.lrn

## Define the resampling strategy
rdesc = makeResampleDesc(method = "CV", stratify = TRUE)
## Do the resampling
r = resample(learner = lrn, task = task, resampling = rdesc, show.info = FALSE)
## Get the mean misclassification error
r$aggr



## Lab 用這個來練習看看
  [印度牌的 kaggle](https://www.analyticsvidhya.com/blog/2016/08/practicing-machine-learning-techniques-in-r-with-mlr-package/)

```{r, eval=FALSE}
train <- read.csv("../../../data/csv/train_loan.csv", na.strings = c(""," ",NA))
test <- read.csv("../../../data/csv/test_loan.csv", na.strings = c(""," ",NA))
# Exploring data
summarizeColumns(train) # 和 str() 比較看看
```

