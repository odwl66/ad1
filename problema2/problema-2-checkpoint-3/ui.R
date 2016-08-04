library(shiny)
source("import_data.R")
import_data()
shinyUI(fluidPage(
  
  titlePanel("Selecione o estado e o tipo de gasto dos parlamentares:"),
  
  sidebarLayout(      
    
    sidebarPanel(
      selectInput("tipo.gasto", "Tipo de gasto:", 
                  choices=levels(dados$txtDescricao)),
      selectInput("estado", "UF:", 
                  choices=levels(dados$sgUF))
    ),
    
    mainPanel(
      p("No gráfico abaixo é possível verificar os gastos dos deputados 
        federais brasileiros no ano de 2016, onde podemos selecionar o tipo
        do gasto, além do estado."),
      plotOutput("gastos.deputados"),
      hr(),
      p("Note a disparidade dos gastos da manutenção de escritório de apoio
        à atividade parlamentar em Minas Gerais, onde alguns gastam mais de 
        R$70000,00 enquanto outros gastam perto de zero."),
      p("Ou de consultorias, pesquisas e trabalhos técnicos em São Paulo,
        onde existem parlamentares que gastaram cerca de R$80000,00 
        nesta categoria de gastos, enquanto outros gastaram próximo de zero."),
      p("Em alguns tipos de gastos podemos perceber a presença de certos 
        grupos, como passagens aéreas na Paraíba, onde temos um grupo que
        gasta mais de R$3500,00 e outro que gasta menos que R$1000,00."),
      p("Em alguns tipos de gasto podemos perceber a presença de outliers, 
        como o fornecimento de alimentação do parlamentar em São Paulo, 
        onde o deputado Roberto Freire gastou mais de 3 vezes mais que
        a mediana dos gastos deste estado.")
    )
  )
))
