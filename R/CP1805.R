#' Pharmacokinetics of CP1805
#' 
#' De-identified data set of concentration-time data for CP1805.
#' 
#' @format A data frame with five variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{DAY}}{Day of measurement}
#'   \item{\code{TIME.AFTER.DOSE}}{Time since the dose on the current \code{DAY} (in hours)}
#'   \item{\code{CONC}}{Plasma concentration of CP1805 (in ug/mL)}
#'   \item{\code{TIME}}{Time since first dose on \code{DAY} 1 (in hours)}
#' }
#' @seealso \code{\link{CP1805.dose}}, \code{\link{CP1805.demog}}
"CP1805.conc"

#' Dosing of CP1805
#' 
#' De-identified data set of dosing data for CP1805.
#' 
#' @format A data frame with five variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{ROUTE}}{Route of administration}
#'   \item{\code{DAY}}{Day of measurement}
#'   \item{\code{DOSE}}{Total dose of CP1805 (in mg)}
#'   \item{\code{DOSE.WEIGHT}}{Dose of CP1805 normalized by body weight (in mg/kg)}
#'   \item{\code{TIME.AFTER.DOSE}}{Time since the dose on the current \code{DAY} (in hours)}
#'   \item{\code{TIME}}{Time since first dose on \code{DAY} 1 (in hours)}
#' }
#' @seealso \code{\link{CP1805.conc}}, \code{\link{CP1805.demog}}
"CP1805.dose"

#' Demographics associated with the CP1805 datasets
#' 
#' De-identified data set of demographic data for CP1805 pharmacokinetics.
#' 
#' @format A data frame with three variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{SEX}}{Subject's sex (Male/Female)}
#'   \item{\code{WEIGHT}}{Subject's body weight (in kg)}
#' }
#' @seealso \code{\link{CP1805.conc}}, \code{\link{CP1805.dose}}
"CP1805.demog"
