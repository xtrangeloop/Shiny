library(shiny)


# Define UI for application
ui <- fluidPage(
  titlePanel("Exploring Quadratic Equations"),
  
  # Sidebar with a slider input
  sidebarLayout(
    sidebarPanel(
      h3("Ax^2 + Bx + C"), 
      br(),
      helpText("Move the A, B, and C sliders to explore their interactions on the parabola."),
      sliderInput("aDirection", "'A' determines the direction (up or down) and width.",
                  min = -5, max = +5, step = .1, value = 1),
      br(),
      sliderInput("xIntercept", "'B' shifts the parabola along the x-axis (left and right).",
                  min = -5, max = 5, step = 1, value = 0),
      br(),
      sliderInput("yIntercept", "'C' shifts the parabola along the y-axis (up and down).",
                  min = -5, max = +5, step = 1, value = 0),
      
      br(),
      
      helpText("The whole code and data can ", 
               tags$a(href="https://github.com/xtrangeloop/Shiny", 
                      "be found here."),),
      br(),
      helpText("Author: xtrangeloop as part of the Coursera Data Science coursework,
                     specifically in the class Developing Data Products.") 
    ),
    # Show a plot of the generated distribution
    mainPanel(
      h4("All quadratic equations form a U-shaped graph called a parabola. 
         Use the sliders to the left to explore the resulting parabolas."),
      helpText("What happens when you set A = 0?"),
      plotOutput("distPlot")
    )
  )
)


# Draws UI