# build term-document matrix

library(janeaustenr)
library(tidyverse)
library(tidytext)

tidy_books <- austen_books() %>%
  unnest_tokens(word, text) %>% # convert sentence to token
  group_by(book,word) %>%
  mutate(freq = n()) %>% # calculate term count
  arrange(desc(freq)) %>%
  ungroup()

tidy_books<- tidy_books %>% # remove stopwords
  anti_join(stop_words)

length(unique(tidy_books$word))

tidy_books <- tidy_books %>% # calculate total term count
  group_by(word) %>%
  mutate(total = n()) %>%
  ungroup() %>%
  filter(total >= 10) # remove rare words

length(unique(tidy_books$word))

tdm <- table(tidy_books$book,tidy_books$word) %>%
  as.data.frame.matrix() # build term-document matrix

# practice: build tdm using polis data

library("jiebaR")
df <- read_csv("dsR/comments_prep.csv")
stopchi <- as.data.frame(read_lines('dsR/stopword.txt',skip = 1))
names(stopchi)<-'word'
mixseg = worker()
df$word <- sapply(df$commentbody,function(x) {
  mixseg[x]
})

df <- df %>%
  unnest(word) %>%
  group_by(commentid,word) %>%
  mutate(freq = n()) %>%
  arrange(desc(freq)) %>%
  ungroup()

df<- df %>% 
  anti_join(stopchi)

tdm <- table(df$commentid,df$word) %>%
  as.data.frame.matrix()


# kmeans clustering using iris data
#https://dotblogs.com.tw/dragon229/2013/02/04/89919

library(datasets)
head(iris)
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

set.seed(20) # set random seed to ensure reproducibility
irisCluster <- kmeans(iris[, 3:4], centers=3, nstart=20) # run kmeans model
irisCluster$cluster

irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()

#PCA
#http://setosa.io/ev/principal-component-analysis/

log.iris <- log(iris[, 1:4]) # feature column
iris.species <- iris[, 5] # target column

iris.pca <- prcomp(log.iris,
                 center = TRUE, # standarization
                 scale. = TRUE) 

rotated <- iris.pca$x %>% # data projected in pca space
  as.data.frame()
ggplot(rotated, aes(PC1, PC2, color = iris$Species)) + geom_point()

PCACluster <- kmeans(rotated[, 1:2], 3, nstart = 20) # run kmeans model
PCACluster$cluster <- as.factor(PCACluster$cluster)
ggplot(rotated, aes(PC1, PC2, color = PCACluster$cluster)) + geom_point()
