---
title: "Intern evaluation"
author: "Ayesha Ahmad"
date: "04/10/2017"

---
 ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
##Install Packages
```{r}
##Install Packages
##install.packages("tm")
##install.packages("SnowballC")
##install.packages("wordcloud")
library("readr")
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("tm")
library("tidyverse")
library("wordcloud")
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
#convert to term document matrix
tdm <- TermDocumentMatrix(myCorpus)
#Plot zipf
Zipf_plot(tdm) 