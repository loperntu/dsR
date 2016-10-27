library(ggplot2)

###### data: diamonds, mtcars, iris
set.seed(42)
small <- diamonds[sample(nrow(diamonds),1000),]
head(small)


### qplot() vs ggplot()
### 
## qplot histogram
qplot(clarity, data=small, fill = cut, geom = "bar")
## ggplot histogram -> same output
ggplot(small, aes(clarity, fill=cut)) + geom_bar()

######################################################################
###### how to use qplot (quick plot)
## 如果你熟了 plot, 剩下要了解的就是 facets, geom, stat, position 參數


### scatterplot (自動判定)################
qplot(wt, mpg, data=mtcars)

### transform input data with functions
# (qplot accept transformed input data)
qplot(log(wt), mpg-10, data=mtcars)

# color trick
qplot(wt, mpg, data=mtcars, color=I('brown'))

# change size of points
qplot(wt, mpg, data=mtcars, color=qsec, size=3) 

# use alpha blending: 
# Alpha Blending 是指當有兩個 Pixel 在同一個位置時，且上方的 Pixel 為「透明的」(也就是其 alpha < 1)，如此一來，後方的 Pixel 就應該會「透出「來。 
qplot(wt, mpg, data=mtcars, alpha=qsec, color=I('brown'))


## continuous scale vs. discrete scale
head(mtcars)
qplot(wt, mpg, data=mtcars, color=cyl) 
levels(mtcars$cyl)
qplot(wt, mpg, data=mtcars, color=factor(cyl))


## 也許用 iris 來看更清楚 用顏色來區分物種
qplot(Sepal.Length, Sepal.Width, data=iris, color=Species, shape=Species) 
#再加上 shape=Species 呢？ 

# use different aesthetic mappings
qplot(Species, Sepal.Length, data=iris, geom="violin")  #boxplot
qplot(Species, Sepal.Length, data=iris,  geom=c("violin","jitter"), fill=Species)

# use facets 繪製分面版 y~x
# 若指定 y 變量 (y~.)  qplot() 會照指定變量分面，並將圖形沿著 y 軸排列。
# 若指定 x 變量 (.~x)  qplot() 會照指定變量分面，並將圖形沿著 x 軸排列。
# 同時指定 x 和 y 時， 就得到二維矩陣。
qplot(Sepal.Length, Sepal.Width, data=iris, geom=c("point","smooth"), 
      facets=Species~., color=Species)

qplot(mpg, wt, data=mtcars, facets=cyl~., geom=c("point", "smooth"))
qplot(mpg, wt, data=mtcars, facets=cyl~., geom=c("point", "smooth")) + coord_flip() 
qplot(wt, mpg, data=mtcars, facets=cyl~., geom=c("point", "smooth"))
qplot(mpg, wt, facets = vs~am, data = mtcars)

# save plot in variable (hint: data is saved in plot, changes in data do not change plot-data)
p.tmp <- qplot(factor(cyl), wt, data=mtcars, geom="boxplot")
p.tmp

# get information about plot
summary(p.tmp)

# # save plot (with data included)
# save(p.tmp, file="temp.rData")
# # save image of plot on disk (hint: svg device must be installed)
# ggsave(file="test.pdf")
# ggsave(file="test.jpeg", dpi=72)
# ggsave(file="test.svg", plot=p.tmp, width=10, height=5)



######## In-class exercise: playing with barchart and histogram

######## barplot ###########
qplot(factor(cyl), data=mtcars, geom="bar")

# flip plot by 90°
qplot(factor(cyl), data=mtcars, geom="bar") + 
  coord_flip()

# what's the difference between fill/color bars
qplot(factor(cyl), data=mtcars, geom="bar", fill=factor(cyl)) 
qplot(factor(cyl), data=mtcars, geom="bar", colour=factor(cyl))

# use different display of bars (stacked, dodged, identity)
head(diamonds)
qplot(clarity, data=diamonds, geom="bar", fill=cut, position="stack")
qplot(clarity, data=diamonds, geom="bar", fill=cut, position="dodge")
qplot(clarity, data=diamonds, geom="bar", fill=cut, position="fill")
qplot(clarity, data=diamonds, geom="bar", fill=cut, position="identity")


###### 直方圖 histogram ###########
qplot(carat, data=diamonds, geom="histogram")

# change binwidth
qplot(carat, data=diamonds, geom="histogram", binwidth=0.1) 
qplot(carat, data=diamonds, geom="histogram", binwidth=0.01)

# use geom to combine plots (hint: order of layers)
qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"))
qplot(wt, mpg, data=mtcars, geom=c("smooth", "point"))
qplot(wt, mpg, data=mtcars, color=factor(cyl), geom=c("point", "smooth"))

# tweeking the smooth plot ("loess"-method: polynomial surface using local fitting)
qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"))


