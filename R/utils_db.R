library(magrittr)

allColumns <- function() {
  DBI::dbListTables(dbConn) %>% lapply(function(x) paste(x, DBI::dbListFields(dbConn, x), sep=".")) %>% unlist()
}
numericColumns <- function(tableName) allColumnsByType(tableName, c("double", "integer"))
characterColumns <- function(tableName) allColumnsByType(tableName, "character")
logicalColumns <- function(tableName) allColumnsByType(tableName, "logical")

allNumericColumns <- function() lapply(dbListTables(dbConn), numericColumns) %>% unlist(use.names = FALSE)
allCharacterColumns <- function() lapply(dbListTables(dbConn), characterColumns) %>% unlist(use.names = FALSE)