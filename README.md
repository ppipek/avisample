
<!-- README.md is generated from README.Rmd. Please edit that file -->

# avisample

<!-- badges: start -->

<!-- badges: end -->

The goal of `avisample` package is to provide a simple bridge between
AviSample Network rest-api and R

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ppipek/avisample")
```

## Requirements

To use the API, you will need an account
(<https://avisample.net/user/register>) and an api\_key

## Examples

``` r
library(avisample)

## Show descriptions of redstart blood samples
redstart_blood <- gets_sample_descriptions(your_api_key, taxon_common = "redstart", tissue = "blood")

## Show descriptions of warbler samples from Czech Republic
czech_warblers <- gets_sample_descriptions(your_api_key, taxon_common = "warblers", country = "Czech Republic")
```

## Results

The package returns the results (`czech_warblers`, `redstart_blood`) in
a tibble format.

``` r
czech_warblers
#> # A tibble: 38 x 12
#>    asid   tissue  tissue_id taxon_common    taxon_scientific   taxon_id latitude
#>    <chr>  <chr>       <int> <chr>           <chr>                 <int>    <dbl>
#>  1 AS011~ feather         5 Marsh Warbler   Acrocephalus palu~    23941     49.9
#>  2 AS011~ feather         5 Marsh Warbler   Acrocephalus palu~    23941     48.9
#>  3 AS011~ feather         5 Marsh Warbler   Acrocephalus palu~    23941     48.9
#>  4 AS011~ feather         5 Marsh Warbler   Acrocephalus palu~    23941     48.9
#>  5 AS000~ feather         5 Eurasian Reed ~ Acrocephalus scir~    23942     49.9
#>  6 AS000~ feather         5 Eurasian Reed ~ Acrocephalus scir~    23942     49.9
#>  7 AS000~ feather         5 Eurasian Reed ~ Acrocephalus scir~    23942     48.9
#>  8 AS000~ feather         5 Eurasian Reed ~ Acrocephalus scir~    23942     48.9
#>  9 AS000~ feather         5 Eurasian Reed ~ Acrocephalus scir~    23942     50.5
#> 10 AS000~ feather         5 Eurasian Reed ~ Acrocephalus scir~    23942     50.5
#> # ... with 28 more rows, and 5 more variables: longitude <dbl>, country <chr>,
#> #   country_id <int>, date <chr>, end_date <chr>
redstart_blood
#> # A tibble: 10 x 12
#>    asid   tissue    tissue_id taxon_common  taxon_scientific   taxon_id latitude
#>    <chr>  <chr>         <int> <chr>         <chr>                 <int>    <dbl>
#>  1 AS011~ blood            63 American Red~ Setophaga ruticil~    31731     18.0
#>  2 AS011~ blood            63 American Red~ Setophaga ruticil~    31731     15.2
#>  3 AS011~ blood            63 American Red~ Setophaga ruticil~    31731     44.6
#>  4 AS011~ blood pl~         2 American Red~ Setophaga ruticil~    31731     44.6
#>  5 AS011~ blood            63 American Red~ Setophaga ruticil~    31731     18.0
#>  6 AS024~ blood pl~         2 Black Redsta~ Phoenicurus ochru~    27311     49.6
#>  7 AS024~ blood ce~         1 Black Redsta~ Phoenicurus ochru~    27311     49.6
#>  8 AS024~ blood pl~         2 Common Redst~ Phoenicurus phoen~    27303     50.2
#>  9 AS024~ blood ce~         1 Common Redst~ Phoenicurus phoen~    27303     50.2
#> 10 AS036~ blood ce~         1 Black Redsta~ Phoenicurus ochru~    27311     48.9
#> # ... with 5 more variables: longitude <dbl>, country <chr>, country_id <int>,
#> #   date <chr>, end_date <chr>
```
