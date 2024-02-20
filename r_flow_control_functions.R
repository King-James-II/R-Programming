# Conditional Statements to tell whether the attack was strong enough to slay the monster.
attack <- 85
monster_hp <- 150
cat("You swing for", attack, "damage.\n")
if (attack >= monster_hp) {
  cat("The monster has been slain!\n")
  monster_hp <- 0
} else {
  monster_hp <- monster_hp-attack
  cat("Your swing hits and the monster still stands with", monster_hp, "HP.\n") 
}
attack <- 65
cat("You swing for", attack, "damage.\n")
if (attack >= monster_hp) {
  cat("The monster has been slain!\n")
} else {
  cat("The monster still stands.\n") 
}

# Create and print and modify specific values in a vector. 
attack_swings <- c(50, 60, 55, 75, 40, 65, 70, 80, 55, 90)
cat("Printing the attack swings of the game character:\n", attack_swings, "\n")
attack_swings[5] <- 80
cat(paste0 ("The 8th swing crits for double damage of ", attack_swings[8], "!"))
cat("Printing the updated attack swings of the game character:\n", attack_swings)

# Find and print data type of attack swings vector
cat("The data type of the attack swings vector is", typeof(attack_swings), "\n")

# Find and print length of attack swings vector.
cat("The length of the attack swings vector is", length(attack_swings), "\n")

# Use Sequence to create a sequence with 10 values and print to console.
attack_swings2 <- seq(40, 90, by= 5)
cat("Printing the possible attack swings of the game character:\n", attack_swings2, "\n")

# Replicate the vector and repeat it twice to simulate dual wielding weapons swinging double speed.
dual_wield_attack <- as.integer((rep(attack_swings, 2))/2)
cat("The attack swings of the players dual wield weapons:\n", dual_wield_attack, "\n")

# Replicate the vector and repeat it twice to simulate a 2-handed weapon swinging at half speed.
two_hand_attack <- (rep(attack_swings, 1, 5))*2
cat("The attack swings of the players 2-handed weapon:\n", two_hand_attack, "\n")

# Create a function to create the same dual wield weapon swings
dual_wield <- function(atkswings) {
  dual_wield_attack <- rep(atkswings, 2)
  dual_wield_attack <- dual_wield_attack/2
  dual_wield_attack <- floor(dual_wield_attack)
  cat("The player swung the following dual wield weapon swings:\n")
  return (dual_wield_attack)
}

# Call function with vector passed in to print to the user.
cat(dual_wield(attack_swings), "\n")
cat(dual_wield(attack_swings2), "\n")

# Create a function to create the same 2-handed weapon swings
two_hand <- function(atkswings) {
  two_hand_attack <- rep(atkswings, 1, 5)
  two_hand_attack <- two_hand_attack*2
  two_hand_attack <- floor(two_hand_attack)
  cat("The player swung the following 2-handed weapon swings:\n")
  return (two_hand_attack)
}

# Call function with vector passed in to print to the user.
cat(two_hand(attack_swings), "\n")
cat(two_hand(attack_swings2), "\n")


summoners <- c("ShadowNinja", "StormMage", "IronWarrior", "MysticArcher", "FlameSorcerer", 
                  "FrostBard", "AstralRogue", "NatureDruid", "CelestialMonk", "CrystalPaladin")
kda_scores <- c(7.2, 6.8, 5.5, 8.0, 7.5, 3.1, 4.9, 6.2, 5.0, 6.5)

# Function to determine a players KDA letter grade for a video game.
displayGameGrade <- function(summoner, kda) {
  if (kda >= 8) {
    cat(paste0("\n", summoner, "\nKDA:", kda, "\nGame Rank: S+\n"))
  } else if (kda >= 7 && kda < 8) {
    cat(paste0("\n", summoner, "\nKDA:", kda, "\nGame Rank: S\n"))
  } else if (kda >= 6 && kda < 7) {
    cat(paste0("\n", summoner, "\nKDA:", kda, "\nGame Rank: S-\n"))
  } else if (kda >= 5 && kda < 6) {
    cat(paste0("\n", summoner, "\nKDA:", kda, "\nGame Rank: A\n"))
  } else if (kda >= 3 && kda < 5) {
    cat(paste0("\n", summoner, "\nKDA:", kda, "\nGame Rank: B\n"))
  } else if (kda >= 1 && kda < 3) {
    cat(paste0("\n", summoner, "\nKDA:", kda, "\nGame Rank: C\n"))
  } else {
    cat(paste0("\n", summoner, "\nKDA:", kda, "\nGame Rank: D\n"))
  }
}

# Loop to call the function for each player to display their score and grade.
for (summoner in 1:length(summoners))
  displayGameGrade(summoners[summoner], kda_scores[summoner])

# Store for loop into a function.
process_Player_Grades <- function(players, scores) {
  for (player in 1:length(players))
    displayGameGrade(players[player], scores[player])
}

# Call the function to perform the previously created function.
process_Player_Grades(summoners, kda_scores)


# Create vector 1 to 100 
v1 <- seq(1,100)
# Create vector from 0 to 100 multiples of 5
v2 <- seq(0,100, by=5)
# Create vector which contains the previous vectors.
v3 <- c(v1,v2)