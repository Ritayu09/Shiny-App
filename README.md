# Shiny-App

This shiny app provides a simple and fast way to run simple and multi-linear regression on Cars data available in R (table.b3 data in MPV library).

The app provides scatterplot for visualizing mileage of car with respect to selected variable. The app provides option to choose from type of regression analysis to be performed and then using mouse click to choose the variables, a summary of regression analysis with mileage as response variable will be printed on screen. 

Correlation plot can also be visualized to understand the underlying relationship between variables to help in variable selection. 

The app can also be used to perform forward, backward and stepwise regression by selecting and deselecting variables from selection window provided on the app.


This shiny app can be run by using the running the following code in R:

```
library(shiny)
runGitHub("Shiny-App-CarsData","Ritayu09")
```
