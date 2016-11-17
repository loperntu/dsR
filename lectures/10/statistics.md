---
title: "30 min Introduction to Statistics with R"
output: html_notebook
---


(複習) EDA 的基礎：

- data wrangling
- visualization
- statistics


## 學習方法
- 統計學教科書概念學習 + 習題的 R 實作。
- 多利用說明文件瞭解相關函數內容。(e.g., `?sd`, `example(sd)`)



```r
require(dplyr)
```

```
## Loading required package: dplyr
```

```
## Warning: package 'dplyr' was built under R version 3.2.5
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
require(ggplot2)
```

```
## Loading required package: ggplot2
```

```
## Warning: package 'ggplot2' was built under R version 3.2.5
```

```r
#https://www.dropbox.com/s/t8doe35f3o2we2m/dogs.txt?dl=0
# big5 data 用 file - reopen with encoding - save with encoding
hedges <- read.table("../../data/txt/hedges.txt", header = T, fileEncoding="utf8")
```

```
## Warning in file(file, "rt", encoding = fileEncoding): 無法開啟檔案 '../../
## data/txt/hedges.txt' ：No such file or directory
```

```
## Error in file(file, "rt", encoding = fileEncoding): 無法開啟連結
```

```r
attach(hedges)
```

```
## Error in attach(hedges): 找不到物件 'hedges'
```

```r
# Graphical Exploration
str(hedges)
```

```
## Error in str(hedges): 找不到物件 'hedges'
```
## 探索一個變數

### 量化數據
敘述統計量：mean、sd、median


```r
summary(hedges)
```

```
## Error in summary(hedges): 找不到物件 'hedges'
```

```r
sd(HEDGES)
```

```
## Error in is.data.frame(x): 找不到物件 'HEDGES'
```


```r
# Graphic exploration
# histogram
hist(HEDGES, main = "Hedges Histogram", xlab = "Num. of Hedges")
```

```
## Error in hist(HEDGES, main = "Hedges Histogram", xlab = "Num. of Hedges"): 找不到物件 'HEDGES'
```

```r
# scatter plot
plot(HEDGES ~ SEX, data = hedges)
```

```
## Error in eval(expr, envir, enclos): 找不到物件 'hedges'
```

```r
# boxplot
boxplot(HEDGES)
```

```
## Error in boxplot(HEDGES): 找不到物件 'HEDGES'
```

```r
stripchart(HEDGES~SEX, method="jitter", xlim=c(0, 25),xlab="Num. of hedges", ylab="SEX")
```

```
## Error in eval(expr, envir, enclos): 找不到物件 'HEDGES'
```

```r
#stripchart(HEDGES~SEX, method="stack", xlim=c(0, 25),xlab="Num. of hedges", ylab="SEX")

par(mfrow=c(1,2))
hist(HEDGES[SEX=="M"], xlim=c(0, 25), ylim=c(0, 10), ylab="Frequency", main="")
```

```
## Error in hist(HEDGES[SEX == "M"], xlim = c(0, 25), ylim = c(0, 10), ylab = "Frequency", : 找不到物件 'HEDGES'
```

```r
hist(HEDGES[SEX=="F"], xlim=c(0, 25), ylim=c(0, 10), ylab="Frequency", main="")
```

```
## Error in hist(HEDGES[SEX == "F"], xlim = c(0, 25), ylim = c(0, 10), ylab = "Frequency", : 找不到物件 'HEDGES'
```

```r
par(mfrow=c(1, 1))

# Do make use of dplyr
group_by(hedges, SEX) %>%
  summarise(平均不正面用語 = mean(HEDGES))
```

```
## Error in group_by_(.data, .dots = lazyeval::lazy_dots(...), add = add): 找不到物件 'hedges'
```



```r
### ggplot2
# histogram
ggplot(data = hedges) + 
  geom_histogram(aes(x = HEDGES))
```

```
## Error in ggplot(data = hedges): 找不到物件 'hedges'
```

```r
# density plot
ggplot(data = hedges) + 
  geom_density(aes(x = HEDGES), fill = "green")
```

```
## Error in ggplot(data = hedges): 找不到物件 'hedges'
```

### 質化數據
分佈表格：table
眾數：table + sort


```r
table(hedges$HEDGES, hedges$SEX)
```

```
## Error in table(hedges$HEDGES, hedges$SEX): 找不到物件 'hedges'
```

```r
plot(table(hedges$HEDGES, hedges$SEX))
```

```
## Error in table(hedges$HEDGES, hedges$SEX): 找不到物件 'hedges'
```

```r
dists<-prop.table(table(HEDGES, SEX), margin=2); dists
```

```
## Error in table(HEDGES, SEX): 找不到物件 'HEDGES'
```

```
## Error in eval(expr, envir, enclos): 找不到物件 'dists'
```
## 探索(兩個)變數之間的關係

- `ftable`：質 v.s. 質
- `bar chart` `box plot`：質 v.s. 量
- `scatter plot`： 量 v.s. 量


```r
(FT <- ftable(Titanic, row.vars = 1:3))
```

```
##                    Survived  No Yes
## Class Sex    Age                   
## 1st   Male   Child            0   5
##              Adult          118  57
##       Female Child            0   1
##              Adult            4 140
## 2nd   Male   Child            0  11
##              Adult          154  14
##       Female Child            0  13
##              Adult           13  80
## 3rd   Male   Child           35  13
##              Adult          387  75
##       Female Child           17  14
##              Adult           89  76
## Crew  Male   Child            0   0
##              Adult          670 192
##       Female Child            0   0
##              Adult            3  20
```


