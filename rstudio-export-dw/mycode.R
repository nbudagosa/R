# load library
library(tidyverse)
library(jsonlite)
library(RSQLite)
library(RPostgreSQL)

# data wrangling 101
mtcars

head(mtcars)
tail(mtcars)
summary(mtcars)

# dplyr
# select column you want
mtcars %>% 
  select(mpg, hp, wt) %>%
  head(10)

mtcars %>%
  select(mpg, 3, 5, am)

mtcars %>%
  select( contains("a") )

# rename columns
m <- mtcars %>%
  select(milePerGallon = mpg, 
         horsePower = hp, 
         weight = wt) %>%
  head(10)

# filter 
mtcars %>%
  select(milePerGallon = mpg, 
         horsePower = hp, 
         weight = wt,
         transmission = am) %>%
  filter(transmission != 0)

# rownames to column
mtcars <- mtcars %>%
  rownames_to_column() %>%
  rename(model = rowname) %>%
  tibble()

# arrange 
mtcars %>%
  select(mpg, hp, wt) %>%
  arrange(desc(hp))

# mutate create new columns
m2 <- mtcars %>%
  select(mpg, hp, wt, am) %>%
  mutate(hp_edit = hp + 5,
         wt_double = wt * 2,
         am = if_else(am == 0, "Auto", "Manual")) %>%
  filter(am == "Auto")

# summarise data
mtcars %>%
  select(mpg, am) %>%
  mutate(am = if_else(am == 0, "Auto", "Manual")) %>%
  group_by(am) %>%
  summarise( avg_mpg = mean(mpg),
             sum_mpg = sum(mpg), 
             sd_mpg = sd(mpg),
             min_mpg = min(mpg),
             max_mpg = max(mpg) )

# PIPE => Data Pipeline
library(skimr)

mtcars <- mtcars %>%
  mutate(am = if_else(am == 0, "Auto", "Manual"))

View(mtcars)

mtcars %>%
  filter(hp < 150) %>%
  select(mpg, hp, wt, am) %>%
  group_by(am) %>%
  skim()
























