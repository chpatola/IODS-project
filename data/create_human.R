#Charlotte Patola, 21.11.2019 & 25.11.209

#*** WEEK 4 ***

#Data Wrangling 1-2

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Data Wrangling 3

str(hd)
summary(hd)
#The hd data describes Human Development Index for 195 countires. It has 8 variables, all except country being numeric
#The means, medians and more info on the distribution can be obtained from above

str(gii)
summary(gii)
#The gii data describes Gender inequality Index for 195 countires. It has 10 variables, all except country being numeric
#The means, medians and more info on the distribution can be obtained from above

#Data Wrangling 4

colnames(hd)[3:(length(hd))]<- c("hd_Index","lifeexp"
                                   ,"years_ed","mean_years_ed","gni",
                                   "gni_rank")
colnames(hd)

colnames(gii)[3:(length(gii))]<- c("gi_Index","mat_mort"
                                   ,"ad_birth_rate","parliament","sec_ed_fem",
                                   "sec_ed_male","job_fem","jon_male")
colnames(gii)

#Data Wrangling 5

colnames(gii)

gii$fem_male_ed <- gii$sec_ed_fem / gii$sec_ed_male
gii$fem_male_job<- gii$job_fem / gii$jon_male

head(gii,3)

#Data Wrangling 6
library(dplyr)
human <- inner_join(gii,hd, by = "Country")
dim(human)

#*** WEEK 5 ***

#Data wranglig 1
colnames(human)
str(human$gni)
head(human$gni, 5) #The GNI variable is now in character format with , as thousand separator

?gsub
gni_format <-gsub(",","",human$gni)
gni_format_num <- as.numeric(gni_format)

hum_end <- human[,-18]
colnames(hum_end)
dim(hum_end)
hum_end$gni_num <- gni_format_num
colnames(hum_end)

#Data wranglig 2

col_to_keep <- c("Country","fem_male_ed","fem_male_job", "years_ed" ,"lifeexp" ,"gni_num",
                 "mat_mort","ad_birth_rate","parliament")

humanData <- hum_end[,col_to_keep]
colnames(humanData)

#Data wranglig 3
humanData <-na.omit(humanData)
dim(humanData)#162 observatiosleft

#Data wranglig 4

humanData$Country# rows 156-162 are regions and not countries

humanData<- humanData[1:155,]
dim(humanData)#155 observations left

#Data wranglig 5

countries<- humanData[,"Country"]
colnames(humanData)
humanData<-humanData[,-1]
colnames(humanData)
rownames(humanData) <- countries

head(humanData,2)
dim(humanData)#155 countries with 8 variables

getwd()
setwd("data")
getwd()
write.csv(humanData, file="human.csv")

