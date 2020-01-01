#' Pharmacokinetics of hydrocortisone
#' 
#' Simulated data set of concentration-time data for hydrocortisone.
#' 
#' @format \code{hydrocortisone_sim_conc} is a data frame descrbing
#'   concentration-time with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{CONC}}{Plasma concentration of hydrocortisone (in ng/mL)}
#'   \item{\code{CONCU}}{Units for plasma concentration of hydrocortisone, "ng/mL"}
#' }
#' 
#' @format \code{hydrocortisone_sim_dose} is a data frame describing dosing with
#'   the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{TIMEU}}{Units for time, "hours"}
#'   \item{\code{DOSE}}{Dose of hydrocortisone (in mg)}
#'   \item{\code{DOSEU}}{Units for dose of hydrocortisone, "mg"}
#'   \item{\code{ROUTE}}{Route of administration}
#' }
#' 
#' @name hydrocortisone
#' @references
#' Derendorf H, Mollmann H, Barth J, Mollmann C, Tunn S, Krieg M.
#' Pharmacokinetics and oral bioavailability of hydrocortisone. J Clin
#' Pharmacol. 1991;31(5):473-6.
NULL

#' @rdname hydrocortisone
"hydrocortisone_sim_dose"

#' @rdname hydrocortisone
"hydrocortisone_sim_conc"
