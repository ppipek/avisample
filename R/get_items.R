#' Get Items
#'
#' @description Internal function that retrieves all items in chunks
#'
#' @importFrom jsonlite fromJSON
#' @importFrom urltools param_set url_encode
#' @importFrom tibble tibble
#' @return tibble
get_items <- function(url, access_token){
  url <- urltools::param_set(url, key = "access-token", value = url_encode(access_token))
  first_result <- jsonlite::fromJSON(url)
  total_count <- first_result$`_meta`$totalCount
  page_count <- first_result$`_meta`$pageCount

  if(page_count > 1){
    results = list()
    results[[1]] <- first_result$items
    message(paste(total_count, "items in total, on", page_count, "pages"))
    message("Processing page 1")

    # for the remaining pages
    for(i in 2:page_count){
      message(paste("Processing page",i))
      Sys.sleep(2) # wait not to overload the server
      url_new <- urltools::param_set(url, key = "page", value = i)
      result_new <- jsonlite::fromJSON(url_new)
      results[[i]] <- result_new$items
    }

    message("Done.")

    results %>% bind_rows() %>% tibble()
  }

  else{
    message(paste(total_count, "items in total"))
    first_result$items %>% tibble()
  }
}



