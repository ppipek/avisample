#' Get Tissue Types
#'
#' @description Internal function that retrieves list of all taxa matching a filter string
#'
#' @param name A string pattern to filter tissue type names
#' @importFrom urltools param_set
#' @importFrom utils URLencode
#' @export
get_tissue_types <- function (name = NULL){
  url <- "https://avisample.net/api/tissue"
  url <- urltools::param_set(url, key = "filter[name][like]", value = utils::URLencode(name))

  return(get_items(url))
}
