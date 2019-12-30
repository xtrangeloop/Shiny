library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Horsepower from MPG"),
    sidebarLayout(
        sidebarPanel(
            helpText("Learn about the interaction between horsepower and miles per gallon."),
            br(),
            sliderInput("sliderMPG", "What is the MPG of the car?", 
                        10, 35, value = 20),
            checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
            br(),
                    
            helpText("The whole code and data can ", 
                             tags$a(href="https://github.com/xtrangeloop/Shiny", 
                                    "be found here."),),
            br(),
            helpText("Author: xtrangeloop as part of the Coursera Data Science coursework,
                     specifically in the class Developing Data Products.") 
            
            ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Horsepower from Model 1:"),
            textOutput("pred1"),
            h3("Predicted Horsepower from Model 2:"),
            textOutput("pred2")

        )
    )
))