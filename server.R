shinyServer(function(input,output){
  #convert table to frame object
  TitanicData <- as.data.frame(Titanic)
  output$plot1 <- renderPlot({
    #apply the input filters on data frame
    RefinedData <- TitanicData[TitanicData$Age==input$age & TitanicData$Sex==input$gender,]
    # initialize numeric vectors for probability of each class
    pvector = numeric()
    for(travel_class in levels(RefinedData$Class)){
      # count the number of survivors in this travel class
      survivors <- sum(RefinedData[RefinedData$Class==travel_class & 
                                     RefinedData$Survived=="Yes","Freq"])
      # count the total number of passengers in this class
      passengers <- sum(RefinedData[RefinedData$Class==travel_class,"Freq"])
      # calculate probability
      prob <- survivors/passengers
      # insert into vector
      pvector <- c(pvector,prob)
    }
    # customized plotting
    #plot without x axes labels
    plot(c("1","2","3","4"),pvector,type="b",col="green",axes=FALSE,ann=FALSE)
    # label with custom class names
    axis(1,at=1:4,lab=c("1st","2nd","3rd","Crew"))
    axis(2)
    # title for graph
    title(main="Travel Class Vs. Probability",
          xlab="Class of Travel",ylab="Prob of Survival")
  })
}
  )