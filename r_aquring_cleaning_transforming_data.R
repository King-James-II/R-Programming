# This program imports, cleans, and transforms the "vehicles.csv" dataset:
# - Import data, remove sensitive info.
# - Modify logical / boolean columns for consistency.
# - Convert "phevBlended" to logical data type.
# - Trim whitespace from character columns.
# - Transform skewed data using log and square root transformations.
# - Visualize data distribution changes for removal of skewness.
# End Result: Cleaned and transformed "vehicles" dataframe

# Install dplyr if necessary
install.packages("dplyr")
install.packages("qdap")

# Import dplyr library to perform data cleaning and transformations
library(dplyr)
library(tidyr)
library(stringr)


# Import the vehicles.csv data set into R to clean and transform it.
vehicles <- read.csv(file = "vehicles.csv")

# Use the names function to look at the names of columns to search for any sensitive data.
names(vehicles)

# Print some values to show the values within the youSavespend to determine if the column contains
# any sensitive data.
vehicle_check <- vehicles %>% select(year, make, model, youSaveSpend)
print(head(vehicle_check, n=20))

# The youSaveSpend column varies between rows with the same year, make, and model,
# indicating potentially sensitive data. Let's remove this column.

# Simplify updating the vehicles data frame by excluding the youSaveSpend column.
vehicles <- vehicles[, names(vehicles) != "youSaveSpend"]

# Print updated column names after deletion of youSaveSpend column
names(vehicles)
# Conditional statement that checks for the column youSaveSpend and returns a message to user
# displaying if the sensitive data column was removed or not.
if (exists("youSaveSpend", where = vehicles)) {
  print("Sensitive data still here.")
} else {
  print("Removed potentially sensitive data successfully.")
}

# Use colMeans function to look at data that may need to be cleaned noticed that tCharger values
# are mostly missing. Also noticed another column guzzler with additional False values missing.
# All other 
colMeans(is.na(vehicles))

# After looking over the guzzler and tCharger columns only True values are present
# We will modify the missing values and fill in the blank values with F for false.
vehicles$guzzler <- ifelse(vehicles$guzzler == T | vehicles$guzzler == "T", T, F)

vehicles$tCharger <- ifelse(is.na(vehicles$tCharger), F, T)

# Using typeof to ensure that values within are of the correct data type.
str(vehicles)
typeof(vehicles$phevBlended)

# Found that some of the values within the phevBlended column are saved as false instead of False
# and true instead of TRUE. This caused the column to show up as a character column rather than a
#logical data type.Using mutate to transform the column to the corrected values.
vehicles <- vehicles %>% mutate(phevBlended = ifelse(phevBlended == "false", FALSE, TRUE))

# Checking to see that the phevBlended column was updated to the appropriate logical data type.
typeof(vehicles$phevBlended)

# Use mutate to transform all character string values across all columns in the data set. 
# trimws removes extra white spaces within each value of each row where they are present.
vehicles <- vehicles %>% mutate(across(where(is.character), trimws))

# Using hist function to look at data values within columns to see if data is potentially skewed.
hist(vehicles$comb08)
hist(vehicles$city08)
hist(vehicles$displ)
hist(vehicles$hpv)

# Found that the displ Engine displacement  and comb08 combined MPG columns are positively skewed  
# so performing a log transformations to transform the data to reduce the skew of the data sets.
vehicles$log_comb08 <- log10(vehicles$comb08)
vehicles$log_displ <- log10(vehicles$displ)

# city08 is also positively skewed performing a square root transformation of the data set.
vehicles$sqrt_city08 <- sqrt(vehicles$city08)


# Output the log and square root transformations to see the new data which is no longer positively
# skewed.
hist(vehicles$log_comb08)
hist(vehicles$log_displ)
hist(vehicles$sqrt_city08)

