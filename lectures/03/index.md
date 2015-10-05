---
title    : Introduction to Data Science and Text Analytics
subtitle : lecture 03
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
## 回味一下

用 linux 指令 

- 建立目錄 `~/lads/data/week4`
- 抓 Charles Dickens 的 Oliver Twist (`http://www.gutenberg.org/cache/epub/730/pg730.txt`) 丟到這個目錄，改檔案名字為 `dickens.txt`
- 移除文本中的 header 及 footer，存成 `dickens-clean.txt`


---
## 一種作法 

```
curl -s http://www.gutenberg.org/cache/epub/730/pg730.txt -o dickens.txt
less -N dickens.txt
# 利用 G 和上下頁鍵
sed '1,150d' dickens.txt > dickens-noheader.txt
sed '3422,18682d' dickens-noheader.txt > dickens-clean.txt
```

[鳥哥的 linux 私房菜](http://linux.vbird.org/linux_basic/0220filemanager.php#less)

---
## 再多練習一下 (分組做)

用 linux 指令

- 全部去標點去數字去空白，並改成小寫之後建立詞頻表
- 這個詞頻表中有一個詞彙 `bumble` 吸引了我們的注意，請用 `grep` 指令列出在它 `dickens-clean.txt｀所在的地方（順便加上行數，與給它加上顏色如何）



---
## 一種作法 
(請挑戰最精簡作法$\rightarrow$可以立刻留名在 slide!)

```
tr -d [:punct:] < dickens-clean.txt | tr -d [:digit:] | tr [:upper:] [:lower:] | tr -d '\r'|tr -d '\r'| tr ' ' '\n' | sort | uniq -c | sort -r > dickens-wordfreq.txt
grep -E -n --color=auto "(B|b)umble" dickens-clean.txt
```




---
- load, tokenize and search


---
## 簡言之
在還不會用 R 處理時，可以利用linux 指令或是 R 套件提供的功能來做前處理。

- 大小寫
- 標點符號



[@jockers2014]


---
## Crawler

- 萬一網站沒有提供好心的 text /csv 檔？
- 萬一我想要動態持續抓檔 (**monitoring corpus**)？




---
## 大綱
1. Pre-processing for Text Analytics
2. __`Linguistics 101`__
3. Crash course for R


---
## 中文斷詞（分詞）問題

- 許多人把它當成是處理階段，而不是「問題」或是「假說」
- 造成的大數據大雜訊的效應 [@hsieh]






---
## 解法

- 自備詞表 domain lexicon
- unsupervised learning


---
## 中文的詞類概念


---
# Reference



