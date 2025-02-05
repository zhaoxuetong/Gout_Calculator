library(shiny)
library(maps)
library(mapproj)
# counties <- readRDS("D:/work/gout/shiny/App-1/data/counties.rds")
# source("helpers.R")
library(shinythemes)
options(encoding = "UTF-8")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should
  #     re-execute automatically when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    # x    <- faithful[, 2]  # Old Faithful Geyser data
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'skyblue', border = 'white')
    
    })
  #选择框
  output$text1 <- renderText({ 
    paste("You have selected", input$var)
  })
  
  #范围框
  output$text2 <- renderText({ 
    paste("You have chosen a range that goes from",
          input$range[1], "to", input$range[2])
  })
  
  #输入框
  #age
  output$text3 <- renderText({ 
    paste("Age (years):", input$age)
  })
  #BMI
  output$text4 <- renderText({ 
    paste("Body mass index (kg/m2):", input$BMI)
  })
  #TG
  output$text5 <- renderText({ 
    paste("Higher triglyceride (mmol/L):", input$TG)
  })
  #sUA
  output$text6 <- renderText({ 
    paste("Serum urate (μmol/L):", input$sUA)
  })
  #CRP
  output$text7 <- renderText({ 
    paste("C-reactive protein (mg/L):", input$CRP)
  })
  #score
  output$text8 <- renderText({ 
    paste(GoutScore(input$age, input$BMI, input$TG, input$sUA, input$CRP))
  })
  
  # values <- reactiveValues(
  #   age=25,
  #   BMI=18,
  #   TG=55,
  #   sUA=66,
  #   CRP=77
  # )
  # observeEvent(input$example, {
  #   # 在按钮被点击后执行的代码
  #   values$age <- input$age
  #   values$BMI <- input$BMI
  #   values$TG <- input$TG
  #   values$sUA <- input$sUA
  #   values$CRP <- input$CRP
  #   
  #   # output$text8 <- renderText({
  #   #   paste(GoutScore(25, 18, 55, 66, 77))
  #   # })
  # })
  
  # output$text8 <- renderText({
  #   if(input$example>=1){
  #     text <- paste(GoutScore(25, 18, 55, 66, 77))
  #   }
  #   text
  # })
  
  # itx <- reactive({input$CRP})
  # output$text8 <- renderPrint({
  #   itx
  # })
  
  # output$text8 <- renderText({
  #   paste(GoutScore(25, 18, 55, 66, 77),input$example)
  # })
  
  # output$value2 <- renderPrint({ input$CRP })
  # output$map <- renderPlot({
  #   data <- switch(input$var, 
  #                  "Percent White" = counties$white,
  #                  "Percent Black" = counties$black,
  #                  "Percent Hispanic" = counties$hispanic,
  #                  "Percent Asian" = counties$asian)
  #   color <- switch(input$var, 
  #                   "Percent White" = "darkgreen",
  #                   "Percent Black" = "black",
  #                   "Percent Hispanic" = "darkorange",
  #                   "Percent Asian" = "darkviolet")
  #   
  #   legend <- switch(input$var, 
  #                    "Percent White" = "% White",
  #                    "Percent Black" = "% Black",
  #                    "Percent Hispanic" = "% Hispanic",
  #                    "Percent Asian" = "% Asian")
  #   
  #   percent_map(var = data, 
  #               color = color, 
  #               legend.title = legend, 
  #               max = input$range[2], 
  #               min = input$range[1])
  # })
})

