---
title       : 'Introducing Data Science with R'
subtitle    : 'week.4'
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
1. __``Basic R__``  (80min)
2. A glace at a data science example (20min)
3. Lab session (50min)





---
## Review
### Modes and classes of R objects

- 變數命名規則舉例：cannot start with numbers; it will start with a character or underscore; no special character allowed, such as @, #, $, and *. 

- 存入變數後，它就是個物件 (object)。兩種最重要的物件屬性 (attribute) 是 `class` 與 `mode` (*numeric, character*, *logical*, *function*).
  - The `mode()` returns the mode of R objects. 表示物件在記憶體中是何種類型存儲的；類別概念以後再談。


---
## Review
### 類型強制轉換 (type coercion)：
  
  - If an R object contains both numeric and logical elements, the mode of that object will be numeric and in that case the logical element automatically gets converted to numeric. 
  - if any R object contains a character element along with both numeric and logical elements, it automatically converts to the character mode.


```r
# R object containing both numeric and logical element
x <- c(2, 4, TRUE, 6, FALSE, 8); mode(x)
```

```
## [1] "numeric"
```

```r
# R object containing character, numeric, and logical elements
y <- c(1,2,TRUE,FALSE,"a"); mode(y)
```

```
## [1] "character"
```



---
## 陣列 Array


```
## , , c1
## 
##    b1 b2 b3 b4 b5
## a1  1  4  7 10 13
## a2  2  5  8 11 14
## a3  3  6  9 12 15
## 
## , , c2
## 
##    b1 b2 b3 b4 b5
## a1 16 19  2  5  8
## a2 17 20  3  6  9
## a3 18  1  4  7 10
```


---
## 陣列 Array


```r
a[2,4,1]
```

```
## [1] 11
```

```r
a['a1','b4','c1']
```

```
## [1] 10
```

```r
dim(a)
```

```
## [1] 3 5 2
```




---
## 矩陣 Matrix

- a collection of elements that has a two-dimensional representation(i.e., columns and rows.)
- 當陣列 ARRAY 是 2 維的狀況就是所謂的矩陣，元素的類型一樣A matrix can contain elements of the same data type only. （`character`, `numeric`, `logical`）
- **create, convert, access, manipulate, calculation**


```r
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL) 
rnames <- c("R1", "R2", "R3", "R4", "R5")
cnames <- c("C1", "C2", "C3", "C4", "C5")
m <- matrix(1:25, nrow = 5, ncol = 5, dimnames = list(rnames, cnames))
# class(m); mode(m)
```


---
## 矩陣 Matrix


```r
v <- as.vector(m);v
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
## [24] 24 25
```

```r
# access 
m1[3,4]
```

```
## [1] 18
```

```r
m1[,3]
```

```
## r1 r2 r3 r4 r5 
## 11 12 13 14 15
```

```r
m1[c(1:3),]
```

```
##    c1 c2 c3 c4 c5
## r1  1  6 11 16 21
## r2  2  7 12 17 22
## r3  3  8 13 18 23
```


---
## 矩陣 Matrix


```
##      [,1] [,2]
## [1,]    1    6
## [2,]    2    7
## [3,]    3    8
## [4,]    4    9
## [5,]    5   10
```

```
##      [,1] [,2]
## [1,]    1    6
## [2,]    2    7
## [3,]    3    8
## [4,]    4    9
## [5,]    5   10
## [6,]   11   12
```

```
##      [,1] [,2] [,3]
## [1,]    1    6   13
## [2,]    2    7   14
## [3,]    3    8   15
## [4,]    4    9   16
## [5,]    5   10   17
## [6,]   11   12   18
```

```
##      [,1] [,2] [,3]
## [1,]    2    7   14
## [2,]    3    8   15
## [3,]    4    9   16
## [4,]    5   10   17
## [5,]   11   12   18
```


---
## 矩陣 Matrix
### 矩陣運算


```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    2    3    4    5
## [2,]    6    7    8    9   10
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]   37   44   51   58   65
## [2,]   44   53   62   71   80
## [3,]   51   62   73   84   95
## [4,]   58   71   84   97  110
## [5,]   65   80   95  110  125
```




