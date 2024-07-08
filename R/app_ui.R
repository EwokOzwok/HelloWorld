#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shinyMobile::f7Page(
      title = "Hello World",
      options = list(theme=c("auto"), dark=TRUE, preloader = F,  pullToRefresh=F),
      allowPWA=TRUE,


      f7TabLayout(
        # panels are not mandatory. These are similar to sidebars
        navbar = f7Navbar(
          title= "Hello World App"),
        # f7Tabs is a special toolbar with included navigation
        f7Tabs(
          animated = TRUE,
          id = "tabs",
          f7Tab(
            tabName = "Tab1",
            icon = f7Icon("house_fill"),
            active = TRUE,
            hidden= F,
            f7Block(
              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(
                  f7Align(h2("Welcome to the Hello World App"),side=c("center")),
                  footer = NULL,
                  hairlines = F, strong = T, inset = F, tablet = FALSE)
              )
            )
          ),


          f7Tab(
            tabName = "tab2",
            icon = f7Icon("airplane"),
            active = F,
            hidden=F,
            f7Block(
              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(
                  f7Align(h2("This is my second tab"),side=c("center")),
                  br(),
                  hr(),
                  br(),
                  f7Button("mybutton", "Click me", shadow = T, rounded = T),
                  br(),
                  uiOutput("text"),
                  br(),
                  uiOutput("clearbutton"),
                  footer = NULL,
                  hairlines = F, strong = T, inset = F, tablet = FALSE)
              )
            )
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "HelloWorld"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
