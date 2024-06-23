setwd("C:/Users/amaru/my_git_repo/ATOMS_code_2024")

# Installing packages
# install.packages("readxl")
# install.packages("ggplot2")


# Loading packages
library(readxl)
library(ggplot2)

# reading in parameter data
data <- read_excel("C:/Users/amaru/my_git_repo/ATOMS_code_2024/data_integration_project_2024/Mapping_File.xlsx", col_names = TRUE)

# collecting the parameter data for the year 2000: lines 019-035
data2000 <- data[18:34, ]
# collecting the parameter data for the year 2009: lines 172-188
data2009 <- data[171:187, ]
# collecting the parameter data for the year 2012: lines 223-239
data2012 <- data[222:238, ]
# collecting the parameter data for the year 2017: lines 308-324
data2017 <- data[307:323, ]
# collecting the parameter data for the year 2019: lines 342-358
data2019 <- data[341:357, ]
# collecting the parameter data for the year 2022: lines 393-409
data2022 <- data[392:408, ]

# collecting each parameter data for each year

# List of normalized chemical parameters
chemical_parameters <- colnames(data)[19:ncol(data)]
chemical_parameters

years <- c(2000, 2009, 2012, 2017, 2019, 2022)
years_data <- c(data2000, data2009, data2012, data2017, data2019, data2022)

# Electrical Conductivity
boxplot(c(data2000["Electrical Conductivity/max"], data2009["Electrical Conductivity/max"], data2012["Electrical Conductivity/max"], 
          data2017["Electrical Conductivity/max"], data2019["Electrical Conductivity/max"], data2022["Electrical Conductivity/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "Electrical Conductivity")

# TDS
boxplot(c(data2000["TDS/max"], data2009["TDS/max"], data2012["TDS/max"], 
          data2017["TDS/max"], data2019["TDS/max"], data2022["TDS/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "TDS")

# DOC
boxplot(c(data2000["DOC/max"], data2009["DOC/max"], data2012["DOC/max"], 
          data2017["DOC/max"], data2019["DOC/max"], data2022["DOC/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "DOC")

# Cl
boxplot(c(data2000["Cl/max"], data2009["Cl/max"], data2012["Cl/max"], 
          data2017["Cl/max"], data2019["Cl/max"], data2022["Cl/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "Cl")

# Sulphate
boxplot(c(data2000["Sulphatemax"], data2009["Sulphatemax"], data2012["Sulphatemax"], 
          data2017["Sulphatemax"], data2019["Sulphatemax"], data2022["Sulphatemax"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "Sulphate")

# Na
boxplot(c(data2000["Na/max"], data2009["Na/max"], data2012["Na/max"], 
          data2017["Na/max"], data2019["Na/max"], data2022["Na/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "Na")

# Al
boxplot(c(data2000["Al/max"], data2009["Al/max"], data2012["Al/max"], 
          data2017["Al/max"], data2019["Al/max"], data2022["Al/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "Al")

# As
boxplot(c(data2000["As/max"], data2009["As/max"], data2012["As/max"], 
          data2017["As/max"], data2019["As/max"], data2022["As/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "As")

# Ba
boxplot(c(data2000["Ba/max"], data2009["Ba/max"], data2012["Ba/max"], 
          data2017["Ba/max"], data2019["Ba/max"], data2022["Ba/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "Ba")

# Fe
boxplot(c(data2000["Fe/max"], data2009["Fe/max"], data2012["Fe/max"], 
          data2017["Fe/max"], data2019["Fe/max"], data2022["Fe/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "Fe")

# Mn
boxplot(c(data2000["Mn/max"], data2009["Mn/max"], data2012["Mn/max"], 
          data2017["Mn/max"], data2019["Mn/max"], data2022["Mn/max"]), 
        names = years, col = c("red", "blue", "green", "yellow", "purple", "orange"),
        xlab = "Year", ylab = "Mn")
