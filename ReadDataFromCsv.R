# Read data from CSV

fileLocation <- paste(getwd(), '/data/DRUG_08-12-2024_11-12-2024.csv', sep="")

data <- read.csv(fileLocation)

View(data)
nrow(data)
ncol(data)
colnames(data)
str(data)