---
## Data Frame

- A dataframe is similar to the matrix, but in a data frame, the columns can hold data elements of different types.
- 最常處理的資料結構 the most commonly used data type for most of the analysis.


```r
# create, manipulate, access
# iris
(iris.simple <- data.frame(Sepal.Length = c(5.1, 4.7,5.0), 
                           Sepal.Width = c(3.5, 3.2, 3.6), 
                           Pedal.Length = c(1.4, 1.3,1.4)))
```

```
##   Sepal.Length Sepal.Width Pedal.Length
## 1          5.1         3.5          1.4
## 2          4.7         3.2          1.3
## 3          5.0         3.6          1.4
```


---
## Data Frame

- `[]`, `$`, `subset()`


```
## [1] 5.1 4.7 5.0
```

```
## [1] 3.5 3.2 3.6
```

```
## [1] 3.2
```

```
##   Sepal.Length Sepal.Width Pedal.Length
## 2          4.7         3.2          1.3
```


---
## Data Frame


```r
## cbind(), rbind()
names(iris.simple)
```

```
## [1] "Sepal.Length" "Sepal.Width"  "Pedal.Length"
```

```r
names(iris.simple)[1] <- "sepal.length"
```


---
## Data Frame

- 基本運算 
- 基本統計 `mean(), median(), sum(), min(), max(), sd(), ...`


```r
students <- data.frame(c("Cedric","Fred","George","Cho","Draco","Ginny"),
                       c(3,2,2,1,0,-1),
                       c("H", "G", "G", "R", "S", "G"))
names(students) <- c("name", "year", "house") # name the columns
class(students)	# "data.frame"
```

```
## [1] "data.frame"
```

```r
class(students$year)	# "numeric"
```

```
## [1] "numeric"
```

```r
class(students[,3])	# "factor"
```

```
## [1] "factor"
```

```r
# find the dimensions
nrow(students)	
```

```
## [1] 6
```

```r
ncol(students)	
```

```
## [1] 3
```

```r
dim(students)	
```

```
## [1] 6 3
```




