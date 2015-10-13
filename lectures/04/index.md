---
title    : Linguistic Analysis and Data Science
subtitle : lecture 04
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
1. Pre-processing for Text Analytics
2. Linguistics 101
3. Crash course for R



---
## Lemmatization and Stemming

- the process of grouping together the different inflected forms of a word so they can be analyzed as a single item. E.g., `to walk`, `walked`, `walking`.
- lemmatization is closely related to stemming. 

> The difference is that a stemmer operates on a single word without knowledge of the context, and therefore cannot discriminate between words which have different meanings depending on part of speech.



---
## Example




---
## Tokenization




---
## Chinese Word Segmentation 

- Wordhood in Chinese



---
## Chinese Word Segmentation 

- 中文分詞（斷詞）Chinese word segmentation 可以看成是 tokenization 的一個特例，但是涉及更深一層的語言與認知互動。

- 中文分詞演算法從早期的 `最大匹配查找`一直到隨著巨量訓練語料庫出現後的各種`統計機器學習模式` (e.g., Conditional Ramdom Field) 已經有很大的進展。(如果不管語言學的討論)

- 主要面對的兩大問題是
    - 結構性的歧義消解
    - OOV 識別 

---
## 結構性的歧義


---
## OOV 識別 


---
## 名字識別 
### 中文人名識別規則來寫看看

1. 組合規律
    
2. 前後規律
  - 前面出現： `校長`、`老闆`
  - 後面出現：`老師`、`教授`、`小姐`、｀先生｀
  




---
## Exercise

讓 `jiebaR` 認得妳的名字。



---
## 詞類 (Parts of Speech) 

- 詞類是根據不同程度的句法訊息分類下的結果。

---
## 中文的詞類概念


- 可以從 8 大詞類到



---
## POS Granularity

`jseg.py`


---
## 為什麼詞類對於文本解析很重要？

- 說謊語言行為
- 

---
## Exercise

Pronoun 的跨語言比較 總統語料庫



---
## Bonus

中文專有名詞辨識器 (姓名、地名、機構名、etc)




