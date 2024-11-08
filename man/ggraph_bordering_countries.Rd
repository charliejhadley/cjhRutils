% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{ggraph_bordering_countries}
\alias{ggraph_bordering_countries}
\title{Bordering Countries Graph}
\format{
\subsection{\code{ggraph_bordering_countries}}{

A tidy graph with 173 nodes rows and 608 edges:
\describe{
\item{Node:}{Country name}
\item{iso2, iso3}{2 & 3 letter ISO country codes}
\item{year}{Year}
...
}
}
}
\source{
\url{https://www.geodatasource.com/addon/country-borders}
}
\usage{
ggraph_bordering_countries
}
\description{
A TidyGraph object containing nodes and edges representing countries that
border one another. Note that only countries with at least one border as
defined within \url{https://www.geodatasource.com/addon/country-borders} are
included in the dataset. Supplementary country information was taken from
{rnaturalearthdata}.
}
\keyword{datasets}
