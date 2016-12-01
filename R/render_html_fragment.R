#' Renders and returns an HTML fragment
#'
#' This is a wrapper around the \code{rmarkdown::\link[rmarkdown]{render}}
#' function. The principal difference is that the function is designed to
#' return an HTML fragment (rather than writing to a file). This function is
#' useful to populate the content of a modal window.
#'
#' @param input          character, path to input file
#' @param output_format  rmarkdown output format, provided so you can specify arguments
#' @param ...            other arguments passed to
#'   \code{rmarkdown::\link[rmarkdown]{render}}
#'
#' @return \code{htmltools::\link[htmltools]{tag}}
#' @examples
#' my_file <- system.file("markdown", "modal.md", package = "bsplus")
#' render_html_fragment(my_file)
#' @export
#'
render_html_fragment <- function(input,
                                 output_format = rmarkdown::html_fragment(),
                                 ...){

  tempfile_html <- tempfile()

  rmarkdown::render(input, output_format, output_file = tempfile_html, ...)

  tempfile_html %>%
    readLines() %>%
    htmltools::HTML()

}