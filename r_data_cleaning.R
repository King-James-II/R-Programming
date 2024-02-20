## This program is to pratice and demmonstrate data cleaning using R.
## We will need the following files in the same directory as the R script for this:
## skills1.csv
## skills2.csv
install.packages("schoolmath")
library("schoolmath")


# Setup file path to the current directory to import the csv files into R.
file_directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
skills1_path <- file.path(file_directory, "skills1.csv")
skills2_path <- file.path(file_directory, "skills2.csv")

# First we load the file values into their respective data frames.
skills1<-read.csv(skills1_path)
skills2<-read.csv(skills2_path)


# skills1.csv doesn't have a header row so we need to use the proper read.csv argument.
skills1<-read.csv(text=readLines(skills1_path, warn=FALSE))

# skills.csv won't load into the data frame because there are more columns than column headers.
# Import all data by lines without headers so we can see and manipulate the data frame in R.
skills2<-read.csv(text=readLines(skills2_path, warn=FALSE), header=FALSE)

cat("\nThis is the data before it hs been cleaned:\n")
print(skills1)
print(skills2)

# Use if else to remove columns with NA for skill value as this is not an accurate skill.
skills2<-skills2[ifelse(is.na(skills2$V1), FALSE, TRUE), ]

# Use if else to replace NA values in skills1.csv with mean values of the column and round.
skills1$X1 <- ifelse(is.na(skills1$X1), round(mean(skills1$X1, na.rm=TRUE), 1), round(skills1$X1, 1))

# Use ife else to replace negative values in skills1.csv with mean values of the column & round.
skills1$X1<-ifelse(is.negative(skills1$X1), mean(skills1$X1, negative.rm=TRUE), skills1$X1)

# Import skills 2 values into the data frame using strings as factors argument because we are using
# both char and numeric data on the same rows. 
skills2<-read.csv(text=readLines(skills2_path, warn=FALSE), stringsAsFactors=FALSE, header=FALSE, skip=1)

# Reshape the data frame to a long data frame. 
skills2<-reshape(skills2, direction="long", varying=1:2, v.names=c("Skill"))

# Remove the columns we do not need from the data frame.
skills2<-skills2[c(-1,-2,-5)]

# Remove the row containing a NA instead of a valid skill.
skills2 <- skills2[!is.na(skills2$Skill), ]

# Swap the columns around putting the second column first for better readability.
skills2<-skills2[,c(2,1)]

cat("\nThis is the data after it has been cleaned:\n")
print(skills1)
print(skills2)
