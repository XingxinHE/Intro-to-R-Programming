library(ggplot2)
data(diamonds)
summary(diamonds)
list(diamonds)

ggplot(aes(x = price, y = x), data = diamonds)+
  geom_point()

cor.test(x = diamonds$price, y = diamonds$x)
cor.test(x = diamonds$price, y = diamonds$y)
cor.test(x = diamonds$price, y = diamonds$z)


ggplot(aes(x = price, y = depth),data = diamonds)+
  geom_point(alpha = 1/100)+
  scale_x_continuous(breaks = seq(0,20000,1000))+
  scale_y_continuous(breaks = seq(45,75,5))

cor.test(x = diamonds$price, y = diamonds$depth)

ggplot(aes(x = price, y = carat), data = diamonds)+
  geom_point()+
  xlim(0, quantile(diamonds$price, 0.95))+
  ylim(0, quantile(diamonds$carat, 0.95))

ggplot(aes(x = carat, y = price), data = diamonds)+
  geom_point()+
  xlim(0, quantile(diamonds$carat, 0.95))+
  ylim(0, quantile(diamonds$price, 0.95))


diamonds$volume <- diamonds$x*diamonds$y*diamonds$z

ggplot(aes(x = volume, y = price), data = diamonds)+
  geom_point()

library(plyr)
count(diamonds$volume == 0)

with(subset(diamonds, volume!=0 & volume <800), cor.test(price, volume))


ggplot(aes(x = price, y = volume), 
       data = subset(diamonds, volume!=0 & volume <800))+
  geom_point(alpha = 1/20)+
  geom_smooth(method = 'lm', color = 'red')