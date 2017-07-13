[![Build Status](https://travis-ci.org/pedrocostaferreira/BETS.svg?branch=master)](https://travis-ci.org/pedrocostaferreira/BETS) [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/BETS)](https://CRAN.R-project.org/package=BETS) [![downloads](http://cranlogs.r-pkg.org/badges/BETS)](http://cran.rstudio.com/web/packages/BETS/index.html)

# BETS - Brazilian Economic Times Series

## Installation

```R
install.packages("BETS") 
```
## Usage

```R
library(BETS)
```
## Warning

The last version of RMySQL is not working properly, therefore, if you install it along with BETS, some functions won't work. To solve it, do the following:

```R
remove.packages(c("RMySQL","DBI"))
install.packages("devtools")
devtools::install_version("DBI", version = "0.5", repos = "http://cran.us.r-project.org")
devtools::install_version("RMySQL", version = "0.10.9", repos = "http://cran.us.r-project.org") 
```

