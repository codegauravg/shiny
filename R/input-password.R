#' Create a password input control
#'
#' Create an password control for entry of passwords.
#'
#' @inheritParams textInput
#' @return A text input control that can be added to a UI definition.
#'
#' @family input elements
#' @seealso \code{\link{updateTextInput}}
#'
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'
#' ui <- fluidPage(
#'   passwordInput("password", "Password:"),
#'   actionButton("go", "Go"),
#'   verbatimTextOutput("value")
#' )
#' server <- function(input, output) {
#'   output$value <- renderText({
#'     req(input$go)
#'     isolate(input$password)
#'   })
#' }
#' shinyApp(ui, server)
#' }
#' @export
passwordInput <- function(inputId, label, value = "", width = NULL,
                          placeholder = NULL) {
  div(class = "form-group shiny-input-container",
    style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
    label %AND% tags$label(label, `for` = inputId),
    tags$input(id = inputId, type="password", class="form-control", value=value,
               placeholder = placeholder)
  )
}
