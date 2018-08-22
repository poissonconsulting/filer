
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/poissonconsulting/filer.svg?branch=master)](https://travis-ci.org/poissonconsulting/filer)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/filer/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/filer?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

## Introduction

`filer` is an R package to read and write multiple files.

The user can supply a custom read function and the files are input and
output as a list of named objects.

## Utilisation

``` r
library(filer)

dir <- system.file("extdata", package = "filer")
objects <- read_files(dir, .recursive = TRUE)
lapply(objects, head)
#> $chickwts.rds
#>   weight      feed
#> 1    179 horsebean
#> 2    160 horsebean
#> 3    136 horsebean
#> 4    227 horsebean
#> 5    217 horsebean
#> 6    168 horsebean
#> 
#> $mtcars.rds
#>                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
#> 
#> $`sub/chickwts.rds`
#>   weight      feed
#> 1    179 horsebean
#> 2    160 horsebean
#> 3    136 horsebean
#> 4    227 horsebean
#> 5    217 horsebean
#> 6    168 horsebean
#> 
#> $trees.rds
#>   Girth Height Volume
#> 1   8.3     70   10.3
#> 2   8.6     65   10.3
#> 3   8.8     63   10.2
#> 4  10.5     72   16.4
#> 5  10.7     81   18.8
#> 6  10.8     83   19.7
names(objects) <- file_names(n = length(objects))

dir <- tempdir()
```

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/filer)

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/filer")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    # install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("filer")

## Citation

``` 

To cite package 'filer' in publications use:

  Joe Thorley (2018). filer: Read and Write Multiple Files. R
  package version 0.0.0.9001.
  https://github.com/poissonconsulting/filer

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {filer: Read and Write Multiple Files},
    author = {Joe Thorley},
    year = {2018},
    note = {R package version 0.0.0.9001},
    url = {https://github.com/poissonconsulting/filer},
  }
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/filer/issues).

[Pull requests](https://github.com/poissonconsulting/filer/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
