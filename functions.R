# Load packages
library(readxl)
library(dplyr)

# Function to find the closest soil profile
find_closest_soil_profile <- function(file_path, sheet_name, target_lat, target_lon) {
  df <- readxl::read_excel(file_path, sheet = sheet_name)
  df <- df %>%
    mutate(
      Distance = sqrt((Latitude - target_lat)^2 + (Longitude - target_lon)^2)
    ) %>%
    arrange(Distance)
  
  closest_row <- df[1, ]
  
  list(
    SoilProfile = closest_row$LocationCode,
    Latitude = closest_row$Latitude,
    Longitude = closest_row$Longitude
  )
}
