library(rstudioapi)

# Get the directory of the currently executing script
script_path <- dirname(rstudioapi::getSourceEditorContext()$path)

# Specify the file name
file_name <- "game_spells.csv"

# Create the full file path using file.path
file_path <- file.path(script_path, file_name)

# Read the data from the CSV file
spell_data <- read.csv(file_path)

# Access columns
mana_cost <- spell_data$`Mana.Cost`
magic_dmg <- spell_data$`Magic.Damage`
spells <- spell_data$Spell
levels <- spell_data$Level

# Create the scatter plot
plot(mana_cost, magic_dmg, type="p", main="Mana Cost & Magic Damage Scatter Plot", xlab="Mana Cost", ylab="Magic Damage")

# Print messages if values found
if(45 %in% mana_cost) { print('Found') }

if('Lightning Bolt' %in% spells) { print("Casting Lightning Bolt!") } else { print("Spell doesn't exist.") }

if('Frost Nova' %in% spells) { print("Casting Frost Nova!") } else {print("Spell doesn't exist.")}

# Create monster levels and exp earned values 
monster_levels <- c(5, 10, 15, 20, 25, 30, 35, 40, 50, 55, 60)
xp_earned <- c(85, 120, 145, 170, 195, 220, 245, 270, 295, 320, 345)

# Graph values to pie graph
pie(monster_levels,xp_earned)

# Create a string vector of usernames
usernames <- c("BladeMasterX", "CelestialWitch", "ThunderSorcerer", "DragonSlayer99", "FrostNovaMage",
               "ShadowRogue27", "GalacticKnight", "ValkyrieWarrior", "CyberSamurai88", "EternalChampion")

# Get the length of the Spells vector
num_spells <- length(spells)

# Use a for loop to iterate through the Spells
for (i in 1:num_spells) {print(spells[i])}

# Get the length of the Spells vector
num_spells <- length(spells)

# Use a for loop to iterate through the Spell data
cat("Spells:\n")
for (i in 1:num_spells) {
  cat("Name:" ,spells[i], "\n")
  cat("Mana Cost:",mana_cost[i], "\n")
  cat("Magic Damage:",magic_dmg[i], "\n")
  cat("Level Acquired:",levels[i], "\n")
  cat("\n")
  }
