Visualisation of currency rates forecasting
========================================================
author: Pavel Pozdnyak
date: 2014-09-18

Prerequisites
========================================================

First of all we must load all necessary libraries

```r
library(quantmod)
library(forecast)
```
And then load for currencies rates with *getFX* function

```r
 getFX(input$currency, 
       from = input$dates[1], 
       to = input$dates[2],     
       auto.assign = FALSE)
```
Plot currency rates chart
========================================================
After obtaining currency rate application do some forecasting for period given by a user

```r
fore <- forecast(dataInput(), 
                 h=input$fore_days)
```

```
    Point Forecast Lo 80 Hi 80 Lo 95 Hi 95
501          451.4 420.0 484.0 401.5 501.3
502          449.8 405.2 497.8 382.4 527.0
503          448.5 392.9 508.1 365.6 544.8
504          447.4 382.4 518.8 351.3 560.2
505          446.5 373.1 531.8 339.0 581.4
506          445.7 363.6 540.5 324.8 601.8
507          445.1 354.4 550.5 314.0 617.2
508          444.5 345.7 559.2 304.1 634.8
509          444.1 338.9 569.2 295.4 649.2
510          443.7 332.5 576.9 286.9 658.2
```

Plottin a forecast
========================================================

![plot of chunk unnamed-chunk-5](DevelopingDataProductsPresentation-figure/unnamed-chunk-5.png) 

Accnowlegments 
========================================================
## Thank you for your time!

Link to application installation

[https://pozpl.shinyapps.io/DevelopingDataProductsCP/](https://pozpl.shinyapps.io/DevelopingDataProductsCP/)

Link to github

[https://github.com/pozpl/dev-data-products-coursera](https://github.com/pozpl/dev-data-products-coursera)
