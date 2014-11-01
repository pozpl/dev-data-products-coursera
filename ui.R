library(shiny)

shinyUI(fluidPage(
    titlePanel("Currency forecast visualisation"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Select currency rates for prediction."),
            
            selectInput("currency", "Currency", 
                        choices=c("BTC/USD", "USD/EUR", "BTC/RUB", "USD/RUB")),
            
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
        
        
        mainPanel(
            plotOutput("plot"),
            
            h3("Documantation"),
            tags$ul(
                tags$li("Select currency rate to predict in dropdown list"), 
                tags$li("Use daterange selcectors to trainig range"), 
                tags$li("You can choose prediction range with help of slider")
            )
        )
    )
))