library(shiny)
library(dplyr)
library(ggplot2)
library(scales)
source("import_data.R")
import_data()

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
