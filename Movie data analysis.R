library(tidyverse)
library(dplyr)
library(ggplot2)

movies <- read_csv("/Users/hockeybro17/Downloads/HW2-Movies.csv")

movieslong <- movies %>%
  separate_rows(GENRE, sep = ", ")  


print(movieslong)

movies_summary <- movieslong %>%
  group_by(GENRE) %>%         
  summarise(Total_Votes = sum(VOTES, na.rm = TRUE)) %>%  
  arrange(Total_Votes)        

print(movies_summary)

movies_original <- read_csv("/Users/hockeybro17/Downloads/movies.csv")
movies_original

movie_runtime <- movies_original %>%
  filter(RunTime == 10)
movie_runtime

flop_movie <- movies %>%
  arrange(desc(VOTES)) %>%
  filter(Verdict == "Flop")
flop_movie
  
