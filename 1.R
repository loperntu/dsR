data()
data(rivers)
?rivers
rivers
head(rivers)
length(rivers)
summary(rivers)
hist(rivers, col="sienna", border="white", breaks=25)

colors()


b<-8.31
mode(b)
h <- c('me','you'); h
i <- 1:6;i

j <- seq(from=1, to=10, by=2);j
k <- rep(1:4, times=3, each=2);k



library(ggplot2)
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)
