library(quantmod)
library(forecast)
library(ggplot2)
inputData <- getFX('BTC/USD',auto.assign = FALSE)
fore <- forecast(inputData, h=10)
plot(fore,axes = FALSE)
axis(2)
axis(1,at = pretty(1:length(index(inputData)), n = length(index(inputData))),
     labels = index(inputData),
     cex.axis = 0.65)

ggplot(fore,aes(x,y))+geom_line(aes(color="First line"))+
    #geom_line(data=df2,aes(color="Second line"))+
    labs(color="Legend text")

gg_fore <- function(forec.obj, data.color = 'blue', fit.color = 'red', forec.color = 'black',
         lower.fill = 'darkgrey', upper.fill = 'grey', format.date = F)
{
    serie.orig = forec.obj$x
    serie.fit = forec.obj$fitted
    pi.strings = paste(forec.obj$level, '%', sep = '')
    
    if(format.date)
        dates = as.Date(time(serie.orig))
    else
        dates = time(serie.orig)
    
    serie.df = data.frame(date = dates, serie.orig = serie.orig, serie.fit = serie.fit)
    
    forec.M = cbind(forec.obj$mean, forec.obj$lower[, 1:2], forec.obj$upper[, 1:2])
    forec.df = as.data.frame(forec.M)
    colnames(forec.df) = c('forec.val', 'l0', 'l1', 'u0', 'u1')
    
    if(format.date)
        forec.df$date = as.Date(time(forec.obj$mean))
    else
        forec.df$date = time(forec.obj$mean)
    
    p = ggplot() + 
        geom_line(aes(date, serie.orig, colour = 'data'), data = serie.df) + 
        geom_line(aes(date, serie.fit, colour = 'fit'), data = serie.df) + 
        scale_y_continuous() +
        geom_ribbon(aes(x = date, ymin = l0, ymax = u0, fill = 'lower'), data = forec.df, alpha = I(0.4)) + 
        geom_ribbon(aes(x = date, ymin = l1, ymax = u1, fill = 'upper'), data = forec.df, alpha = I(0.3)) + 
        geom_line(aes(date, forec.val, colour = 'forecast'), data = forec.df) + 
        scale_color_manual('Series', values=c('data' = data.color, 'fit' = fit.color, 'forecast' = forec.color)) + 
        scale_fill_manual('P.I.', values=c('lower' = lower.fill, 'upper' = upper.fill))
    
    if (format.date)
        p = p + scale_x_date()
    
    p
}