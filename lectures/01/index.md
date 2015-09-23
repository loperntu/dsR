---
title    : Introduction to Data Science and Text Analytics
subtitle : lecture 01
author   : 謝舒凱 Graduate Institute of Linguistics, NTU
mode     : selfcontained # {standalone, draft}
url      : {lib: "../../libraries", assets: "../../assets"}
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
lecnum   : "01"
widgets  : [mathjax, quiz, bootstrap]    # {mathjax, quiz, bootstrap}
ext_widgets: {rCharts: [libraries/widgets/nvd3]}
knit     : slidify::knit2slides
bibliography: /Users/shukai/LOPE_LexInfo/BIB/myRef.bib
github      : {user: loperntu, repo: lads}



--- bg:#FFFAF0
## 大綱
1. Background
2. Text, Text, Text
3. Linguistics and Data Science
4. 實作


---

1. __`Background`__
2. Text, Text, Text
3. Linguistics and Data Science
4. 實作


---
## 背景

- <span style="color:blue; font-weight:bold"> 文本分析 (text analysis) </span> 在語言學裡 1950 年代即開始。文本自動分析 (text analytics) 則是受到大數據的影響開始興起。

---
# Text Analysis and Text Analytics
目前的關注主題

1. text categorization
2. text clustering / similarity / association 
3. Named Entity Extraction / topic modelling / event detection
4. Sentiment analysis / Opinion mining
5. document summarization
6. text and social network


---
## 應用面

- Historical text mining
- Legal text mining
- Product/comments 

---
## 也可以改造政府

`DataTaipei`: R client for Data.Taipei

功能：

－搜尋台北市政府的開放資料
－下載台北市政府的開放資料
－下載的資料集會透過 <http://data.taipei> 提供的功能轉換為表格


--- bg:#FFFAF0
## 大綱
1. Background
2. __``Text, Text, Text``__
3. Linguistics and Data Science
4. 實作


---
## 文本長什麼樣子




---
## 來源：Local, Web, Sensors



--- bg:#FFFAF0
## 大綱
1. Background
2. Text, Text, Text
3. __``Linguistics and Data Science``__
4. 實作

---
## 一句話介紹語言學是什麼


---
## Linguistic Foundations of Text Analytics

```
<img src=assets/img/linguistic.knowledge.jpg style="width: 750px">
<span class="footnote">Source: [Adapted from (Pinker, 1999)]</span>
```
---
## 一句話激怒語言學家




---
## 為什麼 BOW 沒用，功能語言學會告訴妳

- BOW (bag-of-word) appraoch



---
## 來源：Local, Web, Sensors







--- bg:#FFFAF0
## 大綱
1. Background
2. Text, Text, Text
3. Linguistics and Data Science
4. __``實作``__



---
## 3 個 Why：Linux (command line tools) + R/Programming + Git

- 事實上有許多商業軟體工具與線上服務
  * [Text analysis online](http://textanalysisonline.com/)
  * [Semantia](), [Text Analysis APIs on Mashape](https://market.mashape.com/textanalysis/textanalysis), [NLP APIs on BOSONNLP]()
- 但是
  * Coding is the new literacy
  * 求人不如求己(＝我沒有錢但是我有青春)
  * open-sourced objects 才跟得上(改變)世界的腳步


---
## 指令列工具與 Linux

- Embedded system is everywhere (Check RPi)
- 可以簡單解決的，就不要用複雜的方式。

[Jane Andrews, The Stories Mother Nature Told Her Children](https://archive.org/details/thestoriesmother05792gut)

```
wget http://archive.org/download/thestoriesmother05792gut/stmtn10.txt
file stmtn10.txt
head -n 20 stmtn10.txt
less -N stmtn10.txt
sed '2206,2525d' stmtn10.txt > stmtn10-nofooter.txt
sed '1,40d' stmtn10-nofooter.txt > stmtn10-trimmed.txt
wc -l stmtn10-trimmed.txt

```

---
## 活用組合之後會加速工作

```
w3m -dump http://www.gnu.org/gnu/manifesto.html | wc
```


---
## 課堂練習

抓一篇 Alice in wonderland 來試試。



---
## 資料科學實作

想像一個場景：妳的公司開發了一種智慧型香水。作為一個 Data Scientist，妳要面對的資料類型：

* 工廠感測器 (sensors) ／銷售／實驗室產生的數值資料 (numeric data)
* 社會感測器 (twitter, ptt, weibo) 傳回即時的產品評論文本資料 (textual data)


- numeric data 
- textual data

---
## 文本的熱門關注：評論
美食、產品、電影、書籍、課程、施政）

> 記住這個流程:
    Pre-processing
    Exploratory data analysis (statistic summary/graphical representation)
    (Linguistic annotation and analysis)
    Predictive modeling
    Report (`Data <> Story`)



---
## 香水評論

```
wget http://www.sensorywithr.org/wp-content/uploads/2014/06/perfumes_comments.csv
iconv -f ISO-8859-15 -t UTF-8 perfumes_comments.csv > perfumes_comments_utf8.csv
csvlook perfumes_comments_utf8.csv | head
```

R way

```r
comments <- read.csv("../../../data/week2/perfumes_comments.csv", sep = "\t", 
                     dec = ".", quote = "\"")
head(comments)
summary(comments)
```

Source: [sensorywithr](www.sensorywithr.org/chapt-4-when-products-are-depicted-by-comments/)

---


```r
library(FactoMineR)
res.textual <- textual(comments, num.text = 3, contingence.by = 1, sep.word = ";")
names(res.textual)
res.textual$cont.table[,1:10]
```


---


![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 




--- &radio

## 複習

What is 1 + 1?

1. 1
2. _2_
3. 3
4. 4

*** .hint

This is easy!

*** .explanation

Really, you don't know how?


---
## 作業 (20150924)

1. 讀這篇，寫下你的問題。
2. TA
3. (bonus) 妳覺得最好的分組方法（數學，遐想法皆可）





