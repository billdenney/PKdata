#' Pharmacokinetics of hydrocortisone
#' 
#' Simulated data set of concentration-time data for hydrocortisone.
#' 
#' @format A data frame with three variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{CONC}}{Plasma concentration of hydrocortisone (in ng/mL)}
#' }
#' @seealso \code{\link{hydrocortisone.sim.dose}}
#' 
#' @references
#' Derendorf H, Möllmann H, Barth J, Möllmann C, Tunn S, Krieg M.
#' Pharmacokinetics and oral bioavailability of hydrocortisone. J Clin
#' Pharmacol. 1991;31(5):473-6.
"hydrocortisone.sim.conc"

#' Dosing of hydrocortisone
#' 
#' Simulated data set of dosing data for hydrocortisone.
#' 
#' @format A data frame with three variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{DOSE}}{Dose of hydrocortisone (in mg)}
#'   \item{\code{ROUTE}}{Route of administration}
#' }
#' @seealso \code{\link{hydrocortisone.sim.conc}}
"hydrocortisone.sim.dose"
