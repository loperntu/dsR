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
- Tokenization often serve as the initial phase in NLP, i.e., locating **word boundaries**. But challenges in tokenization depends on the type of language.



---
## Chinese Word Segmentation 

- 中文分詞（斷詞）Chinese word segmentation 可以看成是 tokenization 的一個特例，但是涉及更深一層的語言與認知互動。

- 因為 (漢語) 語言分析的基本單位沒有你想的那麼穩固， 自然語言處理先卡關才引起注意。
  * e.g., `昨天阿里巴巴創辦人馬雲端上新的網路服務`

- 但是 Wordhood 的問題不是漢語才有。

<img style='border: 1px solid;' width=50% src='./assets/img/words.png'></img>


---
## Chinese Word Segmentation 

- 中文分詞演算法從早期的 `最大匹配查找算法`一直到隨著巨量訓練語料庫出現後的各種 `統計機器學習模式` (e.g., Conditional Ramdom Field) 已經有很大的進展。(如果先不管語言學的各種討論)

- 台灣 ([中研院](http://rocling.iis.sinica.edu.tw/CKIP/paper/wordsegment_standard.pdf))，中國 ([北京大學](http://sighan.cs.uchicago.edu/bakeoff2005/data/pku_spec.pdf)) 和北美 ([U.Penn](http://www.cis.upenn.edu/~chinese/segguide.3rd.ch.pdf)) 的標準都不太一樣。

- 假定有標準答案（亦即我們有都一致同意的分詞準則），那麼主要面對的兩大問題是
    - 結構性的歧義消解
    - OOV 識別 

---
## 結構性的歧義 
### Structural Ambiguity

- 歧義現象是自然語言的常態，有好幾種類別（詞彙，結構，邏輯域）。
- 結構類型是中文分詞關注的現象，又粗略可分幾種：
  * **組合型歧義**：`這個門把手壞了` vs `請把手拿開`。
  * **交集型歧義**：`化妝/和/服裝` vs `化妝/和服/裝`。
  


---
## 未登錄詞識別 
### OOV (Out-of-Vocabulary) Recognition

- 包括新詞、術語等未收錄在字典裡面的「詞」。至少包括了：

    - 數字
    - 命名實體 (named entity)：人名、地名、機構名等等。
    - 離合詞、詞塊。


---
## 名字識別 
### 字典沒有，就要寫識別規則讓機器來辨識

1. 組合規律
    
2. 前後規律
  - 前面出現： `校長`、`老闆`
  - 後面出現：`老師`、`教授`、`小姐`、`先生`
  


---
## Exercise

### 搜尋一下某人的名字，看看出現的語境。妳可以想出多一些規則嗎？

> 附帶一提：人名的自動辨識與分群 (person name identification/clustering) 也是個 NLP 研究領域，更難一點的還有轉譯人名的問題 (transliterated person name identification).


---
## 詞類 (Parts of Speech) 

- 詞類是根據不同程度的句法功能分類下的結果。
- 兼類 (polyfunctionality) 與動詞名物化。

---
## 中文的詞類概念

- (很重要！) 沒有構詞標記與屈折形態變化不等於沒有語法！！！
- 可以從 8 大詞類到 [27大類](http://rocling.iis.sinica.edu.tw/CKIP/tr/9305_2013%20revision.pdf)



---
## 為什麼詞類對於文本解析很重要？

舉一個例子：常識抽取對於情緒分析的重要

<span style="color:red; font-weight:bold">“我昨天深夜在鐵工廠看到一個小女孩” </span>

---
## 前處理綜合協作練習 as Group Bonus (20151015) 
### <span style="color:green; font-weight:bold">總統的語言行為</span>

- 希望每組都能做，加碼 30分/person ！
- 資料放在[這裏](https://www.dropbox.com/sh/pbbsla84bq6o678/AACtO1WjaMIxVh97eyWO81yNa?dl=0) 的 `usP` 和 `twP`。
  * 注意：可能有 noise.
- 小組討論出想要看到的現象，用 R code 實作，附上說明存成 Rmd。
  
  * 那個美國總統最多話 (tokens)，用字量最豐富 (types) ？
  * 那個台灣總統使用最多的第一人稱代名詞 (我，我們)？
  * 所有總統都用到的名詞表？
  * . . . . . . . . . . . . . . . . . . . 



> 可參考 [typical.tm.Rmd](typical.tm.Rmd) 




