library("shiny")
# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
source("App.R")
source("server.R")
# You will need to fill in the `app_ui.R` file to create the layout.
# Run the app through this file.
shinyApp(ui,server)
# Create a new `shinyApp()` using the loaded `ui` and `server` variables

