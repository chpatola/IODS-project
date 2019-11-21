#Charlotte Patola, 21.11.2019

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




