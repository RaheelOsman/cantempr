#' Fetch metadata for 338 Canadian climate stations
#'
#' Fetch a tidy \code{data.frame} with metadata for 338 Canadian climate
#' stations, including latitude, longitude, elevation, information on the
#' temporal extent of the temperature data, and whether the temperature data was
#' derived from multiple joined weather stations.
#'
#' @return A \code{data.frame} with metadata for 338 Canadian climate stations.
#'
#' \describe{
#' \item{prov}{Two-letter abbreviation for province}
#' \item{station}{Name of climate station}
#' \item{stnid}{Climate station identifier}
#' \item{beg_yr}{Year of first temperature observation}
#' \item{beg_mon}{Integer month of first temperature observation}
#' \item{end_yr}{Year of final temperature observation}
#' \item{end_mon}{Integer month of final temperature observation}
#' \item{lat}{Station latitude in decimal degrees}
#' \item{lon}{Station longitude in decimal degrees}
#' \item{elev}{Station elevation in meters}
#' \item{stn_joined}{Logical value indicating whether or not the given 'station'
#' is based on multiple joined weather stations}
#' }
#'
#' @author Patrick M. Barks <patrick.barks@@gmail.com>
#'
#' @references
#' Vincent, L. A., X. L. Wang, E. J. Milewska, H. Wan, F. Yang, and V. Swail
#' (2012). A second generation of homogenized Canadian monthly surface air
#' temperature for climate trend analysis. Journal of Geophysical Research
#' 117(D18110). \url{https://doi.org/10.1029/2012JD017859}
#'
#' @examples
#' stn_metadata <- cantemp_meta()
#'
#' @export
cantemp_meta <- function() {
  return(cantemp_metadata)
}
