#' Get Items
#'
#' Internal function that retrieves all items of in chunks
#'
#' @importFrom jsonlite fromJSON
get_items <- function(url){
  result <- jsonlite::fromJSON(url)
  items <- result$items
  meta <- result$`_meta`
  links <- result$`_links`
  page_count <- meta$pageCount

  # for the remaining pages
  for(i in 2:page_count){
    Sys.sleep(2) # wait not to overload the server
    url <- urltools::param_set(url, key = "page", value = i)
    result_new <- jsonlite::fromJSON(url)
    items_new <- result_new$items
    items <- rbind(items, items_new)
  }
  return(items)
}
