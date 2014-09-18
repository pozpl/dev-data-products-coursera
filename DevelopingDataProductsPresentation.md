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
501          451.4 419.4 484.0 403.0 499.1
502          449.8 404.9 496.8 383.2 524.4
503          448.5 392.1 509.8 364.8 545.3
504          447.4 381.0 519.4 352.9 562.8
505          446.5 371.3 528.8 336.6 580.7
506          445.7 361.3 539.0 322.9 598.4
507          445.1 354.1 546.8 311.3 617.1
508          444.5 347.9 557.2 305.0 627.4
509          444.1 339.9 566.3 293.7 649.3
510          443.7 332.4 575.5 285.6 660.1
```

Plotting a forecast
========================================================

![plot of chunk unnamed-chunk-5](DevelopingDataProductsPresentation-figure/unnamed-chunk-5.png) 

Acknowledgements 
========================================================
## Thank you for your time!

Link to application installation

[https://pozpl.shinyapps.io/DevelopingDataProductsCP/](https://pozpl.shinyapps.io/DevelopingDataProductsCP/)

Link to github

[https://github.com/pozpl/dev-data-products-coursera](https://github.com/pozpl/dev-data-products-coursera)
