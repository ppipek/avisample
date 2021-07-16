#' Get Tissue Types
#'
#' Internal function that retrieves list of all taxa matching a filter string
#'
#' @param name A string pattern to filter tissue type names
#' @importFrom jsonlite fromJSON
#' @export
get_tissue_types <- function (name = NULL){
  url <- "https://avisample.net/api/tissue"
  url <- urltools::param_set(url, key = "filter[name][like]", value = urltools::URLencode(name))

  return(get_items(url))
}
