#' Pharmacokinetics of an experimental compound reported in Table 4 of Holder
#' 1999
#' 
#' Observed data set of concentration-time data for an experimental compound.
#' These data use sparse PK sampling with a "batch" design where each animal has
#' more than one sample but not the full profile.
#' 
#' @format \code{Holder_1999_conc} is a data frame describing concentration by time with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{TIMEU}}{Units for time, "hr"}
#'   \item{\code{CONC}}{Plasma concentration of the experimental compound (in ug/mL)}
#'   \item{\code{CONCU}}{Units for plasma concentration, "ug/mL"}
#' }
#' 
#' @format \code{Holder_1999_dose} is a data frame describing dosing with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{DOSE}}{Dose (in mg/kg)}
#'   \item{\code{DOSEU}}{Units for nominal dose, "mg/kg"}
#'   \item{\code{TIME}}{Time for start of dose (in minutes)}
#'   \item{\code{TIMEU}}{Units for time, "minutes"}
#'   \item{\code{ROUTE}}{Route of administration, "intravenous bolus"}
#' }
#' 
#' @format \code{Holder_1999_demog} is a data frame describing demographics with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{SEX}}{Animal sex (always "Female")}
#'   \item{\code{SPECIES}}{Species of the animal (always "rat")}
#'   \item{\code{GROUP}}{Arbitrary group number of the animal within the dose level}
#' }
#' 
#' @name Holder_1999
#' @references
#' Holder DJ, Hsuan F, Dixit R, Soper K. A method for estimating and testing
#' area under the curve in serial sacrifice, batch, and complete data designs. J
#' Biopharm Stat. 1999;9(3):451-464. doi:10.1081/BIP-100101187
NULL

#' @rdname Holder_1999
"Holder_1999_conc"

#' @rdname Holder_1999
"Holder_1999_dose"

#' @rdname Holder_1999
"Holder_1999_demog"
