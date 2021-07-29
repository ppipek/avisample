#' Get Sample descriptions
#'
#' @description Retrieves the list of sample descriptions. The function is intentionally slow to prevent server overload.
#'
#' @param access_token API key to authenticate to AviSample rest API
#' @param taxon_common Pattern to filter sample descriptions by common names
#' @param taxon_scientific Pattern to filter sample descriptions by scientific names
#' @param country Pattern to filter sample descriptions by country
#' @param tissue Pattern to filter sample descriptions by tissue type
#' @param perPage Number of items on one page, maximum is 50 (and is set as default)
#' @param strict If set to true, filter will not look for substrings but only for exact matches
#' @importFrom urltools param_set url_encode
#' @importFrom lubridate ymd
#' @return A tibble
#' @export

get_sample_descriptions <- function (access_token, taxon_common = NULL,taxon_scientific = NULL, country = NULL, tissue = NULL, perPage = 50, strict = F){
  url <- "https://avisample.net/api/sample"
  if(strict == F){
    if(!is.null(taxon_common)) url <- urltools::param_set(url, key = "filter[taxon_common][like]", value = urltools::url_encode(taxon_common))
    if(!is.null(taxon_scientific)) url <- urltools::param_set(url, key = "filter[taxon_scientific][like]", value = urltools::url_encode(taxon_scientific))
    if(!is.null(country)) url <- urltools::param_set(url, key = "filter[country][like]", value = urltools::url_encode(country))
    if(!is.null(tissue)) url <- urltools::param_set(url, key = "filter[tissue][like]", value = urltools::url_encode(tissue))
  }
  else{
    if(!is.null(taxon_common)) url <- urltools::param_set(url, key = "filter[taxon_common][eq]", value = urltools::url_encode(taxon_common))
    if(!is.null(taxon_scientific)) url <- urltools::param_set(url, key = "filter[taxon_scientific][eq]", value = urltools::url_encode(taxon_scientific))
    if(!is.null(country)) url <- urltools::param_set(url, key = "filter[country][eq]", value = urltools::url_encode(country))
    if(!is.null(tissue)) url <- urltools::param_set(url, key = "filter[tissue][eq]", value = urltools::url_encode(tissue))
  }
  url <- urltools::param_set(url, key = "per-page", value = perPage)
  get_items(url, access_token) %>%
    mutate(date = lubridate::ymd(date), end_date = lubridate::ymd(end_date))
}
