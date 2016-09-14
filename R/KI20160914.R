#' Pharmacokinetics of KI20160914
#' 
#' De-identified data set of concentration-time data for KI20160914.
#' (Note that KI20160914 is a de-identified name for the drug.)
#' 
#' @format A data frame with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{PERIOD}}{Period number for different visits in the study}
#'   \item{\code{TIME}}{Nominal time since first dose on \code{DAY} 1 in the current \code{PERIOD} (in hours)}
#'   \item{\code{TIME.FIRST.DOSE}}{Nominal time since first dose in \code{PERIOD} 1 (in hours)}
#'   \item{\code{DAY}}{Study day (since the beginning of \code{PERIOD} 1}
#'   \item{\code{CONC}}{Plasma concentration of KI20160914}
#'   \item{\code{FORMULATION}}{Formulation number}
#' }
#' @seealso \code{\link{KI20160914.dose}}, \code{\link{KI20160914.demog}}
"KI20160914.conc"

#' Dosing of KI20160914
#' 
#' De-identified data set of dosing data for KI20160914.  (Note that
#' KI20160914 is a de-identified name for the drug.)
#' 
#' @format A data frame with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{PERIOD}}{Period number for different visits in the study}
#'   \item{\code{TIME}}{Nominal time since first dose on \code{DAY} 1 in the current \code{PERIOD} (in hours)}
#'   \item{\code{TIME.FIRST.DOSE}}{Nominal time since first dose in \code{PERIOD} 1 (in hours)}
#'   \item{\code{DAY}}{Study day (since the beginning of \code{PERIOD} 1}
#'   \item{\code{DOSE}}{Dose of KI20160914 (in mg).}
#'   \item{\code{FORMULATION}}{Formulation number}
#'   \item{\code{ROUTE}}{Route of administration}
#' }
#' @seealso \code{\link{KI20160914.conc}},
#'   \code{\link{KI20160914.demog}}
"KI20160914.dose"

#' Demographics associated with the KI20160914 datasets
#' 
#' De-identified data set of demographic data for KI20160914 pharmacokinetics. 
#' (Note that KI20160914 is a de-identified name for the drug.)
#' 
#' @format A data frame with the following variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{AGE}}{Subject's age (in years)}
#'   \item{\code{SEX}}{Subject's sex (Male/Female)}
#'   \item{\code{WEIGHT}}{Subject's body weight (in kg)}
#' }
#' @seealso \code{\link{KI20160914.conc}}, \code{\link{KI20160914.dose}}
"KI20160914.demog"
