
# setwd("~/Projects/Plotting")

# load data and read the files
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile = "./plotting.zip")
unzip("./plotting.zip")
nei_data <- readRDS("./summarySCC_PM25.rds")
scc_data <- readRDS("./Source_Classification_Code.rds")


# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008?
baltimore <- subset(nei_data, nei_data$fips == "24510")
total_baltimore <- with(baltimore, tapply(Emissions, year, sum))
d_baltimore <- data.frame(year = names(total_baltimore), total = total_baltimore)
# plot(d_baltimore$year, d_baltimore$total, ylab = "tons emitted", main = "Total annual PM2.5 emissions in Baltimore")


plot(d_baltimore$total, type = "o", ylab = "tons emitted", main = "Total annual PM2.5 emissions in Baltimore", xaxt = "n")
axis(side = 1, at = d_baltimore$year, labels = d_baltimore$year)

dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()


