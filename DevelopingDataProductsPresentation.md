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
501          451.4 418.1 484.0 401.5 501.2
502          449.8 402.5 496.8 378.5 523.7
503          448.5 391.6 506.7 363.4 540.4
504          447.4 381.6 520.1 349.7 563.1
505          446.5 372.5 529.7 336.9 579.7
506          445.7 364.2 540.0 326.1 595.5
507          445.1 355.3 546.5 315.0 613.7
508          444.5 348.7 558.0 305.3 631.7
509          444.1 341.1 566.4 296.4 644.2
510          443.7 334.9 573.7 287.9 658.5
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
