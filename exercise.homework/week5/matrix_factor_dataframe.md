Introducing Data Science with R - Lab Session
========================================================
author: Yu-Yun Chang
date: Oct. 13, 2016
width: 1440
height: 900





Lab Session Week 5 - Data Structures
========================================================
type: section




Before we get started …
========================================================


- install the package __datasets__ and load it in


```r
require(datasets)
```

- __datasets__ contains a bunch of built-in data for you to explore
- We would use __ChickWeight__ in this lab session


Recap with quick questions
========================================================
type: section

Question 1
========================================
type: sub-section

- How many rows and columns within the data?



Answer 1
===============================
type: sub-section


```r
dim(ChickWeight)
```

```
[1] 578   4
```


Question 2
======================
type: sub-section

- Which column is an ordered factor?


Answer 2
======================
type: sub-section


```r
str(ChickWeight)
```

```
Classes 'nfnGroupedData', 'nfGroupedData', 'groupedData' and 'data.frame':	578 obs. of  4 variables:
 $ weight: num  42 51 59 64 76 93 106 125 149 171 ...
 $ Time  : num  0 2 4 6 8 10 12 14 16 18 ...
 $ Chick : Ord.factor w/ 50 levels "18"<"16"<"15"<..: 15 15 15 15 15 15 15 15 15 15 ...
 $ Diet  : Factor w/ 4 levels "1","2","3","4": 1 1 1 1 1 1 1 1 1 1 ...
 - attr(*, "formula")=Class 'formula'  language weight ~ Time | Chick
  .. ..- attr(*, ".Environment")=<environment: R_EmptyEnv> 
 - attr(*, "outer")=Class 'formula'  language ~Diet
  .. ..- attr(*, ".Environment")=<environment: R_EmptyEnv> 
 - attr(*, "labels")=List of 2
  ..$ x: chr "Time"
  ..$ y: chr "Body weight"
 - attr(*, "units")=List of 2
  ..$ x: chr "(days)"
  ..$ y: chr "(gm)"
```



Question 3
======================
type: sub-section

- What does __Time__ column stand for? 


Answer 3
======================
type: sub-section


```r
help(ChickWeight)
```

- a numeric vector giving the number of days since birth when the measurement was made



Question 4
======================
type: sub-section

- How can I access the first 20 rows?


Answer 4
======================
type: sub-section


```r
head(ChickWeight,20)
```

```
   weight Time Chick Diet
1      42    0     1    1
2      51    2     1    1
3      59    4     1    1
4      64    6     1    1
5      76    8     1    1
6      93   10     1    1
7     106   12     1    1
8     125   14     1    1
9     149   16     1    1
10    171   18     1    1
11    199   20     1    1
12    205   21     1    1
13     40    0     2    1
14     49    2     2    1
15     58    4     2    1
16     72    6     2    1
17     84    8     2    1
18    103   10     2    1
19    122   12     2    1
20    138   14     2    1
```


Question 5
======================
type: sub-section

- How can I access the last 50 rows?


Answer 5
======================
type: sub-section


```r
tail(ChickWeight, 50)
```

```
    weight Time Chick Diet
529    231   20    46    4
530    238   21    46    4
531     41    0    47    4
532     53    2    47    4
533     66    4    47    4
534     79    6    47    4
535    100    8    47    4
536    123   10    47    4
537    148   12    47    4
538    157   14    47    4
539    168   16    47    4
540    185   18    47    4
541    210   20    47    4
542    205   21    47    4
543     39    0    48    4
544     50    2    48    4
545     62    4    48    4
546     80    6    48    4
547    104    8    48    4
548    125   10    48    4
549    154   12    48    4
550    170   14    48    4
551    222   16    48    4
552    261   18    48    4
553    303   20    48    4
554    322   21    48    4
555     40    0    49    4
556     53    2    49    4
557     64    4    49    4
558     85    6    49    4
559    108    8    49    4
560    128   10    49    4
561    152   12    49    4
562    166   14    49    4
563    184   16    49    4
564    203   18    49    4
565    233   20    49    4
566    237   21    49    4
567     41    0    50    4
568     54    2    50    4
569     67    4    50    4
570     84    6    50    4
571    105    8    50    4
572    122   10    50    4
573    155   12    50    4
574    175   14    50    4
575    205   16    50    4
576    234   18    50    4
577    264   20    50    4
578    264   21    50    4
```


Question 6
======================
type: sub-section

- How could I see all the labels of __Chick__ column?


Answer 6
======================
type: sub-section


```r
levels(ChickWeight$Chick)
```

```
 [1] "18" "16" "15" "13" "9"  "20" "10" "8"  "17" "19" "4"  "6"  "11" "3" 
[15] "1"  "12" "2"  "5"  "14" "7"  "24" "30" "22" "23" "27" "28" "26" "25"
[29] "29" "21" "33" "37" "36" "31" "39" "38" "32" "40" "34" "35" "44" "45"
[43] "43" "41" "47" "49" "46" "50" "42" "48"
```


Question 7
======================
type: sub-section

- How could I get the information that are within column 3 and 4 at row 546?


Answer 7
======================
type: sub-section


```r
ChickWeight[546, 3:4]
```

```
    Chick Diet
546    48    4
```



Exercises
======================
type: section

Questions
=====================
type: sub-section

- What is the total weight of the chickens?
- What is the average age of the chickens?
- What is the most possible diet that would raise chickens with the heaviest average weight?
- For chick type 1 and 2, which one has the heaviest average weight?


Answers
=====================
type: sub-section



```r
sum(ChickWeight[,1])
```


```r
mean(ChickWeight$Time)
```


```r
d1 <- mean(ChickWeight[ChickWeight$Diet==1, 1])
d2 <- mean(ChickWeight[ChickWeight$Diet==2, 1])
d3 <- mean(ChickWeight[ChickWeight$Diet==3, 1]) # answer
d4 <- mean(ChickWeight[ChickWeight$Diet==4, 1])
```



```r
t1 <- mean(ChickWeight[ChickWeight$Chick==1, 1])
t2 <- mean(ChickWeight[ChickWeight$Chick==2, 1]) # answer
```

