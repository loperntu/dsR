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
垂直處理

- <span style="color:blue; font-weight:bold">Lemmatization</span> is the process of grouping together the different inflected forms of a word so they can be analyzed as a single item. E.g., `to walk`, `walked`, `walking`.
- Lemmatization is closely related to <span style="color:blue; font-weight:bold">stemming</span>. 

> The difference is that a stemmer operates on a single word without knowledge of the context, and therefore cannot discriminate between words which have different meanings depending on part of speech.

- 主要是有屈折變化 (inflectional) 的語言才有這個處理問題。



---
## Tokenization
水平處理

- Given a character sequence (and a pre-defined unit), tokenization is the task of chopping it up into pieces, called **tokens**. 
- A tokenizer divides text into a sequence of tokens, which in many cases correspond to "words".
- Tokenization often serve as the initial phase in NLP, i.e., locating word boundaries. But challenges in tokenization depends on the type of language.



---
## Chinese Word Segmentation 

- 中文分詞（斷詞）Chinese word segmentation 可以看成是 tokenization 的一個特例，但是涉及更深一層的語言與認知互動。

- 因為 (漢語) 語言分析的基本單位沒有你想的那麼穩固， 自然語言處理先卡關才引起注意。
  * e.g., `昨天阿里巴巴創辦人馬雲端上新的網路服務`

- 但是 Wordhood 的問題不是漢語才有。

<img style='border: 1px solid;' width=50% src='./assets/img/words.png'></img>


---
## Chinese Word Segmentation 



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
##


```bash
sed -n '6,13p' dickens-clean.txt > dickens-sample.txt

```

---
## POS Granularity

`jseg.py`


---
## 為什麼詞類對於文本解析很重要？

- 說謊語言行為
- 



---
## 綜合協作練習

Pronoun 的跨語言比較 總統語料庫

利用 `tm`/`tmcn` 等套件，把中英文的前處理跑過一次。
參考 [typical.tm.Rmd]() 





---
## Bonus

中文專有名詞辨識器 (姓名、地名、機構名、etc)




