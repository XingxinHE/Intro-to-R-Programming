library(ggplot2) #must load the ggplot package first
data(diamonds) #loads the diamonds data set since it comes with the ggplot package

summary(diamonds)

diamonds$color

?diamonds

qplot(x = price, data = diamonds)

sum(diamonds$price < 500)
sum(diamonds$price < 250)
sum(diamonds$price >= 15000)

qplot(x = price, data = diamonds, binwidth = 100)+
  scale_x_continuous(limits = c(0,15000), breaks = seq(0,15000,1000))
ggsave('priceHistogram.png')
?ggsave


qplot(x = price, data = diamonds, binwidth = 100)+
  scale_x_continuous(limits = c(0,15000), breaks = seq(0,15000,1000))+
  facet_wrap(~cut, ncol = 3)

getwd()
setwd("D:/Coding/R Programming File/Problem Set - Explore One Variable")
ggsave('priceHistogram_facetByCut.png')

by(diamonds$price, diamonds$cut, summary)

qplot(x = price, data = diamonds, binwidth = 100)+
  facet_wrap(~cut, ncol = 3, scales="free_y")



qplot(x = price, data = diamonds, binwidth = 100)+
  facet_wrap(~cut, ncol = 3, scales="free_y")

qplot(x = price/carat, data = diamonds, binwidth = 0.08)+
  facet_wrap(~cut, ncol = 3, scales="free_y")+
  scale_x_log10()

qplot(x = clarity, y = price, data = diamonds, geom = 'boxplot')
ggsave('boxplot.png')

qplot(x = color, y = price, data = diamonds, geom = 'boxplot')
?diamonds

by(diamonds$price, diamonds$color, summary)

qplot(x = color, y = price/carat, data = diamonds, geom = 'boxplot')

qplot(x = carat, data = diamonds, geom = 'freqpoly')