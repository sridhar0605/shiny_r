#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


## Only run examples in interactive R sessions
if (interactive()) {
  
  ui <- fluidPage(
    passwordInput("password", "Password:"),
    actionButton("go", "Go"),
    verbatimTextOutput("value")
  )
  server <- function(input, output) {
    output$value <- renderText({
      req(input$go)
      isolate(input$password)
    })
  }
  shinyApp(ui, server)
}