library(shiny)
library(readxl)
library(ggplot2)
library(ggpubr)
library(tidyr)
library(dplyr)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

      output$distPlot <- renderPlot({
      
      data<-read_excel("/cloud/project/daily_routine.xlsx")
      data2 <- read_excel("/cloud/project/daily_routine.xlsx",sheet = "Sheet3")
      data2 <- data2 %>%
        gather(key="variable",
               value="valor",
               names(data2)[2:10])
      
       a <- ggplot(data=data, aes(x=Date, y=J_O))+
        geom_line()+
         ggtitle(input$variables)
      

       b <- ggplot(data)+
         geom_point(aes(x=Date, y=Go_bed))+
         geom_point(aes(x=Date, y=Wake_up))+
         geom_segment(aes(x=Date, xend=Date, y=Go_bed, yend=Wake_up))
       
       c <-ggplot(data2)+
         geom_tile(aes(x=Date,y=variable,fill=as.factor(valor)))
       
       
       
       ggarrange(a , b , c, ncol = 1, nrow = 3)
       

    })

})
