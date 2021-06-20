library(tidyverse)

world_phones <- read_csv("https://gist.githubusercontent.com/toyeiei/d9e267754d0b7a7045e182b3d0011636/raw/04cf2d5b211dc3df279b36d968fde11ed1c9bb67/worldphone.csv")

glimpse(world_phones)
View(world_phones)

# clean column names
library(janitor)
(world_phones <- world_phones %>%
  clean_names())

# from wide to long data
long_wp <- world_phones %>%
  pivot_longer(n_amer:mid_amer, 
               names_to = "region",
               values_to = "sales")

# from long to wide data
long_wp %>%
  pivot_wider(names_from = "region",
              values_from = "sales")

# join tables
library(nycflights13)

result <- flights %>%
  filter(month == 9 & day == 9) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  left_join(airlines, by = "carrier") %>%
  rename(carrier_name = name)

# write/ export csv file
write_csv(result, "learn-sql/nyc_summary.csv")
























