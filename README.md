
<!-- README.md is generated from README.Rmd. Please edit that file -->

# acaps

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The `acaps` package provides an R wrapper to the ACAPS API, allowing
users to easily access the different datasets provided by ACAPS. The
package automatically handles pagination and the resulting data is
provided as a native R dataframe.

You can install the development version of the package from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("RenRMT/acaps")
```

## Using the package

You need to have registered an account with ACAPS in order to use the
API. A username and password are required to generate an authorization
token. Once you’ve retrieved your authorization token you can store it
as an R environment variable. If you store the token as an environment
variable you will no longer need to manually provide the token with each
call to the API. More importantly, this will ensure that no secrets are
stored in your scripts.

``` r
library(acaps)

auth_token = get_token(username = "your-email@address.com", password = "your_password")

set_env_token(auth_token)
```

## Using the wrapper functions

The pacakge currently has easy wrapper functions for the following API
endpoint groups: crises, countries, humanitarian-access,
inform-severity-index. You can access any of the endpoints belonging to
each of the groups. Each function has the possibility to provide
additional parameters in order to filter the dataset, e.g. by country.

``` r
get_dataset_access("Jan2023", iso3 = "AFG")

get_dataset_severity("impact-of-crisis", "Jan2023", regions = "Asia")
```

A general function exists in the form of `get_dataset()`, which can be
used with any of the endpoints not covered by the above specialized
functions.

``` r
url <- "https://api.acaps.org/api/v1/risk-list/"

get_dataset(url)
```

Finally two lower level functions are available in case your workflow
contains additonal steps.

``` r
url <- "https://api.acaps.org/api/v1/countries/"
api_response <- access_endpoint(url)

result <- parse_response(api_response)
```

## Dependencies

This package relies on the `httr` and `jsonlite` packages as well as
their upstream dependencies.
