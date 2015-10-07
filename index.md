---
title: Linguistic Analysis and Data Science
subtitle: LDAs
author: Shu-Kai Hsieh
github: {user: loperntu, repo: lads, branch: "gh-pages"}
framework: minimal
mode: selfcontained
ext_widgets: {rCharts: ["libraries/nvd3"]}
hitheme: solarized_light
logo: assets/img/plurk_hapax.png
---



# 語言分析與資料科學入門

<a href="http://prose.io/#{{site.github.user}}/{{site.github.repo}}/edit/gh-pages/index.Rmd" class="button icon edit">Edit Page</a>





`資料科學家`的工作, 可以視為是一個探索、預測與解讀資料意義的互動歷程。而`語言分析`的工作, 在了解文本資料的語意與情緒表現上是重要的關鍵。本課程結合 了目前統計程式設計與自然語言處理技術, 以較為簡潔容易入門的設計與實際操作導引, 希望可以讓毫無相關程式學習基礎的學生在本課程的帶領下, 達到以下的學習目標:


- 了解結構與非結構性資料的特性與預處理工作, 特別是針對中文文本中呈現的語言特性的處理方法。
- <span style="color:green; font-weight:bold">了解中文的語言特性與文本解析 (text analytics) 的基本概念。</span>
- 選擇適當的變數與特徵並加以合理調製, 對之進行描述統計與視覺探勘, 針對不同的問題點與數據類型, 找出適當的圖形表達與統計分析。
- 學習簡易的自然語言處理與機器學習預測模式, 並應用在自己關心的領域。


## 課綱
[詳細一點的版本](syllabus.pdf) 


Week | Date   | Topic         | Lab
-----|:------:| ---           | ---
1    | 09/17  | Orientation   | 
2    | 09/24  | Introduction to Data Science and Text Analytics    | RStudio.Agilearning 
3    | 10/01  | Introduction to Data Science and Text Analytics    | Linux.command-line
4    | 10/08  | Preparing / Preprocessing text and linguistics ABC | R programming: [chapter 1-4](https://www.datacamp.com/courses/free-introduction-to-r)
5    | 10/15	| Preparing / Preprocessing text and linguistics ABC | R programming: [chapter 5-7](https://www.datacamp.com/courses/free-introduction-to-r)
6    | 10/22	| Exploratory data analysis and Infographics         | Data Manipulation: [chapter 1-2](https://www.datacamp.com/courses/data-table-data-manipulation-r-tutorial)
7    | 10/29  | Exploratory data analysis and Infographics         | Data Visualization: [chapter 1-3](https://www.datacamp.com/courses/ggvis-data-visualization-r-tutorial)
8    | 11/05	| Corpus and natural language processing             | Data Visualization: [chapter 4-5](https://www.datacamp.com/courses/ggvis-data-visualization-r-tutorial)
9    | 11/12	| Corpus and natural language processing             | R and Statistics: [course one (five chapters)](https://www.datacamp.com/introduction-to-statistics)
10   | 11/19	| Text classification and clustering                 | R and Statistics: [course five (three chapters)](https://www.datacamp.com/introduction-to-statistics)
11 	 | 11/26	| `mini-Hackathon`                                   | **開始規劃期末展演**
12 	 | 12/03	| Text classification and clustering                 |
13 	 | 12/10	| Topic modeling                                     |
14 	 | 12/17	| Sentiment analysis                                 |
15 	 | 12/24	| Stylometrics and personality detection					   | 
16 	 | 12/31	| Discussion                              					 | 
17 	 | 01/07	| Term project presentation (un-conference)					 |
18 	 | 01/14	| Final **term project and report due**	             |



## 教練團

```coffee
謝舒凱 (Aber) <shukaihsieh@ntu.edu.tw>
施孟賢 (Simon) <simon.xian@gmail.com>
張瑜芸 (Taco) <yuyun.unita@gmail.com>
```


## 課程投影片 


1. [Lecture 00](lectures/00/index.html)
2. [Lecture 01](lectures/01/index.html)
3. [Lecture 02](lectures/02/index.html)
4. [Lecture 03](lectures/03/index.html)
5. [Lecture 04](lectures/04/index.html)


## 助教講義、習題與作業

- [Week.2](http://lope.linguistics.ntu.edu.tw/courses/data_science/lab_session/0924-rstudio_intro.pdf)
- [Week.3](lope.linguistics.ntu.edu.tw/courses/data_science/lab_session/1001-agilearning_install.pptx)
- [[Week.4.1]](http://goo.gl/bQzSYk) /  [[Week 4.2]](http://lope.linguistics.ntu.edu.tw/courses/data_science/lab_session/exercise1-matrix_factor.html)



## 課程教材

在課程投影片中講解基本概念，如果有興趣了解進階內容，可參考以下線上教材

- [語言分析與資料科學](https://www.gitbook.com/book/loperntu/ladsbook/details) 
- [開放語料庫：製程與分析](https://www.gitbook.com/book/loperntu/copens/details)


## 課程同學自發活動
- [課堂共筆](https://hackpad.com/G2xpgmB77bL)
- [學習共筆](https://lads2015fall.hackpad.com/)
- [臉書社團](https://www.facebook.com/groups/652099794893097/)


## 課程精神
1. 自主學習：老師是教練，妳才是主角。
2. 跨學門協作：學著跟別人吵架後和好。


-----
## 作業分數分佈圖





<div id = 'score' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawscore()
    });
    function drawscore(){  
      var opts = {
 "dom": "score",
"width":    600,
"height":    400,
"x": "Hair",
"y": "Freq",
"group": "Eye",
"type": "multiBarChart",
"id": "score" 
},
        data = [
 {
 "Hair": "Black",
"Eye": "Brown",
"Sex": "Male",
"Freq":             32 
},
{
 "Hair": "Brown",
"Eye": "Brown",
"Sex": "Male",
"Freq":             53 
},
{
 "Hair": "Red",
"Eye": "Brown",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Brown",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Black",
"Eye": "Blue",
"Sex": "Male",
"Freq":             11 
},
{
 "Hair": "Brown",
"Eye": "Blue",
"Sex": "Male",
"Freq":             50 
},
{
 "Hair": "Red",
"Eye": "Blue",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Blue",
"Sex": "Male",
"Freq":             30 
},
{
 "Hair": "Black",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Brown",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             25 
},
{
 "Hair": "Red",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              5 
},
{
 "Hair": "Black",
"Eye": "Green",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Brown",
"Eye": "Green",
"Sex": "Male",
"Freq":             15 
},
{
 "Hair": "Red",
"Eye": "Green",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Green",
"Sex": "Male",
"Freq":              8 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>


## Capstone projects

- 第一組
- 第二組
- 第三組
- 第四組
- 第五組
- 第六組

<a href='lectures/00/index.html#9'>
<img style='border: 1px solid;' width=100% src='./assets/img/neocilin.png'></img>
</a>







