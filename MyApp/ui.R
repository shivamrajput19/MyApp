library(shiny)

shinyUI(
    navbarPage("My Shiny Application",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("The relationship between different variables in a flower"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("xaxis", "X Axis :-",
                                                c("Length of the Sepal" = "Sepal.Length", 
                                                  "Width of the Sepal" = "Sepal.Width",
                                                  "Length of the Petal" = "Petal.Length",
                                                  "Width of the Petal" = "Petal.Width",
                                                  "Species of the flower" = "Species"
                                                )),
                                    selectInput("yaxis", "Y Axis :-",
                                                c("Length of the Sepal" = "Sepal.Length", 
                                                  "Width of the Sepal" = "Sepal.Width",
                                                  "Length of the Petal" = "Petal.Length",
                                                  "Width of the Petal" = "Petal.Width",
                                                  "Species of the flower" = "Species"
                                                )), 
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("Plot", h3("Here is a line Plot for the selected variables"),
                                                         plotOutput("lPlot")),
                                                tabPanel("Regression model", 
                                                         h3("This is a Regression model fit in the scatter plot of the selected variables"),
                                                         plotOutput("fitPlot"),
                                                         verbatimTextOutput("fit")
                                                ),
                                                tabPanel("Box Plot",
                                                         p("Do not select the same variables in both axis for the boxplot to work "),
                                                         plotOutput("bplot"))
                                    )
                                )
                            )
                        )
               ),
               tabPanel("Some information about the data set",
                        
                        h3("Iris Data Set"),
                        h3("Description"),
                        p("This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables
                          sepal length and width and petal length and width, respectively, for 50 flowers
                          from each of 3 species of iris. The species are Iris setosa, versicolor, and 
                          virginica."),
                        h3("The Columns in the data set"),
                        p("Sepal.Length"),
                        p("Petal.Length"),
                        p("Sepal.Width"),
                        p("Petal.Width"),
                        p("Species")
               )
    )
)