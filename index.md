---
title: "Introducing Data Science with R"
author: "Shu-Kai Hsieh"
framework: minimal
github:
  branch: gh-pages
  repo: dsR
  user: loperntu
hitheme: solarized_light
logo: assets/img/lopen.jpg
mode: selfcontained
subtitle: dsR
ext_widgets:
  rCharts: libraries/nvd3
---



# R 語言與資料科學導論


<a href="http://prose.io/#{{site.github.user}}/{{site.github.repo}}/edit/gh-pages/index.Rmd" class="button icon edit">Edit Page</a>





`資料科學家`的工作, 可以視為是一個探索、預測與解讀資料意義的互動歷程。而`語言分析`的工作, 在了解文本資料的語意與情緒表現上是重要的關鍵。本課程結合 了目前統計程式設計與自然語言處理技術, 以較為簡潔容易入門的設計與實際操作導引, 希望可以讓毫無相關程式學習基礎的學生在本課程的帶領下, 達到以下的學習目標:

- 瞭解 R 語言的基本知識。
- 瞭解結構與非結構性資料的特性與預處理工作, 特別是針對中文文本中呈現的語言特性的處理方法。
- <span style="color:blue; font-weight:bold">了解中文的語言特性與文本解析 (text analytics) 的基本概念。</span>
- 選擇適當的變數與特徵並加以合理調製, 對之進行描述統計與視覺探勘, 針對不同的問題點與數據類型, 找出適當的圖形表達與統計分析。
- 學習簡易的自然語言處理與機器學習預測模式, 並應用在自己關心的領域。
- 學習實作資料科學專案與溝通表達。


## 課綱
[詳細一點的版本](dsR2016.pdf) 


Week | Date   | Topic         | Lab
-----|:------:| ---           | ---
1    | 09/15  | 中秋節放假    | 
2    | 09/22  | Introduction to Data Science and Text Analytics    | Installing R and Rstudio
3    | 09/29  | Introduction to Data Science and Text Analytics    | data types and structures (vector)
4    | 10/06  | Preparing / Obtaining Data | data structures (matrix, data frame, factor) 
5    | 10/13	| Scrubbing Data | list, Basic I/O
6    | 10/20	| Exploratory data analysis and Graphics | control flow; writing functions
7    | 10/27  | Exploratory data analysis and Graphics | data wrangling with dplyr and tidyr
8    | 11/03	| Corpus and Natural Language Processing  | data manipulation (with regex)
9    | 11/10	| Corpus and Statistics	 | R and Statistics: [course one (five chapters)](https://www.datacamp.com/introduction-to-statistics)
10   | 11/17	| Advanced Graphics                 | 
11 	 | 11/24	| Machine Learning Basics               | 
12 	 | 12/01	| Classification and Clustering                 |
13 	 | 12/08	| **mini-Hackathon**                                     |
14 	 | 12/15	| Discussion                                |
15 	 | 12/22	| Sentiment analysis					   | 
16 	 | 12/29	| Reporting and Presenting Data   | Web application with Shiny
17 	 | 01/04	| Term project competition/presentation |
18 	 | 01/11	| **Final term project and report due**	             |



## 教練團

```coffee
謝舒凱 <shukaihsieh@ntu.edu.tw>
林士凱 <vn512903@hotmail.com>
張瑜芸 <yuyun.unita@gmail.com>
黃資勻 <averocksanne@gmail.com>
李佳臻 <she767219@gmail.com>
吳小涵 <c04s84@gmail.com>
```


## 課程投影片 




- [Week 03](lectures/03/index.html)
- [Week 04](lectures/04/index.html)
- [Week 05](lectures/05/index.html) 
- [Week 06](lectures/06/index.html) 
- [Week 07](lectures/07/eda.html) /  [VisR_quick.R](lectures/07/VisR_quick.R)
- [Week 08](lectures/08/index.html)/[tidytext](lectures/08/tidytext.r)
- [Week 09](lectures/09/QIEs.eda.Rmd)
- [Week 10](lectures/10/statistics.Rmd)/[apple](lectures/10/crawler.Rmd)
- [Week 12](lectures/12/week12.html)

## 助教講義、習題與作業

[評分標準](http://lope.linguistics.ntu.edu.tw/courses/data_science/grading_policy2016.html)

- <span style="color:blue; font-weight:bold"> Week.3 </span>: [In-class exercise and homework](exercise.homework/week3/week3.html) / [Rmd 檔](exercise.homework/week3/week3.Rmd)
- <span style="color:blue; font-weight:bold"> Week.4 </span>: [In-class exercise and homework](exercise.homework/week4/week4.html) / [Rmd 檔](exercise.homework/week4/week4.Rmd)
- <span style="color:blue; font-weight:bold"> Week.5 </span>: [In-class exercise and homework](exercise.homework/week5/week5.html) / [Homework](exercise.homework/week5/week5_HW.html)[Rmd 檔](exercise.homework/week5/week5_HW.Rmd)
- <span style="color:blue; font-weight:bold"> Week.6 </span>: [Lab](exercise.homework/week6/week6.html)
- <span style="color:blue; font-weight:bold"> Week.7 </span>: [Lab](exercise.homework/week7/week7.html)
- <span style="color:blue; font-weight:bold"> Week.8 </span>: [Lab](exercise.homework/week8/week8.html)
- <span style="color:blue; font-weight:bold"> Week.9 </span>: [Lab](exercise.homework/week9/week9.html)
- <span style="color:blue; font-weight:bold"> Week.10 </span>: [Lab](exercise.homework/week10/week10.html)

## 課程教材

在課程投影片中講解基本概念，如果有興趣了解進階內容，可參考以下線上教材

- [語言分析與資料科學](https://www.gitbook.com/book/loperntu/ladsbook/details) 
- [開放語料庫：製程與分析](https://www.gitbook.com/book/loperntu/copens/details)


## 課程相關活動
- [NTU CEIBA](https://ceiba.ntu.edu.tw/1051LING5502)
- [課堂共筆]()
- [學習共筆]()
- [臉書社團](https://www.facebook.com/groups/652099794893097/)
- [lopeR.Py 微課程]()

## 課程精神
1. 自主學習
2. 跨學門協作


## 作業分數分佈圖


## 小組作業觀摩



## Capstone projects
- [分組名單](https://docs.google.com/document/d/14aWHW5dNykrC5uGbkq3dLk5wpbSYXQNMsirWVQI2oe0/edit?usp=sharing)

<a href='lectures/00/index.html#9'>
<img style='border: 1px solid;' width=100% src='./assets/img/neocilin.png'></img>
</a>







