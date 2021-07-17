#' Get Items
#'
#' @description Internal function that retrieves all items of in chunks
#'
#' @importFrom jsonlite fromJSON
#' @importFrom urltools param_set url_encode
#' @importFrom tibble tibble
#' @return tibble
get_items <- function(url, access_token){
  url <- urltools::param_set(url, key = "access-token", value = url_encode(access_token))
  result <- jsonlite::fromJSON(url)
  items <- result$items
  total_count <- result$`_meta`$totalCount
  page_count <- result$`_meta`$pageCount
  message(paste(total_count, "items in total, on", page_count, "pages"))
  message("page 1")
  # links <- result$`_links`
  # page_count <- meta$pageCount

  if(page_count > 1){
    message(paste("page",i))
    # for the remaining pages
    for(i in 2:page_count){
      Sys.sleep(2) # wait not to overload the server
      url_new <- urltools::param_set(url, key = "page", value = i)
      result_new <- jsonlite::fromJSON(url_new)
      items_new <- result_new$items
      items <- rbind(items, items_new)
    }
  }

  items %>% tibble()
}



