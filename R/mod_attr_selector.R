#' attr_selector UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_attr_selector_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' attr_selector Server Functions
#'
#' @noRd 
mod_attr_selector_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_attr_selector_ui("attr_selector_ui_1")
    
## To be copied in the server
# mod_attr_selector_server("attr_selector_ui_1")
