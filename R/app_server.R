#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic


  observeEvent(input$mybutton,{
    text = "This text will be displayed"

    output$text<-renderUI({
      tagList(
        renderText(text)
      )
    })

    output$clearbutton<-renderUI({
      tagList(
        f7Button("clear", "Delete Text")
      )
    })


  })



  observeEvent(input$clear,{
    output$clearbutton<-renderUI({})
    output$text<-renderUI({})

  })


}
