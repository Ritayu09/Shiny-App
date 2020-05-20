
library(grid)
source("pictogram.R")
library(DAAG)

car <- function(color) {
  # car body
  grid.circle(x = 0.04, y = 0.56, r = 0.04, gp=gpar(fill = color, col = "black"))
  grid.circle(x = 0.91, y = 0.56, r = 0.04, gp=gpar(fill = color, col = "black"))
  
  grid.polygon(x = c(0.0,0.0,0.04,0.04), y = c(0.2,0.56, 0.56, 0.2), gp=gpar(fill = color, col = NA))
  grid.polygon(x = c(0.91,0.91,0.95,0.95), y = c(0.2,0.56, 0.56, 0.2), gp=gpar(fill = color, col = NA))
  
  grid.polygon(x = c(0.04,0.04,0.91,0.91), y = c(0.2,0.6, 0.6, 0.2), gp=gpar(fill = color, col = NA))
  grid.polygon(x = c(0.2,0.35,0.65,0.8), y = c(0.6,0.9, 0.9, 0.6), gp=gpar(fill = color, col = "black"))
  grid.polygon(x = c(0.25, 0.35, 0.4, 0.4), y = c(0.6,0.8,0.8,0.6), gp=gpar(fill = "white", col = "black"))
  grid.polygon(x = c(0.45,0.45,0.64,0.74), y = c(0.6, 0.8, 0.8, 0.6), gp=gpar(fill = "white", col = "black"))
  
  # car door handle
  grid.polygon(x = c(0.47,0.47,0.51,0.51), y = c(0.54, 0.56, 0.56, 0.54), gp=gpar(fill = "black", col = "black"))
  
  # car outline
  grid.lines(x = c(0.04, 0.91), y = c(0.6,0.6), gp=gpar(fill = NA, col = "black"))
  grid.lines(x = c(0.0, 0.95), y = c(0.2,0.2), gp=gpar(fill = NA, col = "black"))
  grid.lines(x = c(0.0, 0.0), y = c(0.2,0.56), gp=gpar(fill = NA, col = "black"))
  grid.lines(x = c(0.95, 0.95), y = c(0.2,0.56), gp=gpar(fill = NA, col = "black"))
  
  # tyres
  grid.circle(x = 0.3, y = 0.2, r = 0.1, gp=gpar(fill = "black", col = NA))
  grid.circle(x = 0.3, y = 0.2, r = 0.07, gp=gpar(fill = "white", col = NA))
  grid.circle(x = 0.7, y = 0.2, r = 0.1, gp=gpar(fill = "black", col = NA))
  grid.circle(x = 0.7, y = 0.2, r = 0.07, gp=gpar(fill = "white", col = NA))
}

