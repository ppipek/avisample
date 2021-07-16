#' Get Taxa
#'
#' Internal function that retrieves list of all taxa matching a filter string
#'
#' @param scientific A string pattern to filter scientific names
#' @param common A string pattern to filter common names
#' @importFrom jsonlite fromJSON
#' @export
get_taxa <- function(scientific = "", common = ""){
  url <- "https://avisample.net/api/taxon"
  url <- urltools::param_set(url, key = "filter[name][like]", value = urltools::URLencode(common))
  url <- urltools::param_set(url, key = "filter[latin][like]", value = urltools::URLencode(scientific))
  # url <- param_set(url, key = "filter[family][like]", value = URLencode(country))
  # url <- param_set(url, key = "per-page", value = perPage)
  # url <- param_set(url, key = "limit", value = limit)

  return(get_items(url))
}
