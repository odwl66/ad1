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
library(scales)
dados <- read.csv("../../problema1/ano-atual.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$gastos.deputados <- renderPlot({
    dados.filtrados <- dados %>% 
      filter(sgUF == input$estado & txtDescricao == input$tipo.gasto) %>%
      group_by(txNomeParlamentar, txtDescricao, sgPartido) %>%
      summarise(gasto = sum(vlrDocumento))
    
    ggplot(dados.filtrados) +
      geom_bar(aes(x = reorder(txNomeParlamentar, desc(gasto)), y = gasto, fill = sgPartido), stat = "identity") +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) + 
      scale_y_continuous(labels = comma) +
      ggtitle("Gasto dos parlamentares") +
      xlab("Parlamentares")
  })
  
})
