
hist(train$ApplicantIncome, breaks = 300, main = "Applicant Income Chart",xlab = "ApplicantIncome")

train$Credit_History <- as.factor(train$Credit_History)
test$Credit_History <- as.factor(test$Credit_History)


 
summary(train)

levels(train$Dependents)[4] <- "3"
levels(test$Dependents)[4] <- "3"

# imputation is the process of replacing missing data with substituted values.

#impute missing values by mean and mode
imp <- impute(train, classes = list(factor = imputeMode(), integer = imputeMean()), dummy.classes = c("integer","factor"), dummy.type = "numeric")
imp1 <- impute(test, classes = list(factor = imputeMode(), integer = imputeMean()), dummy.classes = c("integer","factor"), dummy.type = "numeric")


imp_train <- imp$data
imp_test <- imp1$data


summarizeColumns(imp_train)
summarizeColumns(imp_test)

#####imp_train$Married.dummy <- NULL

#for train data set
cd <- capLargeValues(imp_train, target = "Loan_Status",cols = c("ApplicantIncome"),threshold = 40000)
cd <- capLargeValues(cd, target = "Loan_Status",cols = c("CoapplicantIncome"),threshold = 21000)
cd <- capLargeValues(cd, target = "Loan_Status",cols = c("LoanAmount"),threshold = 520)

#rename the train data as cd_train
cd_train <- cd

#add a dummy Loan_Status column in test data
imp_test$Loan_Status <- sample(0:1,size = 367,replace = T)

cde <- capLargeValues(imp_test, target = "Loan_Status",cols = c("ApplicantIncome"),threshold = 33000)
cde <- capLargeValues(cde, target = "Loan_Status",cols = c("CoapplicantIncome"),threshold = 16000)
cde <- capLargeValues(cde, target = "Loan_Status",cols = c("LoanAmount"),threshold = 470)

#renaming test data
cd_test <- cde

summary(cd_train$ApplicantIncome)
