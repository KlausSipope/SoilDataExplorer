# Load package
library(shiny)

# function.R
source("functions.R")

ui <- fluidPage(
  titlePanel("Soil Profile Search"),
  sidebarLayout(
    sidebarPanel(
      selectInput("country", "Select Country:", choices = NULL),
      numericInput("latitude", "Enter Latitude:", value = 0),
      numericInput("longitude", "Enter Longitude:", value = 0),
      actionButton("submit", "Find Closest Soil Profile")
    ),
    mainPanel(
      textOutput("result")
    )
  )
)

server <- function(input, output, session) {
  # Load country names from the Excel file
  observe({
    file_path <- "soil_data.xlsx"
    sheets <- excel_sheets(file_path)
    updateSelectInput(session, "country", choices = sheets)
  })
  
  # Find the closest soil profile
  observeEvent(input$submit, {
    file_path <- "soil_data.xlsx"
    country <- input$country
    target_lat <- input$latitude
    target_lon <- input$longitude
    
    result <- find_closest_soil_profile(file_path, country, target_lat, target_lon)
    
    output$result <- renderText({
      paste("Closest soil profile:", result$SoilProfile, "\n",
            "\nLatitude:", result$Latitude, "\n",
            "Longitude:", result$Longitude)
    })
  })
}
 
shinyApp(ui = ui, server = server)
