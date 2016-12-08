---
title     : 'Introducing Data Science with R'
subtitle    : 'week.13'
author      : '謝舒凱 Lab of Ontologies, Language Processing and e-Humanities'
job         : 'GIL, National Taiwan University'
logo        : lope.png
biglogo     : lopen.png
license     : by-sa
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap]    # {mathjax, quiz, bootstrap}
ext_widgets: {rCharts: [libraries/widgets/nvd3]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
bibliography: /Users/shukai/LOPE_LexInfo/BIB/myRef.bib
github      : {user: loperntu, repo: dsR}



--- bg:#FFFAF0
## 大綱
  
1. __``Data Modeling : Machine Learning [2]``__ 
2. Text Analytics and NLP [2]
3. Group discussion



---
## 無痛學習機器學習

先參考課程網站上的 [ref1]() 與 [ref2]()


---
## Example: Decision trees and Random Forest
- [圖解法入門](http://www.r2d3.us/visual-intro-to-machine-learning-part-1/)：基本概念與決策樹
- [Essentials of Machine Learning Algorithms (with Python and R Codes)](https://www.analyticsvidhya.com/blog/2015/08/common-machine-learning-algorithms/)




---
## Feature Selection Methods 

- Filter and Wrapper methods
- A walkthrough example [Feature selection methods with an example](https://www.analyticsvidhya.com/blog/2016/12/introduction-to-feature-selection-methods-with-an-example-or-how-to-select-the-right-variables/)


 

---
## 實作
  
  - 用 R 套件實作機器學習很直觀 [cheatsheet](https://www.analyticsvidhya.com/blog/2015/09/full-cheatsheet-machine-learning-algorithms/)
  - 為解決各種演算法的套件分散問題 (similar to `Scikit-Learn` library in Python) 
- [`mlr`](https://mlr-org.github.io/mlr-tutorial/release/html/index.html), a recent package which is incredible at performing various machine learning tasks. 

- The entire structure of this package relies on this premise:
  - Create a Task (loading data) 
- Make a Learner (choosing an algorithm)
- Train Them.

---
## take up a classification problem. 
  
  ```r
  install.packages('mlr')
  listLearners("classif")[c("class","package")]
  library(mlr)
  data(iris)
  
  ## Define the task
  task = makeClassifTask(id = "tutorial", data = iris, target = "Species")
  ## Define the learner
  lrn = makeLearner("classif.lda")
  ## Define the resampling strategy
  rdesc = makeResampleDesc(method = "CV", stratify = TRUE)
  ## Do the resampling
  r = resample(learner = lrn, task = task, resampling = rdesc, show.info = FALSE)
  ## Get the mean misclassification error
  r$aggr
  ```


---
## 先用這個來練習看看
[印度牌的 kaggle](https://www.analyticsvidhya.com/blog/2016/08/practicing-machine-learning-techniques-in-r-with-mlr-package/)


```r
train <- read.csv("../../../data/csv/train_loan.csv", na.strings = c(""," ",NA))
test <- read.csv("../../../data/csv/test_loan.csv", na.strings = c(""," ",NA))
# Exploring data
summarizeColumns(train) # 和 str() 比較看看
```




--- bg:#FFFAF0
## 大綱
  
1. Data Modeling: Machine Learning [2]
2. __``Text Analytics and NLP [2]``__
3. Group discussion


---
## What is Text Analytics ?

- (**WHAT**): Text Analytics is the process of converting unstructured text data into meaningful data for analysis
- (**WHY**) : to measure customer opinions, product reviews, feedback, to provide search facility, sentimental analysis and entity modeling to support fact based decision making, etc. - (**HOW**): combining many linguistic, statistical, and machine learning techniques.


---
## What is Text Analytics ?

> It involves lexical analysis, categorization, clustering, pattern recognition, tagging, annotation, information extraction, link and association analysis, visualization, and predictive analytics. Text Analytics determines key words, topics, category, semantics, tags from the millions of text data available in an organization in different files and formats. The term Text Analytics is roughly synonymous with text mining.

<img style='border: 1px solid;' width=50% src='./assets/img/Text-Analytics1.jpg'></img>
  

--- bg:#FFFAF0
## 大綱

1. Data Modeling: Machine Learning
2. Text Analytics and NLP
3. __``Group discussion``__

---
## 大數據時代的工具平台

- [台大虛擬桌面](https://vdi.ntu.edu.tw/portal/webclient/index.html)
- [Microsoft Azure Machine Learning Studio](https://studio.azureml.net/)


