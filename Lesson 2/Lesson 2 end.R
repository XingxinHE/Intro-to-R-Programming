redditSurvey <- read.csv("reddit.csv")

library(ggplot2)

levels(redditSurvey$age.range)

redditSurvey$age.range <- ordered(redditSurvey$age.range, levels = c('Under 18','18-24',
'25-34','35-44','45-54','55-64','65 of Above'))

qplot(data = redditSurvey, x = (age.range))