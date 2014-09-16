# server.R

library(quantmod)
library(forecast)
library(ggplot2)
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
            data <- dataInput()    
            data
        })
        
        forecastR <- reactive({
            fore <- forecast(dataInput(), h=input$fore_days)
            fore    
        })
        
        output$plot <- renderPlot({    
            inputData <- adjustedDataInput()
            fore <- forecastR()
#             plot(fore,axes = FALSE)
#             axis(2)
#             axis(1,at = pretty(1:length(index(inputData)),n = length(index(inputData))),
#                  labels = index(inputData),
#                  #cex.axis = 0.65
#                  )
            #gg_fore(fore)
            plot(fore)
        })
        
    }
)