## ggplot data visualization
library(tidyverse)

## ggplot => data mapping geom

ggplot(data = mtcars, mapping = aes(x = mpg)) +
  geom_histogram(bins = 10)

ggplot(data = mtcars, mapping = aes(x = mpg)) +
  geom_density()

## create base layer
base_layer <- ggplot(data = mtcars, mapping = aes(x = mpg))

base_layer + geom_histogram()
base_layer + geom_density()

## two variables => scatter plot
ggplot(mtcars, aes(wt, mpg)) +
  ## setting graphic aesthetics
  geom_point(color = "red", size = 4, alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "black")

base_layer <- ggplot(mtcars, aes(wt, mpg))
base_layer +
  geom_point() +
  geom_density2d()

## ggplot - shortcut qplot()


## arrange all graphics in one canvas
p1 <- qplot(x = mpg, data = mtcars, geom = "histogram", bins = 10)
p2 <- qplot(x = mpg, data = mtcars, geom = "density")
p3 <- qplot(wt, mpg, data = mtcars, geom = "point")
p4 <- qplot(wt, mpg, data = mtcars, geom = "smooth")

library(patchwork)
all_plots <- p1 + p2 + p3 + p4 + plot_layout(ncol=2)

all_plots

saveRDS(all_plots, "my_plots.rds")
all_plots <- readRDS("my_plots.rds")





















