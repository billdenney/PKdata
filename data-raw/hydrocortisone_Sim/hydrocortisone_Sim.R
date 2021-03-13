## Dataset provided by Sibo Jiang on August 19, 2016

## Simulated data using model parameters published in
## doi:10.1002/j.1552-4604.1991.tb01906.x

## Time in hours, AMT in ug (in the input) and mg (in the output), DV in ng/mL
library(devtools)

local({
  hydrocortisone.sim <- read.csv("data-raw/hydrocortisone_Sim.csv")
  ## Subject numbers are discrete not continuous
  hydrocortisone.sim$ID <- factor(hydrocortisone.sim$ID)

  # Update the concentration data
  hydrocortisone_sim_dose <-
    hydrocortisone.sim[hydrocortisone.sim$AMT > 0,
                       setdiff(names(hydrocortisone.sim), "DV")]
  # Unit conversion from ug to mg and standardize naming
  hydrocortisone_sim_dose$DOSE <- hydrocortisone_sim_dose$AMT/1000
  hydrocortisone_sim_dose$DOSEU <- "mg"
  hydrocortisone_sim_dose$TIMEU <- "hours"
  hydrocortisone_sim_dose$AMT <- NULL
  hydrocortisone_sim_dose$ROUTE <- "Oral"

  # Update the concentration data
  hydrocortisone_sim_conc <-
    hydrocortisone.sim[,setdiff(names(hydrocortisone.sim), "AMT")]
  # Standardize naming of the concentration variables
  names(hydrocortisone_sim_conc)[names(hydrocortisone_sim_conc) %in% "DV"] <- "CONC"
  hydrocortisone_sim_conc$TIMEU <- "hours"
  hydrocortisone_sim_conc$CONCU <- "ng/mL"

  # Save the data
  usethis::use_data(
    hydrocortisone_sim_conc,
    hydrocortisone_sim_dose,
    overwrite=TRUE
  )
})
