library(dplyr)          # for data manipulation
library(tidyr)          # for data manipulation
library(magrittr)       # for easier syntax in one or two areas
library(gridExtra)      # for generating the bin width comparison plot
library(ggplot2)

data<- read.csv(file="data_for_fig3.csv",header=TRUE)

data_mean <- data %>%
  group_by(size,group) %>%
  summarise(Mean = mean(score))


ggplot(data, aes(x = score, fill = as.factor(group))) +
  geom_histogram(binwidth = 0.5) +
  geom_vline(data = data_mean, aes(xintercept = Mean), linetype = "dashed") +
  facet_grid(group ~ size,scales = "free") +
  theme_bw()
