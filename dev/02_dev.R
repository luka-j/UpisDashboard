# Building a Prod-Ready, Robust Shiny Application.
# 
# README: each step of the dev files is optional, and you don't have to 
# fill every dev scripts before getting started. 
# 01_start.R should be filled at start. 
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
# 
# 
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency
usethis::use_package( "RPostgreSQL")
usethis::use_package("DBI")
usethis::use_package("magrittr")
usethis::use_package("stringr")
usethis::use_package("redux")
usethis::use_package("future")
usethis::use_package("shinydashboard")
usethis::use_package("shinyjs")
usethis::use_package("r2d3")

## Add modules ----
## Create a module infrastructure in R/
golem::add_module( name = "attr_selector" ) # Name of the module
# golem::add_module( name = "name_of_module2" ) # Name of the module

## Add helper functions ----
## Creates fct_* and utils_*
golem::add_fct( "helpers")
golem::add_utils( "helpers")
golem::add_fct("db")
golem::add_utils("db")

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file( "script")
golem::add_js_handler( "handlers")
golem::add_css_file( "custom")

## Tests ----
## Add one line by test you want to create
usethis::use_test( "app")

# Documentation

## Vignette ----
# usethis::use_vignette("UpisDashboard")
# devtools::build_vignettes()

## CI ----
## Use this part of the script if you need to set up a CI
## service for your application
## 
## (You'll need GitHub there)
 # usethis::use_github(protocol = "ssh") # let IntelliJ handle VCS

# GitHub Actions
 # usethis::use_github_action()
# Chose one of the three
# See https://usethis.r-lib.org/reference/use_github_action.html
 # usethis::use_github_action_check_standard()

# You're now set! ----

