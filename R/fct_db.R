library(magrittr)

allColumnsByType <- function(tableName, types) {
  q <- DBI::dbSendQuery(dbConn, paste("SELECT * from ", tableName, " limit 1"))
  res <- DBI::dbColumnInfo(q) %>% dplyr::filter(Sclass %in% types) %>% dplyr::select(name)
  DBI::dbClearResult(q)
  res %>% lapply(function(x) paste(tableName, x, sep="."))
}

dbColumnValues <- function(colName) {
  spl <- stringr::str_split(colName, "\\.")[[1]]
  table <- spl[1]
  col <- spl[2]
  dbGetQuery(dbConn, paste("SELECT DISTINCT", col, "FROM", table))
}

dbGetColumn <- function(colName, filter) {
  if(grepl("(UPDATE)|(DELETE)|(DROP)|(CREATE)|(ALTER)|(RENAME)|(TRUNCATE)|(INSERT)|(MERGE)", filter, TRUE))
    return(NULL)
  table <- stringr::str_split(colName[1], "\\.")[[1]][1]
  query <- paste("SELECT", toString(colName), "FROM", table)
  year <- stringr::str_sub(table, start=-4)
  filter %<>% stringr::str_replace_all("os\\.", paste0("os", year, "."))
  filter %<>% stringr::str_replace_all("smerovi\\.", paste0("smerovi", year, "."))
  filter %<>% stringr::str_replace_all("ucenici\\.", paste0("ucenici", year, "."))

  if(stringr::str_starts(table, "ucenici")) {
    year <- stringr::str_sub(table, -4, -1)
    query <- paste0(query, " JOIN smerovi", year, " ON ", table, ".upisana_id=smerovi", year, ".id JOIN os", year, " ON ",
                    table, ".osnovna_id=os", year, ".id")
  }
  if(filter != "") {
    query <- paste(query, "WHERE", filter)
  }
  query %<>% tolower()
  stringr::dbGetQuery(dbConn, query)
}