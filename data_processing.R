# Loading packages
library("readr")
library("readxl")
library("dplyr")
library("writexl")

# Function to extract information and save to Excel sheets
extract_and_save_to_excel <- function(folder_path, excel_output_path) {
  sheet_list <- list()
  
  for (file_path in file_paths) {
    lines <- read_lines(file_path)
    location_codes <- c()
    latitudes <- c()
    longitudes <- c()
    location_code <- NULL
    
    for (i in seq_along(lines)) {
      line <- lines[i]
      
      # Check if the line contains location code information
      if (startsWith(line, "*")) {
        location_code <- trimws(substr(line, 2, 12))
        print(paste("Found location code:", location_code))
      }
      
      # Check if the line contains latitude and longitude information
      if (grepl("-99", line)) {
        parts <- unlist(strsplit(trimws(line), "\\s+"))
        
        # Ensure there are enough parts to extract lat and lon
        if (length(parts) >= 4) {
          lat <- as.numeric(parts[3])
          lon <- as.numeric(parts[4])
          
          # Check if lat and lon are not missing and are numeric
          if (!is.na(lat) && !is.na(lon)) {
            # Store the extracted information
            location_codes <- c(location_codes, location_code)
            latitudes <- c(latitudes, lat)
            longitudes <- c(longitudes, lon)
            print(paste("Extracted lat/lon:", lat, lon))
          } else {
            print(paste("Invalid lat/lon values:", parts[3], parts[4]))
          }
        } else {
          print(paste("Not enough parts to extract lat/lon:", parts))
        }
      }
    }
    
    # Create a data frame with the extracted information
    df <- data.frame(
      LocationCode = location_codes,
      Latitude = latitudes,
      Longitude = longitudes,
      stringsAsFactors = FALSE
    )
    
    # Add the data frame to the list with a sheet name based on the file name
    sheet_name <- basename(file_path)
    sheet_list[[sheet_name]] <- df
  }
  
  # Write all data frames to a single Excel file with multiple sheets
  write_xlsx(sheet_list, excel_output_path)
  
  cat("Data has been successfully written to", excel_output_path, "\n")
}

# Example usage
folder_path <- "/folder_path"
excel_output_path <- "excel_output_path"
extract_and_save_to_excel(folder_path, excel_output_path)
