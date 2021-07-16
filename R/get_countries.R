#' Get countries
#'
#' @description Returns a list of countries that have at least one sample description
#' @param access token API key to authenticate to AviSample rest API
#' @param name Pattern to filter country names
#' @return tibble
#' @export
get_countries <- function(access_token, name = ""){
  url <- "https://avisample.net/api/country"
  url <- urltools::param_set(url, key = "filter[name][like]", value = urltools::url_encode(name))
  return(get_items(url, access_token))
}
