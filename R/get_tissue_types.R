#' Get Tissue Types
#'
#' @description Internal function that retrieves list of all Tissues types matching a filter string that are already in the dataset
#'
#' @param name A string pattern to filter tissue type names
#' @importFrom urltools param_set url_encode
#' @export

get_tissue_types <- function(access_token, name = NULL){
  url <- "https://avisample.net/api/tissue"
  url <- urltools::param_set(url, key = "filter[name][like]", value = utils::URLencode(name))
  items <- get_items(url, access_token)
  items
}
