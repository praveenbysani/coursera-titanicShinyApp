shinyUI(fluidPage(
  #create title panel
  titlePanel("Titanic Survivor Stats"),
  # populate side bar layout
  sidebarLayout(
    #two input widgets, for gender and age inputs
    sidebarPanel(
      radioButtons("gender","Select whether survived or deceased",
                   c("Male"="Male","Female"="Female"),selected="Male"),
      selectInput("age","Select the age group of passengers",c("Child"="Child","Adult"="Adult"),
                  selected="Adult")
      ),
    #main panel to plot the result
    mainPanel(
      plotOutput("plot1",height="500px")
      )
    )
  
  )
      )