---
## Factor
- The factor class is for categorical data, which are commonly seen in data frame.
- Factors can be ordered (like childrens' grade levels) or unordered (like gender)

```
## [1] female female male   <NA>   female
## Levels: female male
```

```
## [1] "female" "male"
```

```
## [1] 1
```

```
## [1] "0-5yrs"  "6-11yrs" "12+ yrs"
```


---
## In-class Exercise





--- 
# Preparing/Obtaining Data

- 資料格式 
 - Comma separated values (`*.csv`)
 - Text file with Tab delimited (`*.txt` or `*.tbl`)
 - MS Excel file (`*.xls` or `*.xlsx`)
 - R data object (`*.RData`)
 
 
  
  
- 資料來源 
  - Web (下載；網路爬蟲 Scraping and parsing data from the **web** (raw HTML sources)； Interacting with APIs)
  - 資料庫 database 



---
## Loading datasets from the Internet


```r
str(read.csv('http://opengeocode.org/download/CCurls.txt'))
```

```
## 'data.frame':	249 obs. of  5 variables:
##  $ ISO.3166.1.A2                  : Factor w/ 248 levels "AD","AE","AF",..: 232 38 77 13 157 3 15 6 62 11 ...
##  $ Government.URL                 : Factor w/ 232 levels "","ab.gov.ag",..: 226 19 35 6 59 192 3 37 42 4 ...
##  $ National.Statistics.Census..URL: Factor w/ 213 levels "","ab.gov.ag/article_details.php?id=4792&category=114",..: 23 178 190 3 86 33 7 99 130 23 ...
##  $ Geological.Information.URL     : Factor w/ 117 levels "","bakosurtanal.go.id",..: 113 96 98 22 1 1 1 1 1 113 ...
##  $ Post.Office.URL                : Factor w/ 155 levels "","aasfn.sm/english/english.htm",..: 150 123 130 7 35 4 120 49 116 151 ...
```

- `url` does not support Hypertext Transfer Protocol Secure (HTTPS) except for a few exceptions on Windows, which is often a must to access Web services that handle sensitive data. 所以 use the `RCurl` package,


```r
# Curl supports a wide variety of protocols and URI schemes and handles cookies, authentication, redirects, timeouts, and even more. 改成 youbike
library(RCurl)
url <- 'https://data.consumerfinance.gov/api/views/x94z-ydhh/rows.csv?accessType=DOWNLOAD'
df <- read.csv(text = getURL(url))
str(df)
```

```
## 'data.frame':	4 obs. of  1 variable:
##  $ X.: logi  NA NA NA NA
```

```r
# sort(table(df$Product))
```



---
## Preprocessing

- (numerical data) preprocessing: missing data, outliers
- (textual data) preprocessing



---
## Missing values

-  In R, a numeric missing value is represented by NA while character missing values are represented by <NA>. 

- use the `is.na()` to identify the presence of NA for each column or combinE with the `any()` 


```
##   col.1 col.2
## 1     1     M
## 2    NA     F
## 3     0  <NA>
## 4     1     M
```

```
## [1] FALSE  TRUE FALSE FALSE
```

```
## [1] TRUE
```

- We can replace the NA with the mean value or we can **remove these NA rows**.

```
##   col.1 col.2
## 1     1     M
## 4     1     M
```

- Substitute or remove 從方法論上來說不一定是好事。





---
## Reading big files with `data.table`

The `data.table` package is extremely useful — and much, much faster than read.table— for larger files. 

```
##      name year house
## 1: Cedric    3     H
## 2:   Fred    2     G
## 3: George    2     G
## 4:    Cho    1     R
## 5:  Draco    0     S
## 6:  Ginny   -1     G
```

```
##     name year house
## 1: Ginny   -1     G
```

```
##      name year house
## 1:   Fred    2     G
## 2: George    2     G
```

---
## R scripts and Programming

- **script** : a text file that contains the same commands that you would type at the console prompt.
- Comments start at a `#` and end at the end of the line. 
- R scripts have file names ending in `.r` or `.R`.
- A script can be *sourced*.

試著寫第一個 script,存成檔名為｀my.first.script.r｀, 在 RStudio 中 `source(my.first.script.r) `，或在終端機中 `RScript my.first.script.r` (好處? `RScript my.first.script.r > my.output.txt`)


```r
# my first R script
print('oh,my first')
```

```
## [1] "oh,my first"
```






--- 
## 大綱
1. Basic R  (80min)
2. __`A glace at a data science example (20min)`__
3. Lab session (70min)





---
## Review

<img style='border: 1px solid;' width=50% src='./assets/img/data-science.png'></img>

資料科學涉及的歷程：
- (操作型)定義可以利用資料回答的問題 (問題的類型決定了答案的類型！)
- 蒐集與清理資料
- 探索、分析資料 (資料不適合回答問題，怎麼辦？)
- 溝通 （transfer your findings to action!!） 





---
## Structure of a Data Science Product 

- Data science is only useful when the data are used to answer a question

<img style='border: 1px solid;' width=50% src='./assets/img/data_prod.png'></img>[source](https://www.coursera.org/learn/data-science-course/lecture/AQ7T2/the-structure-of-a-data-science-project)

 
  > 如何從 ptt <span style="color:blue; font-weight:bold">知道/預測</span> 鄉民對於某特定政策的 <span style="color:blue; font-weight:bold">想法/立場/情緒</span> ?
  > 如何從使用者 <span style="color:blue; font-weight:bold">觀影/購物/閱讀/偏好</span> 行為事件 進行<span style="color:blue; font-weight:bold">推薦/行銷</span>?




---
## Data Carrer Paths
### Data analyst / Data scientist / Data Engineer

<img style='border: 1px solid;' width=50% src='./assets/img/data-eng.jpeg'></img>

[source](https://declara.com/collection/f482737e-afdb-48a7-be75-342e562db018/post/b45708ec-1785-4df9-8373-81f9caad86c1)



---
## Lab: <span style="color:green; font-weight:bold">準總統的語言行為</span>




