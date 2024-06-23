setwd("C:/Users/amaru/my_git_repo/ATOMS_code_2024/data_integration_project_2024")


# Loading packages
library(readxl)
library(ggplot2)

# reading in parameter data
data <- read_excel("C:/Users/amaru/my_git_repo/ATOMS_code_2024/data_integration_project_2024/Mapping_File.xlsx", col_names = TRUE)

rows_to_skip <- 1:391

# Exclude the rows you want to skip
data <- data[-rows_to_skip, ]



# Electrical Conductivity
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Electrical Conductivity/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
    labs(title = paste("Map for Electrical Conductivity for the year 2022"),
         x = "Easting (m)",
         y = "Northing (m)",
         size = "Electrical Conductivity/max") +
    theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                        fill = NA, size = 1))

# TDS
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("TDS/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for TDS for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "TDS/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, size = 1))

# DOC 
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("DOC/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for DOC for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "DOC/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, size = 1))

# Cl
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Cl/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for Cl for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "Cl/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, size = 1))

# Sulphate/max
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Sulphatemax")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for Sulphate for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "Sulphate/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, size = 1))

# Na
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Na/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for Na for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "Na/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, 
                                                      size = 1))

# Al
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Al/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for Al for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "Al/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, 
                                                      size = 1))

# As
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("As/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for As for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "As/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, 
                                                      size = 1))

# Ba
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Ba/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for Ba for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "Ba/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, 
                                                      size = 1))

# Fe
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Fe/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for Fe for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "Fe/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, 
                                                      size = 1))

# Mn
ggplot(data, aes(x = Easting, y = Northing)) + 
  geom_point(aes(size = !!sym("Mn/max")), alpha = 0.6) + 
  scale_size_continuous(range = c(1, 10)) +  # Adjust the range to your preference
  labs(title = paste("Map for Mn for the year 2022"),
       x = "Easting (m)",
       y = "Northing (m)",
       size = "Mn/max") +
  theme_minimal() + theme(panel.border = element_rect(color = "black", 
                                                      fill = NA, 
                                                      size = 1))




