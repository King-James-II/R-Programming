## This program demonstrates Dplyr functions within the tidyverse package to perform data
## transformations on the built in Titanic data set within R. 

#Install proper packages for this file:
install.packages("tidyverse")

# Use tidyverse library
library(tidyverse)

full_names <- c(
  "James Smith", "Mary Johnson", "Robert Williams", "Linda Jones",
  "Michael Brown", "Patricia Davis", "William Miller", "Elizabeth Wilson",
  "David Moore", "Jennifer Taylor", "Richard Anderson", "Susan Martinez",
  "Joseph Anderson", "Jessica Martinez", "Charles Johnson", "Sarah Brown",
  "Thomas Davis", "Karen Johnson", "Daniel Wilson", "Nancy Smith",
  "Matthew Taylor", "Betty Davis", "Kevin Wilson", "Lisa Johnson",
  "George Brown", "Margaret Martinez", "Maria Miller", "Edward Anderson",
  "Laura Johnson", "Brian Wilson", "Linda Davis", "Ronald Smith"
)

# Convert Titanic data set to tibble.
titanicData <- as.tibble(Titanic)

# Remove column name from first column
colnames(titanicData)[1] <- ""

# Create New Passenger column using the row values for the number of rows in the tibble.
titanicData$Traveler_Name <- rownames(titanicData)

# Store names of the passengers within the columns of the new passenger column.
titanicData$Traveler_Name <- full_names

# Add a new column name for the first column Traveler_Cat
colnames(titanicData)[1] <- "Traveler_Cat"

# Modify Class of passenger to Traveler category Crew or Passenger.
titanicData$Traveler_Cat <- ifelse(titanicData$Traveler_Cat == "Crew", titanicData$Traveler_Cat, titanicData$Traveler_Cat <- "Passenger")


# Filtering data to pull only those who survived and all female crew members regardless.
titanic_filtered <- filter(titanicData, (Traveler_Cat == "Crew" & Sex == "Female")| Survived == "Yes")

# Use select to modify the Display of the filtered data frame.
select(titanic_filtered, Traveler_Name, Traveler_Cat, Sex, Survived, Age, n)

# Using pipe operator %>% to perform operations left to right and allow multiple level filtering
# and data selection all within one statement.
titanic_filtered %>% filter(Age == "Adult") %>% select(Traveler_Name, Traveler_Cat, Sex, Survived)

# Use Dplyer to group data by age and arrange it by class in ascending order.
titanic_df <- as.data.frame(Titanic)
by_age <- titanic_df %>% group_by(Age)
by_age %>% arrange(Class)


# Create a new tibble from the Titanic Data set.
shipped <- as.tibble(Titanic)

# Use mutate to create a new ticket price column that uses the class to generate values for the
# mutation for the new column.
shipped <- mutate(shipped, Ticket_Price = case_when(
  Class == "1st" ~ 150,
  Class == "2nd" ~ 60,
  Class == "3rd" ~ 35,
  Class == "Crew" ~ 0
))

# Filter the mutated data to show only Survivors and display all columns except n including
# the newly created column
shipped %>% filter(Survived=='Yes') %>% select(Class, Ticket_Price, Sex, Age, Survived)

# Filter results for only adults and calculate the mean price of their tickets.
shipped %>% filter(Age == 'Adult') %>% summarize(mean_Price = mean(Ticket_Price))

# We can ensure that the data values have no duplicates using the distinct function.
titanic_df <- titanic_df %>% distinct()
