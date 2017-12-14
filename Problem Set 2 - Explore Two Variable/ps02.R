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

library(dplyr)

diamond_clarity <- group_by(diamonds, clarity)
diamondsByClarity <- summarise(diamond_clarity,
                               mean_price = mean(price),
                               median_price = median(price),
                               min_price = min(price),
                               max_price = max(price),
                               n = n()
                               )
head(diamondsByClarity)
diamondsByClarity <-arrange(diamondsByClarity, clarity)



diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

?barplot
p1 <- ggplot(aes(x = clarity), data = diamonds_mp_by_clarity)+
  geom_bar(aes(weight = mean_price))
p2 <- ggplot(aes(x = color), data = diamonds_mp_by_color)+
  geom_bar(aes(weight = mean_price))
library(gridExtra)
grid.arrange(p1, p2, ncol =1)
?diamonds

#color
#diamond colour, from J (worst) to D (best)

#clarity
#a measurement of how clear the diamond is (I1 (worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF (best))

diamonds_by_cut <- group_by(diamonds, cut)
diamonds_mp_by_cut <- summarise(diamonds_by_cut, mean_price = mean(price))

ggplot(aes(x = cut), data = diamonds_mp_by_cut)+
  geom_bar(aes(weight = mean_price))
