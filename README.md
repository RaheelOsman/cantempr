
<!-- README.md is generated from README.Rmd. Please edit that file -->
cantempr
========

[![Travis build status](https://travis-ci.org/patrickbarks/cantempr.svg?branch=master)](https://travis-ci.org/patrickbarks/cantempr) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/patrickbarks/cantempr?branch=master&svg=true)](https://ci.appveyor.com/project/patrickbarks/cantempr) [![Coverage status](https://codecov.io/gh/patrickbarks/cantempr/branch/master/graph/badge.svg)](https://codecov.io/github/patrickbarks/cantempr?branch=master)

An R package to access long-term homogenized temperature data for 339 Canadian climate stations (for some stations data is available as far back as 1841). These data come from [Vincent et al. (2012)](https://doi.org/10.1029/2012JD017859), and are available in station-specific text files from [Environment and Climate Change Canada](https://www.canada.ca/en/environment-climate-change/services/climate-change/science-research-data/climate-trends-variability/adjusted-homogenized-canadian-data/surface-air-temperature-access.html) (see file 'Monthly mean of daily mean temperature').

**Data citation**: Vincent, L. A., X. L. Wang, E. J. Milewska, H. Wan, F. Yang, and V. Swail (2012) A second generation of homogenized Canadian monthly surface air temperature for climate trend analysis. Journal of Geophysical Research 117(D18110). <https://doi.org/10.1029/2012JD017859>

Installation
------------

Install from GitHub with:

``` r
# install package 'remotes' if necessary (a dependency of devtools)
# install.packages("remotes") 
remotes::install_github("patrickbarks/cantempr")
```

Usage
-----

``` r
library(cantempr)
```

##### Fetch data

Temperature data is available at monthly, seasonal, and annual intervals.

``` r
# get data for monthly intervals
temp_month <- cantemp_fetch(interval = "monthly")

# get data for seasonal intervals
temp_season <- cantemp_fetch(interval = "seasonal")

# get data for annual intervals
temp_annual <- cantemp_fetch(interval = "annual")

# get data for all intervals
temp_all <- cantemp_fetch(interval = "all")
```

Let's take a peek at the annual data.

``` r
head(temp_annual)
#>   prov        station   stnid year interval temp flag
#> 1   BC SHAWNIGAN LAKE 1017230 1914   Annual  9.7    a
#> 2   BC SHAWNIGAN LAKE 1017230 1915   Annual  9.9    a
#> 3   BC SHAWNIGAN LAKE 1017230 1916   Annual  7.8    a
#> 4   BC SHAWNIGAN LAKE 1017230 1917   Annual  8.6    a
#> 5   BC SHAWNIGAN LAKE 1017230 1918   Annual   NA    M
#> 6   BC SHAWNIGAN LAKE 1017230 1919   Annual  8.7    a
```

##### Example plot

Here's an example ['barcode plot'](https://www.cbc.ca/news/technology/charts-climate-change-bar-codes-1.4802293) using a time-series of mean annual temperatures in Toronto, Ontario.

``` r
library(ggplot2)

# subset annual temperature data to Toronto
to_annual <- subset(temp_annual, station == "TORONTO" & !is.na(temp))

# create 'barcode plot'
ggplot(to_annual, aes(year, 1, fill = temp)) +
  geom_tile() +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0.02, 0)) +
  scale_fill_gradient2(low = "blue", high = "darkred",
                       midpoint = mean(to_annual$temp),
                       breaks = function(x) seq(x[1], x[2], length.out = 5),
                       labels = function(x) paste(formatC(x, format = "f", digits = 1), "\u00B0C"),
                       name = NULL) +
  ggtitle(paste("Mean annual temperatures in Toronto since", min(to_annual$year))) +
  theme_void() +
  theme(axis.text.x = element_text(), legend.margin = margin(0, 0, 0, 5))
```

![](man/img/unnamed-chunk-6-1.png)

Contributions
-------------

All contributions are welcome. Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
