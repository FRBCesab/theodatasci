#' @title theodatasci: A Research Compendium
#' 
#' @description 
#' A paragraph providing a full description of the project and describing each 
#' step of the workflow.
#' 
#' @author Nicolas Casajus \email{nicolas.casajus@fondationbiodiversite.fr}
#' 
#' @date 2021/07/02


## Install project manager package ----

if (!requireNamespace("rcompendium", quietly = TRUE)) {
  install.packages("rcompendium")
}


## Update required dependencies (listed in DESCRIPTION) ----

rcompendium::add_dependencies(compendium = ".")


## Install missing dependencies (listed in DESCRIPTION) ----

devtools::install_deps(upgrade = "never")


## Load project addins (R functions and packages) ----

devtools::load_all()


## Knit Rmd slides ----

knit_slides(name = "template")
