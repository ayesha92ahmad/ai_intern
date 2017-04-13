---
title: "Intern evaluation"
author: "Ayesha Ahmad"
date: "04/10/2017"

---
##Install Packages

##install.packages("tm")
##install.packages("readr")
##install.packages("magrittr")
##install.packages("tidyr")
##install.packages("tidyverse")
#include all libraries
library(magrittr)
library(tidyr)
library(tidyverse)
library(readr)
#Read movie data
movie_data <- read_csv("./movie_data.csv")
#Remove the square brackets in the genres column
movie_data$genres<- gsub( '\\[', '', as.character(movie_data$genres))
movie_data$genres<- gsub( '\\]', '', as.character(movie_data$genres))
#Trim the whitespace group by genre and arrange in the descending order of frequency
genre_df <- movie_data %>% separate_rows(genres, sep = ",") %>% group_by(trimws(genres, which= c("both"))) %>% summarise(number = n()) %>% arrange(desc(number))
#Get top genres
popular <- head(genre_df,5)
#display the popular genres
popular$`trimws(genres, which = c("both"))`