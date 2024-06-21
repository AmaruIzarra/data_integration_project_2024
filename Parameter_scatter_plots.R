setwd("C:/Users/amaru/OneDrive/Desktop/ATOMS_lab_2024")
getwd()
# Installing packages
install.packages("readxl")
install.packages("ggplot2")

# Loading packages
library(readxl)
library(ggplot2)

# reading in parameter data
data <- read_excel("C:/Users/amaru/OneDrive/Desktop/ATOMS_lab_2024/Mapping_File.xlsx", col_names = TRUE)

rows_to_skip <- 1:391

# Exclude the rows you want to skip
data <- data[-rows_to_skip, ]



# Electrical Conductivity
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Electrical Conductivity/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
    labs(title = paste("Scatter Plot for Electrical Conductivity"),
         x = "Easting",
         y = "Northing",
         size = "Electrical Conductivity/max") +
    theme_minimal()

# TDS
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("TDS/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Scatter Plot for TDS"),
       x = "Easting",
       y = "Northing",
       size = "TDS/max") +
  theme_minimal()

# DOC 
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("DOC/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Scatter Plot for DOC"),
       x = "Easting",
       y = "Northing",
       size = "DOC/max") +
  theme_minimal()

# Cl
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Cl/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Scatter Plot for Cl"),
       x = "Easting",
       y = "Northing",
       size = "Cl/max") +
  theme_minimal()

# Sulphate/max
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Sulphatemax")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Scatter Plot for Sulphate"),
       x = "Easting",
       y = "Northing",
       size = "Sulphate/max") +
  theme_minimal()

# List of chemical parameters
chemical_parameters <- colnames(data)[19:ncol(data)]

chemical_parameters


