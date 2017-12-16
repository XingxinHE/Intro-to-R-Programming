getwd()

stateInfo <- read.csv("stateData.csv")

stateSubset <- subset(stateInfo, state.region == 1)

stateSubsetBracket <- stateInfo[stateInfo$state.region == 1,]