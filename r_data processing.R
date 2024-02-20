#Install outliers package
install.packages("outliers")

#Create game data data from to work with.
game_data <- data.frame(
  Player = 1:10,
  Score = c(150, NA, 80, 200, 90, 130, NA, 110, 160, NA),
  Experience = c(1000, 750, NA, 1200, NA, 800, 950, NA, 1500, 1100),
  Level = c(5, 8, 3, NA, 6, 4, 7, 2, NA, 9),
  Currency = c(500, 200, 300, NA, 700, 400, NA, 1000, 150, 800)
)

# Print the data frame
print(game_data)

# Store game data into a matrix and find and print the outliers.
library("outliers")
gd<-as.matrix(game_data)
ol<-outlier(gd[,1:5])
print(ol)
ol<-outlier(gd[,1:5], logical = TRUE)
print(ol)

# Use the logical argument to show TRUE FALSE values for each variable to show if the data value
# stored within that matrix position is an outlier or not.
row <-c(1:10)
col <-c(1:5)
gd[row, col] = ifelse(ol[row, col], median(gd[, col], na.rm = TRUE), gd[row, col])

# Check if values are NA replace with 0 and convert the matrix to integer type using as.integer.
gd[,1:5]<- as.integer(ifelse(is.na(new_gd), 0, new_gd))
typeof(gd)
print(gd)

# Use transform to add another col to the matrix that combines the values from the first two cols.
gd <- transform(gd, level_exp=interaction(gd[,4], gd[,3], sep= " - "))
print (gd)

# Convert the new column to a character data type.
gd$level_exp <- as.character(gd$level_exp)
typeof(gd$level_exp)
print(gd)

# Combine and simplify all the previous steps into a more concise program.
##########################################################################
#Install outliers package
install.packages("outliers")

library("outliers")
#Create game data data from to work with.
game_data <- data.frame(
  Player = 1:10,
  Score = c(150, NA, 80, 200, 90, 130, NA, 110, 160, NA),
  Experience = c(1000, 750, NA, 1200, NA, 800, 950, NA, 1500, 1100),
  Level = c(5, 8, 3, NA, 6, 4, 7, 2, NA, 9),
  Currency = c(500, 200, 300, NA, 700, 400, NA, 1000, 150, 800)
)
# Store game data into a matrix and find and print the outliers.
gd<-as.matrix(game_data)
ol<-outlier(gd[,1:5])
ol<-outlier(gd[,1:5], logical = TRUE)
# Use the logical argument to show TRUE FALSE values for each variable to show if the data value
# stored within that matrix position is an outlier or not.
row <-c(1:10)
col <-c(1:5)
gd[row, col] = ifelse(ol[row, col], median(gd[, col], na.rm = TRUE), gd[row, col])
# Check if values are NA replace with 0 and convert the matrix to integer type using as.integer.
gd[,1:5]<- as.integer(ifelse(is.na(new_gd), 0, new_gd))
# Use transform to add another col to the matrix that combines the values from the first two cols.
gd <- transform(gd, level_exp=interaction(gd[,4], gd[,3], sep= " - "))
print (gd)
# Convert the new column to a character data type.
gd$level_exp <- as.character(gd$level_exp)