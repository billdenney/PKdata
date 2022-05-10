#' Pharmacokinetics of an CPI 975 (an experimental drug) reported in Table II of
#' Nedelman 1995
#' 
#' Observed data set of concentration-time data for an experimental compound.
#' These data use sparse PK sampling with a "batch" design where each animal has
#' more than one sample but not the full profile.
#' 
#' @format \code{Nedelman_1995_conc} is a data frame describing concentration by time with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{TIMEU}}{Units for time, "hr"}
#'   \item{\code{CONC}}{Plasma concentration of the experimental compound (in ug/mL)}
#'   \item{\code{CONCU}}{Units for plasma concentration, "ug/mL"}
#' }
#' 
#' @format \code{Nedelman_1995_dose} is a data frame describing dosing with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{DOSE}}{Dose (in mg/kg)}
#'   \item{\code{DOSEU}}{Units for nominal dose, "mg/kg"}
#'   \item{\code{TIME}}{Time for the dose (in hours, always 0)}
#'   \item{\code{TIMEU}}{Units for time, "hr"}
#'   \item{\code{ROUTE}}{Route of administration, "oral"}
#' }
#' 
#' @format \code{Nedelman_1995_demog} is a data frame describing demographics with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{SEX}}{Animal sex}
#'   \item{\code{SPECIES}}{Species of the animal (always "rat")}
#' }
#' 
#' @name Nedelman_1995
#' @references
#' Nedelman JR, Gibiansky E, Lau DT. Applying Bailer’s method for AUC confidence
#' intervals to sparse sampling. Pharm Res. 1995;12(1):124-128.
#' doi:10.1023/a:1016255124336
NULL

#' @rdname Nedelman_1995
"Nedelman_1995_conc"

#' @rdname Nedelman_1995
"Nedelman_1995_dose"

#' @rdname Nedelman_1995
"Nedelman_1995_demog"
