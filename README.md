# SoilDataExplorer
SoilDataExplorer is a project designed to extract soil profile data from multiple country files, organize the data into an Excel file, and build a Shiny app that allows users to query soil profile information based on latitude and longitude. The project is divided into two main objectives: data extraction and Shiny app development.

---

**Table of Contents**
1. [Introduction](#introduction)
1. [Objectives](#objectives)
1. [Features](#features)
1. [Installation](#installation)
1. [Usage](#usage)
1. [Project Structure](#project-structure)

## Introduction
SoilDataExplorer is developed to facilitate the process of accessing and querying high-resolution soil profile data for various countries. The project involves extracting data from text files, organizing the data into an Excel file, and creating a user-friendly Shiny app for querying the soil profiles based on user-specified coordinates.

## Objectives
### Objective 1: Extract Soil Data to Excel
1. Read the data files for each country.
1. Extract soil profile names, latitude, and longitude.
1. Organize the extracted data into an Excel file with separate sheets for each country.
1. Save the Excel file.

### Objective 2: Build a Shiny App for Soil Profile Query
1. Create a basic Shiny app structure.
1. Implement a dropdown list for country selection.
1. Load the Excel file data into the Shiny app.
1. Create input fields for latitude and longitude.
1. Implement a function to find the closest soil profile based on latitude and longitude.
1. Display the result to the user.
1. Test the Shiny app for various countries and coordinates.

## Features
- Extract soil profile data from multiple country files.
- Organize soil data into a well-structured Excel file.
- User-friendly Shiny app for querying soil profile information.
- Real-time search for closest soil profiles based on user input coordinates.

## Installation
### Prerequesite
- R (version 4.0.0 or higher)
- RStudio (optional but recommended)
- R packages: `readxl`, `writexl`, `shiny`, `dplyr`

### Steps
1. Clone the repository:
```bash
git clone https://github.com/KlausSipope/SoilProfileFinder.git
cd SoilProfileFinder
```

2. Install the required R packages:
```R
install.packages(c("readxl", "writexl", "shiny", "dplyr"))
```

## Usage
### Data Extraction
1. Run the data_processing.R script to extract soil profile data and save it into an Excel file:
```R
source("data_processing.R")
```

### Shiny App
1. Run the Shiny app using the app.R script:
```
shiny::runApp("app.R")
```

2. Open your web browser and navigate to the local address provided by the Shiny app to interact with the soil profile query tool.

## Project Structure
```plaintext
SoilProfileFinder/
│
├── data_processing.R    # Script for data extraction and Excel file creation
├── app.R                # Main Shiny app script
├── functions.R          # Helper functions for the Shiny app
├── README.md            # Project documentation
└── data/                # Directory to store the downloaded data files
```

