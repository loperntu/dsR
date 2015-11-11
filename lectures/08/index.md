---
title    : Linguistic Analysis and Data Science
subtitle : lecture 07
author   : 謝舒凱 Graduate Institute of Linguistics, NTU
mode     : selfcontained # {standalone, draft}
url      : {lib: "../../libraries", assets: "../../assets"}
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
lecnum   : "03"
widgets     : [bootstrap, quiz, interactive, mathjax]  # {mathjax, shiny, bootstrap}
ext_widgets: {rCharts: [libraries/widgets/nvd3]}
knit     : slidify::knit2slides
bibliography: /Users/shukai/LOPE_LexInfo/BIB/corpus.bib
github      : {user: loperntu, repo: lads}


--- bg:#FFFAF0
## 大綱

1. __**Corpus and NLP** for Text Analytics__ 
2. Crash course for R: Regular Expression

---
## 自然語言處理

- 嘗試模擬人類語言理解與處理知識的技術。
- 在這領域其他語言的套件應該比 R 還豐富 (e.g., python 的 `nltk`)
- NLP-powered Text Analytics 已經是主流，看看這個[例子](http://textanalysisonline.com/)

<img style = 'border: 1px solid;' width = 60%; src='./assets/img/tm.nlp.png'></img>

> BUT it is possible to use libraries written in those lower-level and hence faster languages, while writing your code in R and taking advantage of its functional programming style and its many other libraries for data analysis.


---
## 不要忘記自然語言處理是 AI-complete

- 到現在人都還不完全了解人。
- 語言的豐富性平日可以多多觀察：隱喻譬喻、諷刺幽默、情緒說謊、語用脈絡、
個體群體差異、社會文化變異、甚至討價還價、談情說愛、、。

<img style='border: 1px solid;'width=80% src='./assets/img/tm.cws.png' align="middle">




---
## 自然語言處理：實例練習

見 [nlp.Rmd](nlp.Rmd)

---
## Stanford CoreNLP 

- [線上演示](http://nlp.stanford.edu:8080/corenlp/process)

- [安裝](https://github.com/cran/coreNLP) [第一線的研究團隊](http://nlp.stanford.edu/software/corenlp.shtml)

- `coreNLP` package: Wrappers Around Stanford CoreNLP Tools (Java library). Methods provided: <span style="color:green; font-weight:bold">tokenisation, part of speech tagging, lemmatisation, named entity recognition, coreference
detection and sentiment analysis</span>


---
## 試試看


```r
# works from CRAN !
install.packages("coreNLP")
# wget http://nlp.stanford.edu/software/stanford-corenlp-full-2015-04-20.zip
download.file("http://nlp.stanford.edu/software/stanford-corenlp-full-2015-04-20.zip")
unzip("stanford-corenlp-full-2015-04-20.zip")
library(coreNLP)
initCoreNLP("stanford-corenlp-full-2015-04-20/")
FB = c("Facebook is looking for new ways to get users to share more, 
rather than just consume content, in a push that seemingly puts it in more 
direct rivalry with Twitter.")
output = annotateString(FB)
getToken(output)[,c(1:3,6:7)]
getParse(output)
getDependency(output)
getSentiment(output)
getCoreference(output)
```


---
## 語言學的研究觀察帶動 NLP 研究的層次

- 互動言談的研究就是需要標記的好例子
- 對訪談質性研究的協助 (*coding* similar to *annotation* in qualitative research)
- [`qdap`](http://trinker.github.io/qdap/): (Quantitative Discourse Analysis Package) is an R package designed to assist in quantitative discourse analysis.

<img style='border: 1px solid;'width=45% src='./assets/img/qdap.png' align="middle">




--- bg:#FFFAF0
## 大綱

1. Corpus and NLP
2. __**Crash course for R: Regular Expression**__ 



---
## Exercise: R Regular Expression

[網路資料很多](http://www.endmemo.com/program/R/grep.php)
請同學上台練習。

---
## keyword 分佈的練習


```r
comments <- read.table("perfumes_comments.csv", header = TRUE, 
                       sep = "\t", dec = ".", quote = "\"")
```

```
## Warning in file(file, "rt"): 無法開啟檔案 'perfumes_comments.csv' ：No such
## file or directory
```

```
## Error in file(file, "rt"): 無法開啟連結
```

```r
summary(comments)
# random rows of the data set
x <- sample(nrow(comments), 10, replace = FALSE)
comments[x,]

strong <-grepl("strong",comments$Comment, ignore.case = TRUE)
sum(strong)/nrow(comments)
sweet <-grepl("sweet|soft",comments$Comment, ignore.case = TRUE)
sum(sweet)/nrow(comments)
```



