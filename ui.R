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
  titlePanel("Playing With Colors and Points"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
       sliderInput("colors",
                   "How many colors?",
                   min = 1,
                   max = 657,
                   value = 5),
       sliderInput("points",
                   "How many points?",
                   min=100000,
                   max = 1000000,
                   value = 500000),
       h3("About"),
       p("This app creates a plot containg thousands of coloured circles. Pick 
         your numbers and print out a beautiful artwork to put on your living room. 
         You can even know how many unique shapes were created to tell everyone about it"),
       h4("How to use it"),
       p("Select how many colors and points you want adjusting the sliders above 
         and see the magic happening"),
       h4("Coding Summary"),
       p("The inputs are used to generate a ggplot using random coordinates points with 
         unique colors and sizes. The number is the multiplication of colors * points^2")
       
       
    ),
    
    # Show plot 
    mainPanel(
       plotOutput("plot"),
       h3("Number of unique shapes in your artwork:"),
       h4(textOutput("text"))
       
    )
  )
))
