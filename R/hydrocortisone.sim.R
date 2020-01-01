#' Pharmacokinetics of hydrocortisone
#' 
#' Simulated data set of concentration-time data for hydrocortisone.
#' 
#' @format \code{hydrocortisone.sim.conc} is a data frame with three variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{CONC}}{Plasma concentration of hydrocortisone (in ng/mL)}
#' }
#' 
#' @format \code{hydrocortisone.sim.dose} is a data frame describing dosing with three variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{DOSE}}{Dose of hydrocortisone (in mg)}
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
"hydrocortisone.sim.conc"

#' @rdname hydrocortisone
"hydrocortisone.sim.dose"
