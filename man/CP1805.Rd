% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CP1805.R
\docType{data}
\name{CP1805}
\alias{CP1805}
\alias{CP1805_conc}
\alias{CP1805_dose}
\alias{CP1805_demog}
\title{Pharmacokinetics of CP1805}
\format{
\code{CP1805_conc} is a de-identified data set of concentration-time
  data for CP1805 as a data frame with the following variables:
\describe{
  \item{\code{ID}}{Subject identifier}
  \item{\code{DAY}}{Day of measurement}
  \item{\code{TIME_AFTER_DOSE}}{Time since the dose on the current \code{DAY} (in hours)}
  \item{\code{TIME}}{Time since first dose on \code{DAY} 1 (in hours)}
  \item{\code{TIMEU}}{Units for time, "hours"}
  \item{\code{CONC}}{Plasma concentration of CP1805 (in ug/mL)}
  \item{\code{CONCU}}{Units for plasma concentration of CP1805, "ug/mL"}
}

\code{CP1805_dose} is a de-identified data set of dosing data for
  CP1805 as a data frame with the following variables:
\describe{
  \item{\code{ID}}{Subject identifier}
  \item{\code{ROUTE}}{Route of administration}
  \item{\code{DAY}}{Day of measurement}
  \item{\code{TIME_AFTER_DOSE}}{Time since the dose on the current \code{DAY} (in hours)}
  \item{\code{TIME}}{Time since first dose on \code{DAY} 1 (in hours)}
  \item{\code{TIMEU}}{Units for time, "hours"}
  \item{\code{DOSE}}{Total dose of CP1805 (in mg)}
  \item{\code{DOSEU}}{Total dose of CP1805, "mg"}
  \item{\code{NDOSE}}{Dose of CP1805 normalized by body weight (in mg/kg)}
  \item{\code{NDOSEU}}{Units for dose of CP1805 normalized by body weight, "mg/kg"}
}

\code{CP1805_demog} is a de-identified data set of demographic data
  for CP1805 pharmacokinetics as a data frame with the following variables:
\describe{
  \item{\code{ID}}{Subject identifier}
  \item{\code{SEX}}{Subject's sex (Male/Female)}
  \item{\code{WEIGHT}}{Subject's body weight (kg)}
  \item{\code{WEIGHTU}}{Units for subject's body weight, "kg"}
}

An object of class \code{data.frame} with 320 rows and 7 columns.

An object of class \code{data.frame} with 320 rows and 10 columns.

An object of class \code{data.frame} with 20 rows and 4 columns.
}
\usage{
CP1805_conc

CP1805_dose

CP1805_demog
}
\description{
Pharmacokinetics of CP1805
}
\keyword{datasets}
