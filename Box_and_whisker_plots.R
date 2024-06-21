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
boxplot(c(data2000["TDS/max"], data2009["TDS/max"]))

for (chemical in chemical_parameter){
  for (y_data in years_data){
    count <- count + 1
    
  }
}