GoutScore <- function(age, BMI, TG, sUA, CRP){
  if(is.na(age)|is.na(BMI)|is.na(TG)|is.na(sUA)|is.na(CRP)){
    return ("Wait for input......")
  }
  if(age>19&age<69){
    age=(age-19)/(69-19)
  }  else if(age<19){
    age=0
  }  else{
    age=1
  }
  
  if(BMI>16.27&BMI<43.94){
    BMI=(BMI-16.27)/(43.94-16.27)
  }  else if(BMI<16.27){
    BMI=0
  }  else{
    BMI=1
  }
  
  if(TG>0.56&TG<13.9){
    TG=(TG-0.56)/(13.9-0.56)
  }  else if(TG<0.56){
    TG=0
  }  else{
    TG=1
  }
  
  if(sUA>410&sUA<867){
    sUA=(sUA-410)/(867-410)
  }  else if(sUA<410){
    sUA=0
  }  else{
    sUA=1
  }
  
  if(CRP>0.21&CRP<64.29){
    CRP=(CRP-0.21)/(64.29-0.21)
  }  else if(CRP<0.21){
    CRP=0
  }  else{
    CRP=1
  }
  
  x1 = -1.7467375*age+1.62290781*BMI+9.56347212*TG+15.56462114*sUA+11.65564166*CRP+(-5.70168247)
  f1 = 1/(1+exp(-x1))
  x2 = -0.73642419*age+1.17176206*BMI+1.15584998*TG+2.74338075*sUA+0.81675379*CRP+(-1.0557074)
  f2 = 1/(1+exp(-x2))
  x3 = -1.0068815*age+0.5989963*BMI+0.78918341*TG+2.30950264*sUA+0.47843015*CRP+(-0.46435973)
  f3 = 1/(1+exp(-x3))
  x4 = -1.05892386*age+0.6509214*BMI+0.87478767*TG+2.35608863*sUA+0.45282918*CRP+(-0.51168285)
  f4 = 1/(1+exp(-x4))
  x5 = -113.32571885*age+218.21715239*BMI+190.57642178*TG+542.27280356*sUA+123.62704018*CRP+(-205.73024594)
  f5 = 1/(1+exp(-x5))
  x6 = -0.41529321*age+0.17639391*BMI+0.36976593*TG+0.95574269*sUA+0.13736662*CRP+(-0.16778615)
  f6 = 1/(1+exp(-x6))
  x7 = -37.78163358*age+23.06112893*BMI+75.45470619*TG+114.73138472*sUA+47.88128059*CRP+(-33.08730714)
  f7 = 1/(1+exp(-x7))
  x8 = -67.55691676*age+81.10419401*BMI+167.30243576*TG+241.40851324*sUA+97.14233354*CRP+(-88.29296071)
  f8 = 1/(1+exp(-x8))
  x9 = -1.07079469*age+0.60971954*BMI+0.79447418*TG+2.27731178*sUA+0.46146043*CRP+(-0.44909516)
  f9 = 1/(1+exp(-x9))
  x10 = -44.0781083*age+20.2441778*BMI+71.64039206*TG+110.99969358*sUA+53.98451106*CRP+(-27.41194434)
  f10 = 1/(1+exp(-x10))
  p=(f1+f2+f3+f4+f5+f6+f7+f8+f9+f10)/10
  if(p>0.776939412680588){
    output = "Non-response to 20mg febuxoxtat"
  }
  else{
    output = "Response to 20mg febuxoxtat"
  }
  return (output)
}

percent_map <- function(var, color, legend.title, min = 0, max = 100) {
  
  # generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(100)
  
  # constrain gradient to percents that occur between min and max
  var <- pmax(var, min)
  var <- pmin(var, max)
  percents <- as.integer(cut(var, 100, 
                             include.lowest = TRUE, ordered = TRUE))
  fills <- shades[percents]
  
  # plot choropleth map
  map("county", fill = TRUE, col = fills, 
      resolution = 0, lty = 0, projection = "polyconic", 
      myborder = 0, mar = c(0,0,0,0))
  
  # overlay state borders
  map("state", col = "white", fill = FALSE, add = TRUE,
      lty = 1, lwd = 1, projection = "polyconic", 
      myborder = 0, mar = c(0,0,0,0))
  
  # add a legend
  inc <- (max - min) / 4
  legend.text <- c(paste0(min, " % or less"),
                   paste0(min + inc, " %"),
                   paste0(min + 2 * inc, " %"),
                   paste0(min + 3 * inc, " %"),
                   paste0(max, " % or more"))
  
  legend("bottomleft", 
         legend = legend.text, 
         fill = shades[c(1, 25, 50, 75, 100)], 
         title = legend.title)
}