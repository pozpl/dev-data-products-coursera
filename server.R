# server.R

library(quantmod)
source("helpers.R")

shinyServer(
    function(input, output) {
        dataInput <- reactive({
            getFX(input$currency,
                  from = input$dates[1],
                  to = input$dates[2],
                  auto.assign = FALSE)
        })
        
        adjustedDataInput <- reactive({
            if (input$adjust){ 
                data <- adjust(dataInput())}
            else{
                data <- dataInput()    
            }
            data
        })
        
        output$plot <- renderPlot({    
            chartSeries(adjustedDataInput(), theme = chartTheme("white"), 
                        type = "line", log.scale = input$log, TA = NULL)
        })
        
    }
)