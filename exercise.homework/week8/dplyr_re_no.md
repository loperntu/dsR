Introducing Data Science with R - Lab Session
========================================================
author: Shih-Kai Lin
date: Nov. 03, 2016
width: 1440
height: 900





Lab Session Week 8 - dplyr and regular expression
========================================================
type: section




Recap with quick questions
========================================================
type: section


Question 1
========================================
type: sub-section
- how do you call %>%?
- the function of it?







Question 2
======================
type: sub-section

- the function of
- 1. filter
- 2. arrange
- 3. select
- 4. group_by






Question 3
======================
type: sub-section

- Type the following strings:

```r
text <- c("This is me.", "That is her.", "this's it!", 
          "Oh my gosh.", "What is it?")
```

Search for sentences that starts with the letter 't' or 'T'





Question 4
======================
type: sub-section

- What's the difference if the 'value' is set to 'F'?





Question 5
======================
type: sub-section

- What do the following codes do?


```r
grep('!$', text, value=T)
```








Exercises
======================
type: section



Before we get started
========================================================


- install the package __nycflights13__ and __tidyverse__ 


```r
require(nycflights13)
require(tidyverse)
```


- We would use __flights__ in this lab session


```r
View(flights)
```



Questions
=====================
type: sub-section


1. Sort varivable flight to find the flight has the largest arrival delay. Also, find the fligh has the smallest departure delay. Please show the result with tailnum.

2. Find the flights which were dep_delayed by at least an hour, but made up over 30 minutes in arr_delay.

3. How many flights have a missing dep_time? What other variables are missing? What might these rows represent?

4. Count the occurence of each carrier according to Q3, and show the result with a bar plot 



