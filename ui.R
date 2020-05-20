
library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Car Dataset Analysis"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("Car.Char", "Car Characteristic:",
                  c("Displacement (cubic in)" = "x1",
                    "Horsepower (ft-lb)" = "x2",
                    "Torque (ft-lb)" = "x3",
                    "Compression Ratio" = "x4",
                    "Rear axle ratio" = "x5",
                    "Carburetor" = "x6",
                    "Overall Length (in)" = "x8",
                    "Width (in)" = "x9",
                    "Weight (lb)" = "x10")),
      checkboxInput('simple_regression','Run Simple Linear Regression'),
      checkboxInput("pred_type", 'Run Multiple Linear Regression'),
      helpText("Note: By default, Multiple Linear Regression will include the variable selected in
               dropdown above."),
      checkboxInput("corr", 'View Correlation Plot'),
      conditionalPanel(
        condition = "input.pred_type == true",
        uiOutput('predictors')
      ),
      conditionalPanel(
        condition = "input.pred_type == false",
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      conditionalPanel(
        condition = 'input.corr==false',
        plotOutput("main_plot"),        
        conditionalPanel(
          condition = 'input.simple_regression==true',
          h4("Simple Linear Regression Summary"),
          verbatimTextOutput("simple_summary")
        ),
        conditionalPanel(
          condition = 'input.pred_type==true',
          h4("Multiple Linear Regression Summary"),
          verbatimTextOutput("multiple_summary")
        )
      ),
      conditionalPanel(
        condition = 'input.corr==true',
        h4("Correlation Plot"),
        plotOutput("corr")
      )
    )
  )
))