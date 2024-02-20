# Create vectors with correlating item stat values of attack power and crit chance
attack_power <- c(120, 150, 80, 200, 90, 130, 175, 110, 160, 140)
crit_chance <- c(10, 15, 5, 8, 12, 7, 20, 6, 10, 14)

# Call mean function and print value to menu.
mean_ap <- mean(attack_power)
mean_cc <- mean(crit_chance)
cat(mean_ap, "is the average attack power of items in the game.\n")
cat(mean_cc, "is the average crit chance of items in the game.\n")

# Call median function and print value.
median_ap <- median(attack_power)
median_cc <- median(crit_chance)
cat("The Median attack power of the items is:", median_ap, "\n")
cat("The Median crit chance of the items is:", median_cc, "\n")

# Call range function to find highest and lowest values of the data set.
range_ap <- range(attack_power)
range_cc <- range(crit_chance)
cat("The range of attack power of items of the game is between", range_ap[1], "and", range_ap[2], 
    "\n")
cat("The range of crit chance of items of the game is between", range_cc[1], "and", range_cc[2], 
    "\n")

# Call Standard deviation (sd) function and print it to console.
stdev_ap <- sd(attack_power)
stdev_cc <- sd(crit_chance)
cat("The standard deviation of attack power of items is:", stdev_ap, "\n")
cat("The standard deviation of attack power of items is:", stdev_cc, "\n")

# Establish vector with NPC names
npc_names <- c("Daring Darcy", "Shadowy Sam", "Mystic Mia", "Cautious Charlie", "Radiant Riley",
                   "Brave Bella", "Sly Simon", "Clever Chloe", "Mysterious Max", "Silent Sophia")

#Print NPC names to console in all capitals using toupper() function.
print("NPC names:")
for (npc_name in npc_names) {
  cat(toupper(npc_name), "\n")}

# Can also use it on the vector itself like this:
upper_names <- toupper(npc_names)
print(upper_names)

# Create matrix using vectors and print the values to the console:
matrix_ap <- matrix(attack_power)
matrix_cc <- matrix(crit_chance)
cat("Attack power matrix:\n")
for (i in 1:nrow(matrix_ap)) {
    cat(matrix_ap[i], "\n")
}
cat("Crit chance matrix:\n")
for (i in 1:nrow(matrix_cc)) {
  cat(matrix_cc[i], "\n")
}

# Use lm function to perform linear regression and print to console.
linearcc <- lm(attack_power ~ crit_chance)
print (linearcc)
linearap <- lm(crit_chance ~ attack_power)
print (linearap)

# Use help function to search for nlm
help.search("nlm")