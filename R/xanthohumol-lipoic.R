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
#'
#' @family xanthohumol and isoxanthohumol concentration and NCA data
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"xanthohumol_conc"

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
#' @family xanthohumol and isoxanthohumol concentration and NCA data
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"xanthohumol_dose"

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
#' @family xanthohumol and isoxanthohumol concentration and NCA data
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"xanthohumol_nca"

#' Demographics for subjects dosed with xanthohumol
#'
#' @format A data frame with two variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{Sex}}{The subject's sex (F=female, M=male)}
#' }
"xanthohumol_demog"

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
#' @family lipoic acid concentration and NCA data
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"lipoic_acid_conc"

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
#'
#' @family lipoic acid concentration and NCA data
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"lipoic_acid_dose"

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
#' @family lipoic acid concentration and NCA data
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"lipoic_acid_nca"

#' Demographics for subjects dosed with r-lipoic acid
#'
#' @format A data frame with two variables:
#' \describe{
#'   \item{\code{ID}}{Subject identifier}
#'   \item{\code{Sex}}{The subject's sex (F=female, M=male)}
#'   \item{\code{Age}}{The subject's age category}
#' }
#'
#' @family lipoic acid concentration and NCA data
#' @references
#' Karnpracha, Chanida. (2013) Comparison of Pharmacokinetic Data Analysis with
#' Two Competing Pharmacokinetic Software Program. (Master's Thesis)
#' @source https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1
"lipoic_acid_demog"
