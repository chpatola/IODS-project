#Charlotte Patola, 18.11.2019
#Data Wranglig on student alcohol habits datasets: https://archive.ics.uci.edu/ml/datasets/Student+Performance

#Data wrangling Task 3
getwd()
port_stud <- read.csv("student-por.csv", sep =";")
head(port_stud,3)
math_stud <-read.csv("student-mat.csv", sep =";")
head(math_stud,3)

str(port_stud)
str(math_stud)
#The dataset from the subject math has 395 observation and 33 variables.
#The variables are either factors or integrals

#The dataset from the subject portoguise has 640 observations and 33 variables.
#The variables are either factors or integrals

#Data wrangling Task 4
library(dplyr)

allStudents <- inner_join(math_stud,port_stud, by = 
                            c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu",
                              "Fedu", "Mjob", "Fjob", "reason", "nursery","internet"), suffix = c(".math",".port"))
str(allStudents)
#The combined dataset has 382 observations and 53 variables

#Data wrangling Task 5
#Combine duplicated answers
joinBy = c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu",
"Fedu", "Mjob", "Fjob", "reason", "nursery","internet")

noDuplicates <- select(allStudents, one_of(joinBy))
notjoined_columns <- colnames(math_stud)[!colnames(math_stud) %in% joinBy]

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  two_columns <- select(allStudents, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    noDuplicates[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    noDuplicates[column_name] <- first_column
  }
}
head(noDuplicates,2)
str(noDuplicates)

#Data wrangling Task 6
alc_use = (noDuplicates$Dalc + noDuplicates$Walc) /2
noDuplicates$alc_use = alc_use
noDuplicates$high_use = noDuplicates$alc_use >2
str(noDuplicates)

#Data wrangling Task 7
glimpse(noDuplicates) #has 382 observations and 35 variables

write.csv(noDuplicates,file="allStudents.csv",row.names = FALSE)
