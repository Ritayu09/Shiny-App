
library(shiny)
library(MPV)
library(ggimage)
library(ggplot2)
library(corrplot)
library(RColorBrewer)


shinyServer(function(input, output) {
  
  # data
  data <- table.b3
  data$image <- "Blue Car.png"
  data$image[data$x11 == 0] <- "Red Car.png"
  data$Type <- "Automatic"
  data$Type[data$x11 == 0] <- "Manual"
  
  data2 <- data.frame(data)
  
  data$x6 <- factor(data$x6)
  data$x7 <- factor(data$x7)
  data$x11 <- factor(data$x11)
  
  choices <- c("Displacement (cubic in)" = "x1",
               "Horsepower (ft-lb)" = "x2",
               "Torque (ft-lb)" = "x3",
               "Compression Ratio" = "x4",
               "Rear axle ratio" = "x5",
               "Carburetor" = "x6",
               "Overall Length (in)" = "x8",
               "Width (in)" = "x9",
               "Weight (lb)" = "x10",
               "Number of gears" = "x7",
               "Transmission Type" = "x11")
  

  output$main_plot <- renderPlot({
    
    
    #plotTitle <- input$title
    ggplot(data2, aes(x = data2[,input$Car.Char], y)) + geom_point(aes(color = Type)) + scale_color_manual(values = c("blue", "red")) + geom_image(aes(image=image), size=data2$x7/75) +
      scale_x_continuous(breaks = unique(as.integer(seq(min(data2[,input$Car.Char], na.rm = TRUE)-2, max(data2[,input$Car.Char], na.rm = TRUE)+2, by = (max(data2[,input$Car.Char], na.rm = TRUE)+2-min(data2[,input$Car.Char], na.rm = TRUE)+2)/10)))) +
      scale_y_continuous(breaks = as.integer(seq(min(data2$y, na.rm = TRUE)-1, max(data2$y, na.rm = TRUE)+1, by = 5))) + 
      xlab(names(choices)[choices == input$Car.Char]) + ylab("Miles/gallon") + 
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black"), plot.title = element_text(colour = "black", size = 20, face = "bold", hjust = 0.5), plot.caption = element_text(color = "black", size = 12, face="bold.italic"), plot.subtitle = element_text(size = 13, hjust = 0.5)) + 
      labs(title = "Gasoline Mileage Performance",
           subtitle = paste("Relation between mileage, car type, transmission speed and", names(choices)[choices == input$Car.Char]),
           caption = "Size of car: Number of Gears: 3,4 or 5")
  })
  
  output$predictors <- renderUI({
    predx <- choices[!choices %in% input$Car.Char]
    checkboxGroupInput("predx", "Choose Predictor Varaible(s)", predx)
  })
    
  
  output$simple_summary <-renderPrint({
    df <- data.frame(data[,input$Car.Char])
    names(df)[1] <- names(choices)[choices == input$Car.Char]
    df$mileage <- data$y
    lm.simple <- lm(mileage~., data = df)
    summary(lm.simple)
  })    
  
  output$multiple_summary <-renderPrint({
    if (is.null(input$predx)) {
    df <- data.frame(data[,input$Car.Char])
    names(df)[1] <- names(choices)[choices == input$Car.Char]
    } else {
    df <- data[,names(data) %in% c(input$predx, input$Car.Char)]
    for(i in 1:length(names(df))){
      names(df)[i] = names(choices)[choices == names(df)[i]]
    }
    }
    df$mileage <- data$y
    lm.multiple <- lm(mileage~., data = df)
    summary(lm.multiple)
  })
  
  output$corr <- renderPlot({
    df <- table.b3
    names(df) <- c("mpg", "disp", "hp", "torque", "comp", "axle", "carb", "gear", "length", "width", "weight", "type")
    corr_res <- cor(df, use = "complete.obs", method = "pearson")
    corrplot.mixed(corr_res, upper = "color", number.cex = .8, tl.cex = 0.8)
  })
  
})