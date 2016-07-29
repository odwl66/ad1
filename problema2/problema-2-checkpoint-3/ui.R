#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Selecione o estado e o tipo de gasto dos parlamentares:"),
  
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("tipo.gasto", "Tipo de gasto:", 
                  choices=levels(dados$txtDescricao)),
      selectInput("estado", "UF:", 
                  choices=levels(dados$sgUF))
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("gastos.deputados")  
    )
  )
))
