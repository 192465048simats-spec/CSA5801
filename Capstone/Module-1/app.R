library(shiny)

ui <- fluidPage(
  
  titlePanel("ShiftLeftX: Secure Software Delivery Pipeline"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      textInput("developer","Developer Name","Archana"),
      
      selectInput("project",
                  "Select Project",
                  choices=c("Banking System",
                            "Hospital Management",
                            "College Management",
                            "E-Commerce Website")),
      
      actionButton("start","Start Pipeline")
      
    ),
    
    mainPanel(
      
      h3("Pipeline Progress"),
      
      tableOutput("pipeline"),
      
      br(),
      
      h3("Total Execution Time"),
      
      textOutput("time"),
      
      h3("Security Score"),
      
      textOutput("score"),
      
      br(),
      
      plotOutput("graph",height="300")
      
    )
    
  )
  
)

server <- function(input, output){
  
  observeEvent(input$start,{
    
    pipeline <- data.frame(
      
      Stage=c("Code Commit",
              "Static Code Analysis",
              "Dependency Scan",
              "Unit Testing",
              "Build",
              "Security Testing",
              "Deployment"),
      
      Status=c("Completed",
               "Completed",
               "Completed",
               "Completed",
               "Completed",
               "Completed",
               "Completed")
      
    )
    
    output$pipeline <- renderTable({
      pipeline
    })
    
    output$time <- renderText({
      "21 Minutes"
    })
    
    output$score <- renderText({
      "98% Secure"
    })
    
    output$graph <- renderPlot({
      
      stages <- c(2,3,2,4,3,5,2)
      
      names(stages) <- c("Commit",
                         "Static",
                         "Dependency",
                         "Testing",
                         "Build",
                         "Security",
                         "Deploy")
      
      barplot(stages,
              col="steelblue",
              main="Execution Time of Each Stage",
              ylab="Minutes")
      
    })
    
  })
  
}

shinyApp(ui,server)