---
title       : 'Introducing Data Science with R'
subtitle    : 'week.11'
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



--- 
## 大綱
1. Basic Machine Learning  (80min)
2. A glace at a data science example (20min)
3. Lab session (50min)




---
## Machine learning

<img style='border: 1px solid;' width=50% src='./assets/img/ML.png'></img>







--- 
## 大綱
1. Basic R  (80min)
2. __`A glace at a data science example (20min)`__
3. Lab session (50min)



---
## Review

<img style='border: 1px solid;' width=50% src='./assets/img/data-science.png'></img>

資料科學涉及的歷程：
- (操作型)定義可以利用資料回答的問題
- 蒐集與清理資料
- 探索、分析資料
- 溝通 



---
##

- Data science is only useful when the data are used to answer a question
 
  > 如何從 ptt <span style="color:blue; font-weight:bold">知道/預測</span> 鄉民對於某特定政策的 <span style="color:blue; font-weight:bold">想法/立場/情緒</span> ?
  > 如何從使用者 <span style="color:blue; font-weight:bold">觀影/購物/閱讀/偏好</span> 行為事件 進行<span style="color:blue; font-weight:bold">推薦/行銷</span>?




---
## Data Carrer Paths
### Data analyst / Data scientist / Data Engineer

<img style='border: 1px solid;' width=50% src='./assets/img/data-eng.jpeg'></img>

[source](https://declara.com/collection/f482737e-afdb-48a7-be75-342e562db018/post/b45708ec-1785-4df9-8373-81f9caad86c1)

---
## Lemmatization and Stemmization
垂直處理


- morpheme, stem, root, lexeme, lemma, word 的關係（見黑板）

- <span style="color:blue; font-weight:bold">Stemmization (stemmer)</span> 要把詞綴與詞幹分開 reduces the words to the root (via suffix stripping). e.g., fished", and "fisher" to "fish".
  - irregular verbs (e.g., run, ran)? 

- <span style="color:blue; font-weight:bold">Lemmatization (lemmatizer)</span> 要把 lemma 找出來（所以要動用到語法訊息）does similar thing, but the part of speech is first detected prior to attempting to find the root since for some languages, the stemming rules change depending on a word's part of speech.



<img style='border: 1px solid;' width=50% src='./assets/img/words.png'></img>




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




