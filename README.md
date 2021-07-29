
<!-- README.md is generated from README.Rmd. Please edit that file -->

# avisample

<!-- badges: start -->

<!-- badges: end -->

The goal of `avisample` package is to provide a simple bridge between
AviSample Network rest-api (<https://avisample.net/site/api>) and R

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
```

#### Redstart blood samples

``` r
## Show descriptions of redstart blood samples
redstart_blood <- gets_sample_descriptions(your_api_key, taxon_common = "redstart", tissue = "blood")
```

``` r
redstart_blood
#> # A tibble: 10 x 13
#>    asid  tissue tissue_id amount taxon_common taxon_scientific taxon_id
#>    <chr> <chr>      <int>  <int> <chr>        <chr>               <int>
#>  1 AS01~ blood         63     63 American Re~ Setophaga rutic~    31731
#>  2 AS01~ blood         63     18 American Re~ Setophaga rutic~    31731
#>  3 AS01~ blood         63    127 American Re~ Setophaga rutic~    31731
#>  4 AS01~ blood~         2     22 American Re~ Setophaga rutic~    31731
#>  5 AS01~ blood         63     25 American Re~ Setophaga rutic~    31731
#>  6 AS02~ blood~         2      2 Black Redst~ Phoenicurus och~    27311
#>  7 AS02~ blood~         1      2 Black Redst~ Phoenicurus och~    27311
#>  8 AS02~ blood~         2     34 Common Reds~ Phoenicurus pho~    27303
#>  9 AS02~ blood~         1     34 Common Reds~ Phoenicurus pho~    27303
#> 10 AS03~ blood~         1     32 Black Redst~ Phoenicurus och~    27311
#> # ... with 6 more variables: longitude <dbl>, latitude <dbl>, country <chr>,
#> #   country_id <int>, date <chr>, end_date <chr>
```

#### Czech warblers

``` r
## Show descriptions of warbler samples from Czech Republic
czech_warblers <- gets_sample_descriptions(your_api_key, taxon_common = "warbler", country = "Czech Republic")
```

``` r
czech_warblers
#> # A tibble: 38 x 13
#>    asid  tissue tissue_id amount taxon_common taxon_scientific taxon_id
#>    <chr> <chr>      <int>  <int> <chr>        <chr>               <int>
#>  1 AS01~ feath~         5     15 Marsh Warbl~ Acrocephalus pa~    23941
#>  2 AS01~ feath~         5      5 Marsh Warbl~ Acrocephalus pa~    23941
#>  3 AS01~ feath~         5      3 Marsh Warbl~ Acrocephalus pa~    23941
#>  4 AS01~ feath~         5      6 Marsh Warbl~ Acrocephalus pa~    23941
#>  5 AS00~ feath~         5      1 Eurasian Re~ Acrocephalus sc~    23942
#>  6 AS00~ feath~         5      3 Eurasian Re~ Acrocephalus sc~    23942
#>  7 AS00~ feath~         5      1 Eurasian Re~ Acrocephalus sc~    23942
#>  8 AS00~ feath~         5      9 Eurasian Re~ Acrocephalus sc~    23942
#>  9 AS00~ feath~         5      2 Eurasian Re~ Acrocephalus sc~    23942
#> 10 AS00~ feath~         5      4 Eurasian Re~ Acrocephalus sc~    23942
#> # ... with 28 more rows, and 6 more variables: longitude <dbl>, latitude <dbl>,
#> #   country <chr>, country_id <int>, date <chr>, end_date <chr>
```
