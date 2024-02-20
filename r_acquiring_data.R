# Download and place the files needed for this program into the same directory as this file:
# matchinfo.csv
# game_spells.txt
# game_spells_tab.txt
# random_game_data.sav
# JEOPARDY.xlsx
# college_credits.csv

# Install packages needed for this program.
install.packages("foreign")
install.packages("XLConnect")
install.packages("RODBC")

# Setup file path directory so the file will pull in as long as it is within the same directory.
file_directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
file_path <- file.path(file_directory, "matchinfo.csv")

# Load the csv file into the math_info data frame.
match_info <- read.csv(file_path, header=TRUE, sep=",")

# Use read.table to load the csv file into the data frame.
math_info <- read.table(file_path, sep=",", header = TRUE)

# Read csv file from the internet using the url of the file.. 
url <- "https://raw.githubusercontent.com/chouhbik/Data-Analysis-League-of-Legends-Study/master/matchinfo.csv"
online_data <- read.csv(url, header=TRUE, sep=",")


# Read a text file using read csv with space as delimiter.
file2 <-file.path(file_directory, "game_spells.txt")
space <- read.csv(file2, sep=" ", header = TRUE)


# Read a text file using read csv with tab as delimiter.
file3 <-file.path(file_directory, "game_spells_tab.txt")
tab <- read.csv(file3, sep="\t", header = TRUE)

# Read file using read csv with empty delimiter.This is an option if delimiter option doesn't work.
file4 <-file.path(file_directory, "game_spells.txt")
empty <- read.csv(file4, sep="", header = TRUE)

#Read SPSS .sav file and load it into a data frame.
library(foreign)
spss_file <-file.path(file_directory, "random_game_data.sav")
my_spss <- as.data.frame(read.spss(spss_file))

#Read Excel .xlsx file and laod it into a data frame.
library(XLConnect)
excel_file <-file.path(file_directory, "JEOPARDY.xlsx")
workbook <- loadWorkbook(excel_file, create=F)
my_workbook <- as.data.frame( readWorksheet(workbook, sheet='JEOPARDY') )

# Example of how to connect to a database and import data into a data frame.
# This example code uses the odbcConnect function from the RODBC package to connect to the database
# and then you can use the sqlQuery function to query the database.

# library(RODBC)
# my_database <- odbcConnect("users", uid="user", pwd="pwd")
# my_data <- sqlQuery(my_database, "SELECT * FROM tblUsers");

# Load the college_credits.csv file into the college_credits data frame.
college_file <-file.path(file_directory, "college_credits.csv")
college_credits <- read.csv(college_file, header=TRUE, sep=",")