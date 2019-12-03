#Charlotte Patola, 2.12.2019

#Task 1
?read.table

bprs <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt",sep = " ", header = TRUE)
str(bprs)
summary(bprs)
head(bprs,3)

rats <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep="\t",header=TRUE)

str(rats)
summary(rats)

#Task 2

#bprs
bprs$treatment <- as.factor( bprs$treatment )
bprs$subject <- as.factor(bprs$subject) # 20 individs
str(bprs)
head(bprs,3)

#rats

rats$ID <- as.factor(rats$ID)
rats$Group <- as.factor(rats$Group)
str(rats)

#Task 3 - to long format
library(dplyr)
library(tidyr)

#bprs
bprs <-  bprs %>% gather(key = week, value = bprs_score, -treatment, -subject)
head(bprs,3)

#rats
rats <-  rats %>% gather(key = time, value = gram, -Group, -ID)
head(rats,3)

#Task 4
#I have looked at the datasets and the long vs wide formats are clear. If we start with long, we take the values of
#specific columns (for example weeks in rats) and create new columns for every unique value in that column. We then 
#list our data as "normally" under the present column headers for or data frame. In the long format we will reapet ourselves
#a bit more but it is good for many data transforming activities. We don't have important differentiating info in the 
#headers but all are in the rows

setwd("/home/chpatola/IODS-project/data")

write.csv(rats,file="rats.csv",row.names = FALSE)
write.csv(bprs,file="bprs.csv",row.names = FALSE)

