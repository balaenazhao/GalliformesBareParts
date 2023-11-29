library(dplyr)          # for data manipulation
library(tidyr)          # for data manipulation
library(magrittr)       # for easier syntax in one or two areas
library(gridExtra)      # for generating the bin width comparison plot
library(ggplot2)

setwd("/Users/balaena/Downloads/postdoc/GalliformesFS/manuscript/Figures/Figure 3 - phas vs non-phas/")
data<- read.csv(file="data_for_fig3.csv",header=TRUE)

data_mean <- data %>%
  group_by(size,group) %>%
  summarise(Mean = mean(score))


ggplot(data, aes(x = score, fill = as.factor(group))) +
  geom_histogram(binwidth = 0.5) +
  geom_vline(data = data_mean, aes(xintercept = Mean), linetype = "dashed") +
  facet_grid(group ~ size,scales = "free") +
  theme_bw()




#### violin plots 
p <- ggplot(data, aes(x=group, y=flaccidFS)) + 
  geom_violin() + stat_summary(fun.data=data_summary)
p2 <- ggplot(data, aes(x=group, y=Female_FS)) + 
  geom_violin() + stat_summary(fun.data=data_summary)

data_summary <- function(x) {
  m <- mean(x)
  ymin <- m-sd(x)
  ymax <- m+sd(x)
  return(c(y=m,ymin=ymin,ymax=ymax))
}

#### single grid of histogram

p<- ggplot(data[1:104,], aes(x=flaccidFS)) +
  geom_histogram(fill="white", alpha=0.5, position="identity")

p + geom_vline(aes(xintercept=mean(flaccidFS)),
               color="blue", linetype="dashed", size=1)

p1<- ggplot(data[105:264,], aes(x=flaccidFS)) +
  geom_histogram(fill="white", alpha=0.5, position="identity")

p1 + geom_vline(aes(xintercept=mean(flaccidFS)),
                color="blue", linetype="dashed", size=1)



