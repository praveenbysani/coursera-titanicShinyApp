shinyUI(fluidPage(
  #create title panel
  titlePanel("Titanic Survivor Stats"),
  # populate side bar layout
  sidebarLayout(
    #two input widgets, for gender and age inputs
    
    sidebarPanel(
     
      #p(This webapp enables the user to explore the effects of factors like travel calss, gender and age group on the survival probability.),
      
      radioButtons("gender","Select the Gender class of the passenger",
                   c("Male"="Male","Female"="Female"),selected="Male"),
      selectInput("age","Select the age group of passengers",c("Child"="Child","Adult"="Adult"),
                  selected="Adult"),
      helpText("Note:: BY changing the gender and age group, one can observe the changes in survival probability plot")
    ),
    #main panel to plot the result
    mainPanel(
      plotOutput("plot1",height="500px")
    )
  )
  
)
)