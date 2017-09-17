#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic 
shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
    
    colors <- input$colors
    points <- input$points
    coltot <- colors()
    # draw the histogram with the specified number of bins
    suppressMessages(suppressWarnings(require(ggplot2)))
    df <- data.frame(x = runif(sqrt(points), min=-1, max=1), 
                     y = runif(sqrt(points), min=-1, max=1),
                     col = as.factor(sample(seq_len(colors), sqrt(points), 
                                            replace=TRUE)),
                     size = as.factor(floor(abs(rnorm(sqrt(points), mean=5, sd=10)))))
    
    ggplot(df) + 
            geom_point(aes(x = x, y = y, color = col, size = size)) +
            xlab("") + ylab("") +
            theme(axis.line=element_blank(),axis.text.x=element_blank(),
                  axis.text.y=element_blank(),axis.ticks=element_blank(),
                  axis.title.x=element_blank(),
                  axis.title.y=element_blank(),legend.position="none",
                  panel.border = element_blank(),
                  panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank()) +
                  scale_color_manual(values = coltot[seq_len(colors)]) +
                  scale_size_manual(values = df$size)
    })
  output$text <- renderText({
          format(input$colors * input$points^2, 
                 scientific = FALSE, big.mark = ",")
  })
  
})
