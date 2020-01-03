library(shiny)
library(ggplot2)

# in the following we give the function for caluclating parabola
Calculate <- function(x, aDirection, xIntercept, yIntercept) {
  y <- (aDirection*x^2) + (xIntercept * x) + (yIntercept) 
  data.frame(x=x, y=y)
}

# Define server logic required to design our shinyapp
serverLogic <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    xIntercept <- input$xIntercept
    yIntercept <- input$yIntercept
    aDirection <- input$aDirection
    
    baseParabola <- Calculate(seq(-10,10,by=0.1), aDirection = 1, xIntercept = 0, yIntercept = 0)
    
    xyGrid <- Calculate(0, aDirection = 1, xIntercept = 0, yIntercept = 0)
    
    newParabola <- Calculate(seq(-10,10,by=0.1), aDirection = aDirection, xIntercept = xIntercept, yIntercept = yIntercept)
    
    # draw the plot  
    ggplot() +
      ggtitle(paste0("y = ", aDirection, "x^2 + ", xIntercept, "x + ", yIntercept, ")")) + 
      coord_cartesian(xlim = c(-10, 10), ylim = c(-10, 10)) +
      geom_line(data=baseParabola, aes(x=x, y=y), size=2, color="black", alpha=0.3) + 
      geom_vline(data=xyGrid, aes(xintercept = x), size=2, color="red", alpha=0.3) +
      geom_hline(data=xyGrid, aes(yintercept=y), size=2, color="red", alpha=0.3) +
      geom_line(data=newParabola, aes(x=x, y=y), size=1, color="blue")  
  
  }, height = 500, width = 500)
  
}

# Add serverLogic
shinyServer(serverLogic)