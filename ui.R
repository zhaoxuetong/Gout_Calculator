library(shiny)
options(encoding = "UTF-8")
# Define UI for application that draws a histogram
# shinyUI(fluidPage(
#   
#   # Application title
#   titlePanel("Hello World!"),
#   
#   # Sidebar with a slider input for the number of bins
#   sidebarLayout(
#     sidebarPanel(
#       sliderInput("bins",
#                   "Number of bins:",
#                   min = 5,
#                   max = 50,
#                   value = 30)
#     ),
#     
#     # Show a plot of the generated distribution
#     mainPanel(
#       plotOutput("distPlot")
#     )
#   )
# ))
shinyUI(fluidPage(
  # theme = shinytheme("journal"),#网站报错
  # theme = shinytheme("readable"),
  titlePanel("Gout calculator"),
  sidebarLayout(
    sidebarPanel(
      h2("Introduction"),
      p("Febuxostat is a commonly employed urate lowering drug in gout. To better understand and predict an inadequate response to low-dose febuxostat, we developed and validated a machine learning model based on baseline clinical variables."),
      # code('install.packages("shiny")'),
      # br(),
      # br(),
      # br(),
      # br(),
      # img(src = "p1.png", height = 72, width = 192),
      # "The author is from ", 
      # span("NGDC", style = "color:blue"),
      
      #选择框
      # selectInput("var", 
      #             label = "Choose a variable to display",
      #             choices = c("Percent White", "Percent Black",
      #                         "Percent Hispanic", "Percent Asian"),
      #             selected = "Percent White"),
      # #范围框
      # sliderInput("range", 
      #             label = "Range of interest:",
      #             min = 0, max = 100, value = c(0, 100)),
      h3("Input"),
      #输入框
      #age
      numericInput("age", label = h6("Age (years):"), value = NULL),
      #BMI
      numericInput("BMI", label = h6("Body mass index (kg/m2):"), value = NULL),
      #TG
      numericInput("TG", label = h6("Higher triglyceride (mmol/L):"), value = NULL),
      #sUA
      numericInput("sUA", label = h6("Serum urate (μmol/L):"), value = NULL),
      #CRP
      numericInput("CRP", label = h6("C-reactive protein (mg/L):"), value = NULL),
      # hr(),
      fluidRow(column(6, verbatimTextOutput("value"))),
      # actionButton("example", "Example", icon = icon("edit"),class = "btn-success"),
      # hr(),
      submitButton("Calculate"),#,Submit,, icon("refresh")
      helpText("Click the button above, update the data")
      
      # verbatimTextOutput("value2")
    ),
    
    mainPanel(
      h2("CalGout: an serum uric acid response prediction Calculator"),
      p("This is a machine learning model for ",strong("early prediction of inadequate serum uric acid response (serum urate >360 μmol/L)")," to those who receiving 20mg febuxoat for three months."),
      # br(),
      p("Web site deployed in NGDC, visit the ",
        a("NGDC homepage.", 
          href = "https://ngdc.cncb.ac.cn/")),
      br(),
      # p("* Enter the data in the left column and the score will be calculated below."),
      p(span("Enter the data in the left column and the score will be calculated below.")),
      # br(),
      # h3("Input Value"),
      # sliderInput("bins",
      #             "Number of bins:",
      #             min = 5,
      #             max = 50,
      #             value = 30),
      # plotOutput("distPlot"),
      # selectInput("var", 
      #             label = "Choose a variable to display",
      #             choices = list("Percent White", "Percent Black",
      #                            "Percent Hispanic", "Percent Asian"),
      #             selected = "Percent White"),
      # 
      # sliderInput("range", 
      #             label = "Range of interest:",
      #             min = 0, max = 100, value = c(0, 100)),
      
      
      # selectInput("select", label = h3("Select type"), 
      #             choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
      #             selected = 1),
      # hr(),
      # fluidRow(column(3, verbatimTextOutput("value"))),
      
      #选择框
      # textOutput("text1"),
      #范围框
      # textOutput("text2"),
      #输入框
      # textOutput("text3"),
      # textOutput("text4"),
      # textOutput("text5"),
      # textOutput("text6"),
      # textOutput("text7"),
      br(),
      h3("The prediction result is:"),
      h4(textOutput("text8"), style = "color:red"),
      
      # textOutput(span("text8", style = "color:blue"))
      br(),
      br(),
      p("* The result of ",span("Response to 20mg febuxoxtat ", style = "color:blue"),"or",span(" Non-response to 20mg febuxoxtat.", style = "color:blue")),
      p(span("* The response is serum urate less than 360(μmol/L) after receiving 20mg febuxostat for three months.", style = "color:blue")),
      p(span("* Non-response  is serum urate always above 360(μmol/L) after receiving 20mg febuxostat for three months.", style = "color:blue"))
      
    )
  )
))

# shinyUI(fluidPage(
#   titlePanel("censusVis"),
#   
#   sidebarLayout(
#     sidebarPanel(
#       helpText("Create demographic maps with 
#         information from the 2010 US Census."),
#       
#       selectInput("var", 
#                   label = "Choose a variable to display",
#                   choices = list("Percent White", "Percent Black",
#                                  "Percent Hispanic", "Percent Asian"),
#                   selected = "Percent White"),
#       
#       sliderInput("range", 
#                   label = "Range of interest:",
#                   min = 0, max = 100, value = c(0, 100))
#     ),
#     
#     mainPanel()
#   )
# ))