#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
library(lubridate)
library(resample)
source("import_data.R")
import()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$ratingPopCorrPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    # x    <- faithful[, 2] 
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    b = bootstrap(data = ratings.por.filme, statistic = my_cor)
    ratings.popularity.cors = CI.bca(b, probs = c(.025, .975))
    
    data.frame(ratings.popularity.cors) %>% 
      ggplot(aes(x = c("correlação"), ymin = X2.5., ymax = X97.5.)) + 
      geom_errorbar(width = .2) 
  })
})
