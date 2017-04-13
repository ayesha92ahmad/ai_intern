#---
#title: "Intern evaluation"
#author: "Ayesha Ahmad"
#date: "04/10/2017"

#---
##Install Packages
##install.packages("tm")
##install.packages("SnowballC")
##install.packages("wordcloud")
##install.packages("RColorBrewer")
library(readr)
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library(tm)
library(tidyverse)
#read the data set
movie_data <- read_csv("./movie_data.csv")
#convert the dataset summary to corpus
myCorpus = Corpus(VectorSource(movie_data$summary))
#clean the corpus
myCorpus = tm_map(myCorpus, content_transformer(tolower))
myCorpus <- tm_map(myCorpus, PlainTextDocument)
myCorpus = tm_map(myCorpus, removePunctuation)
myCorpus = tm_map(myCorpus, removeNumbers)
myCorpus = tm_map(myCorpus, removeWords, stopwords("english"))
#create the word cloud 
set.seed(1234)
wordcloud(myCorpus, scale=c(5,.5), max.words=40, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
