install.packages('tidytext')
install.packages('jiebaR')

require(dplyr)
require(tidytext)
require(jiebaR)
require(ggplot2)


################ Text mining with R ##################
## tm
## quanteda
## tidy text 
######################################################

# Emily Dickinson
text <- c("Because I could not stop for Death -",
          "He kindly stopped for me -",
          "The Carriage held but just Ourselves -",
          "and Immortality")

# turn it into a tidy text
## first, put it into data frame (dplyr)
(text_df <- data_frame(line = 1:4, text = text))

# since each row is made up of multiple combined tokens. 
# We need to turn this into one-token-per-document-per-row.
# using unnest_tokens()

text_df %>%
  unnest_tokens(word, text)

# Having the text data in this format lets us manipulate, process, 
# and visualize the text using the standard set of tidy tools, 
# namely dplyr, tidyr, ggplot2, and broom.


install.packages("janeaustenr")
install.packages("gutenbergr")

require(janeaustenr)
require(gutenbergr)
require(stringr)

original_books <- austen_books() %>%
  group_by(book) %>%
  mutate(linenumber = row_number(),
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]",
                                                 ignore_case = TRUE)))) %>%
  ungroup()



# convert a dataframe with a text column to be one-token-per-row.
tidy_books <- original_books %>%
  unnest_tokens(word, text)



## The default tokenizing is for words, but other options include characters, 
##n-grams, sentences, lines, paragraphs, or separation around a regex pattern.

# d <- data_frame(txt = prideprejudice)
# d %>%
#   unnest_tokens(ngram, txt, token = "ngrams", n = 2)
# 

#tidy_books_bigrams <- austen_books() %>%
#  unnest_tokens(ngram, text, token = "ngrams", n = 2)


# Now that the data is in one-word-per-row format, we can manipulate it with tidy 
# tools like dplyr. 
# We can remove stop words (kept in the tidytext dataset stop_words) with an anti_join.

data(stop_words)

tidy_books <- tidy_books %>%
  anti_join(stop_words)


# use count to find the most common words in all the books as a whole.
tidy_books %>%
  count(word, sort = TRUE) 

# visualize the commonly used words using ggplot2
tidy_books %>%
  count(word, sort = TRUE) %>%
  filter(n > 600) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_bar(stat = "identity") +
  xlab(NULL) +
  coord_flip()


########################
# The gutenbergr package provides access to the public domain works 
# from the Project Gutenberg collection. The package includes tools both for 
# downloading books (stripping out the unhelpful header/footer information), 
# and a complete dataset of Project Gutenberg metadata that can be used to find 
# works of interest. 

#we will mostly use the function gutenberg_download() that downloads one or more 
#works from Project Gutenberg by ID, but you can also use other functions to explore 
#metadata, pair Gutenberg ID with title, author, language, etc., or gather 
#information about authors. To learn more about gutenbergr, 
#check out the package's tutorial at rOpenSci, where it is one of rOpenSci's 
#packages for data access.


## Compare word frequencies of two texts

# H.G. Wells
hgwells <- gutenberg_download(c(35, 36, 5230, 159))

tidy_hgwells <- hgwells %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

tidy_hgwells %>%
  count(word, sort = TRUE)

# Brontë sisters
bronte <- gutenberg_download(c(1260, 768, 969, 9182, 766))

tidy_bronte <- bronte %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

tidy_bronte %>%
  count(word, sort = TRUE)

# Interesting that 「time」, 
#「eyes」, and 「hand」 are in the top 10 for both H.G. Wells and the Brontë sisters.


# calculate the frequency for each word 
#for the works of Jane Austen, the Brontë sisters, and H.G. Wells.

tidy_both <- bind_rows(
  mutate(tidy_bronte, author = "Brontë Sisters"),
  mutate(tidy_hgwells, author = "H.G. Wells"))

frequency <- tidy_both %>%
  mutate(word = str_extract(word, "[a-z]+")) %>%
  count(author, word) %>%
  rename(other = n) %>%
  inner_join(count(tidy_books, word)) %>%
  rename(Austen = n) %>%
  mutate(other = other / sum(other),
         Austen = Austen / sum(Austen)) %>%
  ungroup()




# plot
library(scales)
ggplot(frequency, aes(x = other, y = Austen, color = abs(Austen - other))) +
  geom_abline(color = "gray40", lty = 2) +
  geom_jitter(alpha = 0.1, size = 2.5, width = 0.4, height = 0.4) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 1.5) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  scale_color_gradient(limits = c(0, 0.001), low = "darkslategray4", high = "gray75") +
  facet_wrap(~author, ncol = 2) +
  theme(legend.position="none") +
  labs(y = "Jane Austen", x = NULL)


# quantify how similar and different these sets of word 
# frequencies are using a correlation test.

cor.test(data = frequency[frequency$author == "Brontë Sisters",],
         ~ other + Austen)

cor.test(data = frequency[frequency$author == "H.G. Wells",], 
         ~ other + Austen)


#######################
## Sentiment analysis



#######################
## Word clouds

library(wordcloud)

tidy_books %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))






#####################
## http://www.kenbenoit.net/courses/dmslTCD2015/Days5-6_Exercise.html
require(quanteda)
# demo(quanteda)
















