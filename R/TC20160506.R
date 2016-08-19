#' Pharmacokinetics of TC20160506
#' 
#' De-identified data set of concentration-time data for TC20160506.  (Note that
#' TC20160506 is a de-identified name for the drug.)
#' 
#' @format A data frame with four variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{ANALYTE}}{Analyte being measured}
#'   \item{\code{TIME}}{Time since first dose on \code{DAY} 1 (in hours)}
#'   \item{\code{CONC}}{Plasma concentration of TC20160506 (in ug/L)}
#' }
#' @seealso \code{\link{TC20160506.dose}}, \code{\link{TC20160506.demog}}
"TC20160506.conc"

#' Dosing of TC20160506
#' 
#' De-identified data set of dosing data for TC20160506.  (Note that TC20160506
#' is a de-identified name for the drug.)
#' 
#' @format A data frame with five variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{ANALYTE}}{Analyte being dosed (the drug name)}
#'   \item{\code{TIME}}{Time since first dose on \code{DAY} 1 (in hours)}
#'   \item{\code{DOSE}}{Dose of TC20160506 (in ug).  Note that there may be more
#'     than one dose record per subject.}
#'   \item{\code{ROUTE}}{Route of administration}
#' }
#' @seealso \code{\link{TC20160506.conc}}, \code{\link{TC20160506.demog}}
"TC20160506.dose"

#' Demographics associated with the TC20160506 datasets
#' 
#' De-identified data set of demographic data for TC20160506 pharmacokinetics. 
#' (Note that TC20160506 is a de-identified name for the drug.)
#' 
#' @format A data frame with three variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{AGE}}{Subject's age (in years)}
#'   \item{\code{SEX}}{Subject's sex (Male/Female)}
#'   \item{\code{WEIGHT}}{Subject's body weight (in kg)}
#' }
#' @seealso \code{\link{TC20160506.conc}}, \code{\link{TC20160506.dose}}
"TC20160506.demog"
