# Create 3 vectors to store month data for the highest and lowest daily active player counts.
days <- c(31,28,31,30,31,30,31,31,30,31,30,31)
high_active_players <- c(35000 / days[1], 32000 / days[2], 30000 / days[3],
                         28000 / days[4], 25000 / days[5], 24000 / days[6],
                         27000 / days[7], 30000 / days[8], 28000 / days[9],
                         32000 / days[10], 33000 / days[11], 38000 / days[12])

low_active_players <- c(30000 / days[1], 28000 / days[2], 26000 / days[3],
                        24000 / days[4], 21000 / days[5], 20000 / days[6],
                        23000 / days[7], 28000 / days[8], 26000 / days[9],
                        30000 / days[10], 31000 / days[11], 36000 / days[12])
# Convert decimal values to integers
high_active_players <- floor(high_active_players)
low_active_players <- floor(low_active_players)

# Calculate average active players for each month and store them in another vector.
avg_active_players <- floor((high_active_players + low_active_players) /2)

# Calculate to find which months average over or under 1000 players daily and store them in a vector.
pcms <- 1000 - avg_active_players

# Print values to console.
pcms

# Test condition to find months where average daily player count is below 1,000 players.
pcms < 0

# Select values less than 1,000 to show how many months average players less than 1,000 and the 
# difference
pcms[pcms>0]

# Select values greater than 1,000 average players and print them.
pcms[pcms<0]<- 0
pcms

# Compute the total active player count for the year.
days * pcms

# Sum all months where average player count is more than `1,000 average players per day`
sum(days*pcms)

# Save these steps into a function to be called by passing in the high/low active player vectors.
pcdYear <- function(hActivePlayers, lActivePlayers) {
  avgPlayers <- floor((hActivePlayers + lActivePlayers) /2)
  pcms <- 1000 - avgPlayers
  pcms[pcms<0] <- 0
  return (sum(days*pcms))
}


# Call the function to get the same results as the above statements.
pcdYear(high_active_players, low_active_players)

# Create a function to get the difference in active players lower than 1,000 per day.
upcdYear <- function(hActivePlayers, lActivePlayers) {
  avgPlayers <- (hActivePlayers + lActivePlayers) / 2
  upcd <- avgPlayers - 1000
  upcd[upcd < 0] <- 0
  return (sum(days * upcd))
}

# Call the function to display the 
upcdYear(high_active_players, low_active_players)

# Function to calculate advertising costs needed to get the average daily player count to at least
# 1,000 players.
costNewPlayer <- function(avgPlayers) {
  upcd <- avgPlayers - 1000
  upcd[upcd < 0] <- 0
  return (sum(upcd) * 25.64)
}

# Call function
cat(paste0("The total needed to invest to increase the daily player count to 1,000 is $"
    ,costNewPlayer(avg_active_players)))