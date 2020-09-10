library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste(input$yaxis, "~", input$xaxis)
    })
    
    formulaTextPoint <- reactive({
        paste( "as.integer(", input$yaxis, ")", "~", "as.integer(", input$xaxis, ")")
    })
    
    fit <- reactive({
        lm(as.formula(formulaTextPoint()), data=iris)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$lPlot <- renderPlot({
        plot(as.formula(formulaText()), 
             data = iris, type = "o")
    })
    
    output$bplot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = iris)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$fitPlot <- renderPlot({
        with(iris, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        })
    
    })
})