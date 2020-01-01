#' Pharmacokinetics of fluorouracil
#' 
#' Observed data set of concentration-time data for fluorouracil.
#' 
#' @format \code{fluorouracil_conc} is a data frame describing concentration by time with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in minutes)}
#'   \item{\code{TIMEU}}{Units for time, "minutes"}
#'   \item{\code{NDOSE}}{Nominal dose (in mg/kg)}
#'   \item{\code{NDOSEU}}{Units for nominal dose, "mg/kg"}
#'   \item{\code{CONC}}{Plasma concentration of fluorouracil (in ug/mL)}
#'   \item{\code{CONCU}}{Units for plasma concentration of fluorouracil, "ug/mL"}
#' }
#' 
#' @format \code{fluorouracil_dose} is a data frame describing dosing with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{NDOSE}}{Nominal dose (in mg/kg)}
#'   \item{\code{NDOSEU}}{Units for nominal dose, "mg/kg"}
#'   \item{\code{TIME}}{Time for start of dose (in minutes)}
#'   \item{\code{TIME_END}}{Time for end of dose (in minutes)}
#'   \item{\code{TIMEU}}{Units for time, "minutes"}
#'   \item{\code{ROUTE}}{Route of administration, "intravenous bolus"}
#' }
#' 
#' @name fluorouracil
#' @references
#' MacMillan, William E., William H. Wolberg, and Peter G. Welling. 1978.
#' "Pharmacokinetics of Fluorouracil in Humans." Cancer Research 38 (10):
#' 3479-82.
NULL

#' @rdname fluorouracil
"fluorouracil_conc"

#' @rdname fluorouracil
"fluorouracil_dose"

#' @rdname fluorouracil
"fluorouracil_demog"
