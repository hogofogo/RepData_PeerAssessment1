activity <- read.csv("~/Projects/activity.csv", header = TRUE)
activity1 <- !is.na(activity[,1])
activity <- activity[activity1,]

#convert factor into date format
# activity[, 2] <- as.POSIXlt(as.character(activity[, 2]))
activity$date <- as.POSIXlt(as.character(activity[, 2]))