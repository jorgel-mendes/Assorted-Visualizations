library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "ISLR plots"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("About", tabName = "about", icon = icon("dashboard")),
            menuItem("Chapters", icon = icon("bar-chart-o"), startExpanded = TRUE,
                     menuSubItem("Sub-item 1", tabName = "subitem1"),
                     menuSubItem("Sub-item 2", tabName = "subitem2")
            )
        ),
        textOutput("res")
    ),
    dashboardBody(
        tabItems(
            tabItem("about", 
                    fluidRow(
                        box(plotOutput("plot1")),
                        
                        box(
                            "Box content here", br(), "More box content",
                            selectInput('xcol', 'X Variable', names(iris)),
                            selectInput('ycol', 'Y Variable', names(iris),
                                        selected=names(iris)[[2]]),
                            numericInput('clusters', 'Cluster count', 3,
                                         min = 1, max = 9)
                        )
                    )
                    ),
            tabItem("subitem1", "Sub-item 1 tab content"),
            tabItem("subitem2", "Sub-item 2 tab content")
        )
    )
)


server <- function(input, output, session) {
    # Combine the selected variables into a new data frame
    selectedData <- reactive({
        iris[, c(input$xcol, input$ycol)]
    })
    
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    output$plot1 <- renderPlot({
        palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
        
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })
}

shinyApp(ui, server)