(複習 RStudio cheat sheet) 繪圖之前的整理資料 `dplyr`, Regular Expression 相關函式/ `stringr`

(複習 RStudio cheat sheet) `ggplot2`

- 先把資料整理成 data.frame 送至 `ggplot()`
- 各種繪圖工具利用 aes 定位欄位和對應的圖的元素: x座標、y座標、顏色、分群
- 再一層一層的疊上繪圖要素: 點、線、各種文字與標題說明

#### 質性 <> 量性: Bar chart

#### 質性 <> 量性: Box plot

#### 量性 <> 量性：Scatter Plot  

進階做圖：美化 `ggthemes` 與互動 

## 統計檢定


```r
shapiro.test(hedges$HEDGES) 
```

```
## Error in stopifnot(is.numeric(x)): 找不到物件 'hedges'
```

```r
# NOT normally distributed. Since of the p-value is > 0.05, 
# the dataset is normally distributed)
```



```r
## Independent var = categorical
## Dependent var.  = categorical     >> chi-square
##                 = not categorical >> t-test


## Dependent variable :  HEDGE (non-categorical)
## Independent variable: SEX (categorical)

#H0: The distribution of the dependent variable HEDGES does not differ depending 
#on the levels of the independent variable SEX; D = 0.

#H1: The distribution of the dependent variable HEDGES differs depending on 
#the levels of the independent variable SEX; D > 0.


ks.test(HEDGES[SEX=="M"], HEDGES[SEX=="F"])
```

```
## Error in ks.test(HEDGES[SEX == "M"], HEDGES[SEX == "F"]): 找不到物件 'HEDGES'
```

```r
# t-test
t.test(HEDGES~SEX, hedges)
```

```
## Error in eval(expr, envir, enclos): 找不到物件 'hedges'
```

```r
# non-parametric corelation 
cor.test(diamonds$price, diamonds$carat, method= "spearman")
```

```
## Warning in cor.test.default(diamonds$price, diamonds$carat, method =
## "spearman"): Cannot compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  diamonds$price and diamonds$carat
## S = 9.7086e+11, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## 0.9628828
```

## 迴歸分析

流浪汪星人

- `computerR`: 各縣市平均每100個家庭的電腦數目




```r
require(dplyr)
require(ggplot2)
#https://www.dropbox.com/s/t8doe35f3o2we2m/dogs.txt?dl=0
# big5 data 用 file - reopen with encoding - save with encoding
dogs <- read.table("../../data/txt/dogs.txt", header = T, fileEncoding="utf8")
```

```
## Warning in file(file, "rt", encoding = fileEncoding): 無法開啟檔案 '../../
## data/txt/dogs.txt' ：No such file or directory
```

```
## Error in file(file, "rt", encoding = fileEncoding): 無法開啟連結
```

```r
qplot(computerR, adoptedR, data=dogs)
```

```
## Error in ggplot(data, aesthetics, environment = env): 找不到物件 'dogs'
```


- 迴歸係數計算推論

```r
lm.model <- lm(adoptedR~computerR, data=dogs, x =TRUE)
```

```
## Error in is.data.frame(data): 找不到物件 'dogs'
```

```r
summary(lm.model)
```

```
## Error in summary(lm.model): 找不到物件 'lm.model'
```


```r
#plot(computerR~adoptedR, data=dogs)
ggplot(dogs, aes(x = computerR, y = adoptedR)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "red")
```

```
## Error in ggplot(dogs, aes(x = computerR, y = adoptedR)): 找不到物件 'dogs'
```

- 簡單線性迴歸的 ANOVA 表格

```r
anova(lm.model)
```

```
## Error in anova(lm.model): 找不到物件 'lm.model'
```

- 殘差分析 (Residuals analysis)


```r
plot(lm.model)
```

```
## Error in plot(lm.model): 找不到物件 'lm.model'
```

```r
resid <- lm.model$residuals
```

```
## Error in eval(expr, envir, enclos): 找不到物件 'lm.model'
```

```r
# using ggplot: https://rpubs.com/therimalaya/43190
# check normality
shapiro.test(resid)
```

```
## Error: is.numeric(x) is not TRUE
```

- Correlation matrix 選取解釋變數


```r
dogs1 <- dogs[-c(1,5)]
```

```
## Error in eval(expr, envir, enclos): 找不到物件 'dogs'
```

```r
round(cor(dogs1),2); head(dogs1)
```

```
## Error in is.data.frame(x): 找不到物件 'dogs1'
```

```
## Error in head(dogs1): 找不到物件 'dogs1'
```



```r
pairs(dogs1)
```

```
## Error in pairs(dogs1): 找不到物件 'dogs1'
```

```r
# or using ggplot2 
```


```r
#install.package('GGally')
require(GGally)
```

```
## Loading required package: GGally
```

```
## Warning: package 'GGally' was built under R version 3.2.5
```

```
## 
## Attaching package: 'GGally'
```

```
## The following object is masked from 'package:dplyr':
## 
##     nasa
```

```r
ggpairs(dogs1[, c(2, 4:6)])
```

```
## Error in inherits(data, "SharedData"): 找不到物件 'dogs1'
```

-----

# Week 10 Homework : 爬蟲程式自己來
### Web Crawler/Web Scraping DIY with R

- (indi.100pt) 小組先共同選擇一個來源（如報紙／人力網／租屋網／批踢踢等等），每個人抓取某部分內容做分析。

- (group bonus.50pt) 把小組每個人做的部分兜起來說一個故事。

參考中文簡介

> - https://imdataman.github.io/how-to-make-data-news.html#/67
> - https://github.com/ywchiu/rcrawler

