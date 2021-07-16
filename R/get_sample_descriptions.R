#' Get Sample descriptions
#'
#' @description Retrieves the list of sample descriptions. The function is intentionally slow to prevent server overload. By default it is limited to 1000 items but this parameter can be set.
#'
#' @param api_key API key to authenticate to AviSample rest API
#' @param taxon_common Pattern to filter sample descriptions by common names
#' @param taxon_scientific Pattern to filter sample descriptions by scientific names
#' @param country Pattern to filter sample descriptions by country
#' @param tissue Pattern to filter sample descriptions by tissue type
#' @importFrom urltools param_set
#' @importFrom utils URLencode
#' @return A tibble
#' @export

get_sample_descriptions <- function (taxon_common = "",taxon_scientific = "", country = "", tissue = "", perPage = 50, limit = 1000){
  url <- "https://avisample.net/api/simple"
  # TODO: add API key to URL
  url <- urltools::param_set(url, key = "filter[taxon_common][like]", value = utils::URLencode(taxon_common))
  url <- urltools::param_set(url, key = "filter[taxon_scientific][like]", value = utils::URLencode(taxon_scientific))
  url <- urltools::param_set(url, key = "filter[country][like]", value = utils::URLencode(country))
  url <- urltools::param_set(url, key = "per-page", value = perPage)
  url <- urltools::param_set(url, key = "limit", value = limit)
  return(get_items(url))
}
