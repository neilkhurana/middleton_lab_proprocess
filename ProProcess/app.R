## app.R ##
library(shinydashboard)
library(shiny)
library(ggplot2)
library()

ui <- dashboardPage(
    skin = "purple",
    dashboardHeader(title = "ProProcess"),
    dashboardSidebar(sidebarMenu
                     (
        menuItem("Home", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Filtering", tabName = "widgets", icon = icon("th"))
     )
    ),
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "dashboard",
                    fluidRow(
                        box(plotOutput("plot1", height = 250)),
                        
                        box(
                            title = "Controls",
                            sliderInput("slider", "Number of observations:", 1, 100, 50)
                        )
                    )
            ),
            
            # Second tab content
            tabItem(tabName = "widgets",
                    h2("Widgets tab content")
            )
        )
    )
)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)