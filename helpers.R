if (!exists(".inflation")) {
  .inflation <- getSymbols('CPIAUCNS', src = 'FRED', 
     auto.assign = FALSE)
}  

# adjusts yahoo finance data with the monthly consumer price index 
# values provided by the Federal Reserve of St. Louis
# historical prices are returned in present values 
adjust <- function(data) {

      latestcpi <- last(.inflation)[[1]]
      inf.latest <- time(last(.inflation))
      months <- split(data)               
      
      adjust_month <- function(month) {               
        date <- substr(min(time(month[1]), inf.latest), 1, 7)
        coredata(month) * latestcpi / .inflation[date][[1]]
      }
      
      adjs <- lapply(months, adjust_month)
      adj <- do.call("rbind", adjs)
      axts <- xts(adj, order.by = time(data))
      axts[ , 5] <- Vo(data)
      axts
}

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
    print(colnames(forec.df));
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