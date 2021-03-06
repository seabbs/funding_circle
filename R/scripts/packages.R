# packages used in this module --------------------------------------------
package_names <- c('tidyverse', 'lubridate')

dev_tools <- rep(NA, length(package_names))
names(dev_tools) <- package_names

## change dev_tools to url for github package
  
##Load a single package
pkgLoad_single <- function(x, y)
{
  if (!require(x,character.only = TRUE))
  {
    if (is.na(y))
    {
      install.packages(x,dep=TRUE, repos='http://www.stats.bris.ac.uk/R/')
    }else{
      install_github(y)
      }
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
  return(paste0('Loaded ', x, ' successfully'))
}

## Append devtools and load all packages
pkgLoad <- function(pck_names, pck_dev)
{
  pck_names <- c('devtools', pck_names)
  pck_dev <- c(NA, pck_dev)
  pck <- mapply(pkgLoad_single, pck_names, pck_dev)
  return(pck)
}

## Execute and load all packages
pck <- pkgLoad(package_names, dev_tools)
print(pck)


