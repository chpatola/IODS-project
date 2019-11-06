#Charlotte Patola, 6.11.2019

#Task 2

data_url <- "https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt"
student_data <- read.table(data_url, sep = "\t", header = TRUE)

dim(student_data)
str(student_data)
head(student_data)
#The data has 183 observations (rows) and 60 columns (variables)
# All variables except gender are integers. Gender is a factor with 2 levels

#Task 3

library(dplyr)
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

deep_columns <- select(student_data, one_of(deep_questions))
student_data$deep <- rowMeans(deep_columns)

strategic_columns <- select(student_data, one_of(strategic_questions))
student_data$stra <- rowMeans(strategic_columns)

surface_columns <- select(student_data, one_of(surface_questions))
student_data$surf <- rowMeans(surface_columns)

selected_data <-filter(student_data[,c("gender", "Age", "Attitude", "deep", "stra", "surf","Points")], Points>0)

dim(selected_data)
head(selected_data)
colnames(selected_data)[2] <- "age"
colnames(selected_data)[3] <- "attitude"
colnames(selected_data)[7] <- "points"
head(selected_data)

#Task 4
getwd()
?write.csv() 
write.csv(selected_data,file="learning2014.csv",row.names = FALSE)
imported_file <-read.csv(file="learning2014.csv")
head(imported_file)
str(imported_file)
