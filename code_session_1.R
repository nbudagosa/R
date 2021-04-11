# load library
library(tidyverse) 
library(glue) ## glue works with text/ string
library(plotly)
library(lubridate) ## work with date
library(patchwork)
library(corrplot)

# review mtcars
mtcars
rownames(mtcars)
colnames(mtcars)

mtcars <- rownames_to_column(mtcars)
head(mtcars)

# dplyr - data wrangling
mtcars <- mtcars %>%
  rename(model = rowname) %>%
  as_tibble()

# change column am to factor
mtcars <- mtcars %>%
  mutate(am = factor(am, levels=c(0,1), labels=c("Auto", "Manual")))

mtcars <- mtcars %>%
  mutate(vs = factor(vs, levels=c(0,1), labels=c("V-Shaped", "Straight")))

mtcars %>%
  select(vs, am) %>%
  head(10)

# review dataframe
glimpse(mtcars)

# select only character columns  
mtcars %>%
  select_if(is.character)
  
# select only numeric/ double
mtcars %>%
  select_if(is.numeric)

# select only factor
mtcars %>%
  select_if(is.factor)
  
# count to create frequency table
mtcars %>%
  count(am, vs) %>%
  mutate(pct = n/ sum(n))
  
# if_else to create conditional column
# case_when => multiple conditions
data("mtcars")

mtcars %>%
  select(model, hp) %>%
  mutate(hp_flag = if_else(hp < 100, TRUE, FALSE)) %>%
  mutate(hp_group = case_when(
    hp >= 200 ~ "high",
    hp >= 100 ~ "medium",
    TRUE ~ "low"  ## other condition i.e. hp < 100
  ))

## lubridate => package to work with dates
my_dates <- c(
  "2020-01-15", "2021-01-23", "2021-09-09"
)

class(my_dates)

# convert character to Date datatype
my_dates <- ymd(my_dates)
class(my_dates)
my_dates

ymd("2020 January 31")
ymd("2020 JAN 31")
ymd("2020-01-31")
ymd("2020/01/31")
ymd("20200131")

## USA = mm/dd/yyyy
mdy("Feb 25 2021")
mdy("September 30 2025")
mdy("September-30-2025")

dmy("31 Jan 1988")
dmy("31/January/1988")

## extract information my Date object
my_dates
year(my_dates)
month(my_dates, label = TRUE, abbr = FALSE)
day(my_dates)
wday(my_dates, label=TRUE, abbr = FALSE)

timeNow <- now()
year(timeNow)
hour(timeNow)
minute(timeNow)
second(timeNow)

week(ymd("2021-01-23"))

date1 <- ymd("2021-01-23")
date2 <- ymd("2021-05-15")

as.numeric(date2 - date1)

date1 + 5
date1 - 10

## glue package (string/ text)
my_name <- "Toy"
my_age <- 32

"Hello world, my name is Toy and I'm 32 years old"

glue("Hello world, my name is {my_name} and I'm {my_age} years old")

mtcars %>% 
  rownames_to_column() %>%
  glue_data("{rowname} has {hp} hp")
  
## glue 
mtcars <- rownames_to_column(mtcars)

mtcars %>%
  select(model = rowname, mpg) %>%
  head() %>%
  mutate(text = glue("{model} has {mpg} miles per gallon"))




























