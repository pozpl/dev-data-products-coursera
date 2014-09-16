library(shiny)

shinyUI(fluidPage(
    titlePanel("Currency forecast visualisation"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select currency rates for prediction."),
            
            selectInput("currency", "Currency", 
                        choices=c("BTC/USD", "USD/EUR", "BTC/RUB")),
            
            dateRangeInput("dates", 
                           "Date range",
                           start = "2014-01-01", 
                           end = as.character(Sys.Date())),
            
            actionButton("get", "Get currency rate"),
            
            br(), br(),
            
            sliderInput("fore_days",
                        "Forecast days:",
                        min = 0,
                        max = 50,
                        value = 1)
            
        ),
        
        
        mainPanel(plotOutput("plot"))
    )
))