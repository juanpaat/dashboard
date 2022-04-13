library(shiny)
library(readxl)
library(ggplot2)
library(ggpubr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Dashboar - Daily Tracker"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          checkboxGroupInput(
            inputId="variables",
            label="Choose the variables",
            choices = c("Hola"="Hola","Chao"="Chao")
          ),
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
