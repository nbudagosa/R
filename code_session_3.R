## interactive plot (plotly)
library(plotly)
library(tidyverse)
library(ggthemes)

ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 0.3, size=3)

## jitter adds noise to data points
p1 <- ggplot(mpg, aes(cty, hwy)) +
  geom_jitter() +
  geom_smooth(method = "lm", se=FALSE)

## create your first interactive plot
ggplotly(p1)

## customize your plot
p1 + 
  ## add labels
  labs(title = "Scatter plot between cty and hwy",
       subtitle = "There is a positive relationship",
       x = "City mile per gallon",
       y = "Highway mile per gallon",
       caption = "Source: from Wikepedia url:xxx") +
  ## change themes
  theme_fivethirtyeight()

## mapping columns to aesthetics features
ggplot(diamonds, aes(cut)) +
  geom_bar()

diamonds %>%
  count(cut) %>%
  ggplot(., mapping = aes(cut, n)) +
  geom_col()

## dplyr + ggplot (tidyverse) => they work well together!
diamonds %>%
  group_by(cut) %>%
  summarise(avg_price = mean(price)) %>%
  ggplot(., mapping = aes( reorder(cut, -avg_price), avg_price)) +
  geom_col(fill = "gold", color = "black") +
  theme_minimal()

df <- diamonds %>%
  group_by(cut) %>%
  summarise(avg_price = mean(price))

ggplot(df, aes(reorder(cut, -avg_price), avg_price)) +
  geom_col()

## summarise
df <- diamonds %>%
    group_by(clarity) %>%
    summarise(avg_price = mean(price),
            sd_price = sd(price))

ggplot(df , mapping = aes(reorder(clarity, -avg_price), avg_price)) +
  geom_col() ## summary table

## mapping columns to aesthetic
## random sampling
set.seed(66)
small_diamonds <- diamonds %>%
  sample_n(5000)

## setting 
ggplot(small_diamonds, aes(carat, price)) +
  geom_point(color = "red", alpha = 0.2, size = 3)

## mapping
ggplot(small_diamonds, 
       aes(carat, price, color = cut)) +
  geom_point(alpha = 0.4, size = 3)

## mapping fill
ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar() ## dodge, fill

## facet
ggplot(diamonds, aes(cut)) +
  geom_bar() +
  facet_wrap( ~ clarity, nrow= 2)

ggplot(diamonds, aes(carat, price, 
                     color=clarity)) +
  geom_point(alpha = 0.3) +
  facet_wrap( ~cut) +
  theme_minimal()

ggplot(diamonds, aes(carat, price)) +
  geom_point(alpha = 0.5) +
  geom_smooth(color = "red") +
  facet_wrap( ~cut)

## plot multiple datasets in one chart

ggplot(mtcars, aes(wt, mpg)) +
  geom_point()

ggplot() +
  geom_point(data = filter(mtcars, wt<5), 
             aes(wt, mpg), color = "blue") +
  geom_point(data = filter(mtcars, wt>=5),
             aes(wt, mpg), color = "red", size=3) +
  theme_minimal()

## load csv file
volcano <- read_csv("https://gist.githubusercontent.com/toyeiei/1181364021fb5d413004ff1549c5705c/raw/099309cb808b994fa5833680cc243b3246fd3398/volcano_example.csv")

## geom raster requires 3 numeric variables
ggplot(volcano, aes(Var1, Var2, fill=value)) +
  geom_raster(interpolate = TRUE) +
  ## scale => change color
  scale_fill_viridis_c(option = "inferno",
                       direction = -1)


mtcars$am <- factor(mtcars$am, levels=c(0,1), labels=c("Auto", "Manual"))

glimpse(mtcars)

## final example
ggplot(mtcars, aes(wt, mpg, color=am)) +
   geom_point(size =3) +
   scale_color_manual(values = c("salmon", "blue")) +
   theme_minimal()









































































