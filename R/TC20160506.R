#' Pharmacokinetics of TC20160506 (Note that TC20160506 is a de-identified name for the drug.)
#' 
#' De-identified data set of concentration-time data for TC20160506. When
#' working with this dataset, be aware that the \code{ANALYTE} named "Parent"
#' can be converted into "Metabolite".
#' 
#' @format \code{TC20160506_conc} is concentration-time data.  The data.frame
#'   has the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{ANALYTE}}{Analyte being measured}
#'   \item{\code{TIME}}{Time since first dose on \code{DAY} 1 (in hours)}
#'   \item{\code{TIMEU}}{Units for time, "hours"}
#'   \item{\code{CONC}}{Plasma concentration of TC20160506 (in ug/L)}
#'   \item{\code{CONCU}}{Units for plasma concentration of TC20160506, "ug/L"}
#' }
#' 
#' @format \code{TC20160506_dose} is dosing data for TC20160506.  The data.frame
#'   has the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{ANALYTE}}{Analyte being dosed (the drug name)}
#'   \item{\code{TIME}}{Time since first dose on \code{DAY} 1 (in
#'     hours)}
#'   \item{\code{TIMEU}}{Units for time, "hours"}
#'   \item{\code{DOSE}}{Dose of TC20160506 (in ug).  Note that there
#'     may be more than one dose record per subject.}
#'   \item{\code{DOSEU}}{Units for dose, "ug"}
#'   \item{\code{ROUTE}}{Route of administration}
#' }
#' 
#' @format \code{TC20160506_demog} is demographic data for TC20160506
#'   pharmacokinetics.  The data.frame has the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{AGE}}{Subject's age (in years)}
#'   \item{\code{AGEU}}{Units for age, "years"}
#'   \item{\code{SEX}}{Subject's sex (Male/Female)}
#'   \item{\code{WEIGHT}}{Subject's body weight (in kg)}
#'   \item{\code{WEIGHTU}}{Units for body weight, "kg"}
#' }
#' @name TC20160506
NULL

#' @rdname TC20160506
"TC20160506_conc"

#' @rdname TC20160506
"TC20160506_dose"

#' @rdname TC20160506
"TC20160506_demog"
