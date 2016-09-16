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
  titlePanel("Problema 4 checkpoint 3"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      p("Para este checkpoint queremos responder inicialmente a seguinte pergunta:"),
      p("Quanto mais popular, mais bem avaliado é o filme?"),
      plotOutput("ratingPopCorrPlot"),
      p("Vemos que apesar de estatísticamente não ter uma alta correlação, podemos ver 
        que existe alguma correlação entre as avaliações e a popularidade."),
      p("Com isso faremos outra pergunta:"),
      p("Será que existe um gênero que a popularidade é mais relacionada à avaliação?"),
      p("Em seguida vamos responder a seguinte pergunta:"),
      p("Existe relação entre o dia da semana e a avaliação?")
    )
  )
))
