# Load packages
library(readxl)
library(dplyr)

# Function to find the closest soil profile
find_closest_soil_profile <- function(file_path, sheet_name, target_lat, target_lon) {
  df <- read_excel(file_path, sheet = sheet_name)
  df <- df %>%
    mutate(Longitude_diff = abs(Longitude - target_lon)) %>%
    arrange(Longitude_diff)
  
  closest_lon_row <- df[1,]
  df_filtered <- df %>%
    filter(Longitude == closest_lon_row$Longitude) %>%
    mutate(Latitude_diff = abs(Latitude - target_lat)) %>%
    arrange(Latitude_diff)
  
  closest_row <- df_filtered[1,]
  
  list(
    SoilProfile = closest_row$LocationCode,
    Latitude = closest_row$Latitude,
    Longitude = closest_row$Longitude
  )
}
