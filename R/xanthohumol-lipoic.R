#' Pharmacokinetics of xanthohumol and isoxanthohumol
#' 
#' Data set of concentration-time data for xanthohumol and isoxanthohumol (a
#' metabolite of xanthohumol).
#' 
#' @format A data frame with four variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{CONC}}{Plasma concentration of the analyte (in ug/L)}
#'   \item{\code{ANALYTE}}{The name of the analyte measured in the concentration column}
#' }
#' @family xanthohumol and isoxanthohumol concentration and NCA data
#' @seealso \code{\link{xanthohumol.dose}}, \code{\link{xanthohumol.dose}},
#'   \code{\link{xanthohumol.nca}}
#' 
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"xanthohumol.conc"

#' Dosing of xanthohumol
#' 
#' @format A data frame with four variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{DOSE}}{Dose of xanthohumol (in mg)}
#'   \item{\code{ROUTE}}{Route of administration}
#' }
#'
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"xanthohumol.dose"

#' Noncompartmental analysis (NCA) parameters for xanthohumol and isoxanthohumol
#' as calculated by Kinetica and WinNonlin.
#' 
#' @format A data frame with five variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{ANALYTE}}{The name of the analyte measured in the \code{Value} column}
#'   \item{\code{Parameter}}{NCA parameter name}
#'   \item{\code{Software}}{Name and version of software used for NCA calculation}
#'   \item{\code{Value}}{Value of the NCA parameter}
#' }
#'
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"xanthohumol.nca"

#' Demographics for subjects dosed with xanthohumol
#' 
#' @format A data frame with two variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{Sex}}{The subject's sex (F=female, M=male)}
#' }
"xanthohumol.demog"

#' Pharmacokinetics of racemic and r-lipoic acid
#' 
#' Data set of concentration-time data for racemic and r-lipoic acid.
#' 
#' @format A data frame with four variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{TIME}}{Time (in minutes)}
#'   \item{\code{CONC}}{Plasma concentration of the analyte (in ng/mL)}
#'   \item{\code{ANALYTE}}{The name of the analyte measured in the concentration column}
#'   \item{\code{Period}}{The period number}
#' }
#' @seealso \code{\link{lipoic.acid.dose}}, \code{\link{lipoic.acid.nca}},
#'   \code{\link{lipoic.acid.demog}}
#' 
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"lipoic.acid.conc"

#' Dosing of racemic and r-lipoic acid
#' 
#' @format A data frame with six variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{Period}}{The period number}
#'   \item{\code{ANALYTE}}{The name of the analyte measured in the concentration column}
#'   \item{\code{TIME}}{Time (in hours)}
#'   \item{\code{DOSE}}{Dose of lipoic acid (in mg)}
#'   \item{\code{ROUTE}}{Route of administration}
#' }
#' @seealso \code{\link{lipoic.acid.conc}}, \code{\link{lipoic.acid.nca}},
#'   \code{\link{lipoic.acid.demog}}
#'
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"lipoic.acid.dose"

#' Noncompartmental analysis (NCA) parameters for racemic and r-lipoic acid as
#' calculated by Kinetica and WinNonlin.
#' 
#' @format A data frame with five variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{ANALYTE}}{The name of the analyte measured in the \code{Value} column}
#'   \item{\code{Parameter}}{NCA parameter name}
#'   \item{\code{Software}}{Name and version of software used for NCA calculation}
#'   \item{\code{Value}}{Value of the NCA parameter}
#' }
#'
#' @seealso  \code{\link{lipoic.acid.dose}}, \code{\link{lipoic.acid.conc}},
#'   \code{\link{lipoic.acid.demog}}
#'
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"lipoic.acid.nca"

#' Demographics for subjects dosed with xanthohumol
#' 
#' @format A data frame with two variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{Sex}}{The subject's sex (F=female, M=male)}
#'   \item{\code{Age}}{The subject's age category}
#' }
#' @seealso  \code{\link{lipoic.acid.dose}}, \code{\link{lipoic.acid.conc}},
#'   \code{\link{lipoic.acid.nca}}
#'
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"lipoic.acid.demog"
