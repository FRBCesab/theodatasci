#' Knit RMarkdown Slides
#'
#' @description
#' This function knits Rmd slides to HTML output (stored in the same folder).
#' All Rmd files need to be named **index.Rmd**.
#'
#' @param name a character of length 1. The course sub-folder name 
#'   (e.g. `"template"`).
#' 
#' @param homepage a boolean. If `TRUE`, only the Home page will be knit.
#'
#' @export
#' 
#' @return NULL
#'
#' @examples
#' \dontrun{
#' ## Knit course ----
#' knit_slides(name = "template")
#' }


knit_slides <- function(name, homepage = FALSE) {
  
  if (!is.logical(homepage) || length(homepage) != 1) {
    stop("Argument 'homepage' must be a logical.")
  }
  
  if (missing(name) && !homepage) {
    stop("Argument 'name' is required (unless homepage is TRUE).")
  }
  
  if (homepage) {
    
    if (!file.exists(here::here("index.Rmd"))) {
      stop("The file '", here::here("index.Rmd"), "' does not exist.")
    }
    
    usethis::ui_todo("Knitting homepage slides...")
    
    rmarkdown::render(input         = here::here("index.Rmd"),
                      output_format = "xaringan::moon_reader",
                      output_file   = "index.html",
                      output_dir    = here::here(),
                      clean         = TRUE,
                      quiet         = TRUE)
    
  } else {
    
    if (!dir.exists(here::here("slides", name))) {
      stop("The folder '", here::here("slides", name), "' does not exist.")
    }
    
    if (!file.exists(here::here("slides", name, "index.Rmd"))) {
      stop("The file '", here::here("slides", name, "index.Rmd"), 
           "' does not exist.")
    }
    
    usethis::ui_todo(paste("Knitting", name, "slides..."))
    
    rmarkdown::render(input         = here::here("slides", name, "index.Rmd"),
                      output_format = "xaringan::moon_reader",
                      output_file   = "index.html",
                      output_dir    = here::here("slides", name),
                      clean         = TRUE,
                      quiet         = TRUE)
  }
  
  usethis::ui_done("Done!")
  usethis::ui_line()
  
  invisible(NULL)
}
