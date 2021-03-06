% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load.R
\name{combine_data}
\alias{combine_data}
\title{Combines density measurement from a dp object list into a single
data frame}
\usage{
combine_data(dp.list)
}
\arguments{
\item{dp.list}{A list of dp objects, either from loading several
files using dpload or combined manually. Note: the list should
include only dp objects!}
}
\value{
A data frame, combining all density data from dp.list
}
\description{
Given a dp object list, this function will extract all density
measurement data from all dp objects in a given list and combine
them in a single data frame.
}
\examples{
## load all files in directory
dp.list <- dpload(dp.directory = system.file("extdata", package = "densitr"))
combine_data(dp.list)
}
\seealso{
dpload, combine_footer.
}
