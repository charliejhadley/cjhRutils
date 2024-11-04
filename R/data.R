#' Bordering Countries Graph
#'
#' A TidyGraph object containing nodes and edges representing countries that
#' border one another. Note that only countries with at least one border as
#' defined within <https://www.geodatasource.com/addon/country-borders> are
#' included in the dataset. Supplementary country information was taken from
#' {rnaturalearthdata}.
#'
#' @format ## `ggraph_bordering_countries`
#' A tidy graph with 173 nodes rows and 608 edges:
#' \describe{
#'   \item{Node:}{Country name}
#'   \item{iso2, iso3}{2 & 3 letter ISO country codes}
#'   \item{year}{Year}
#'   ...
#' }
#' @source <https://www.geodatasource.com/addon/country-borders>
"ggraph_bordering_countries"
