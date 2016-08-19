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
  hydrocortisone.sim.dose <-
    hydrocortisone.sim[hydrocortisone.sim$AMT > 0,
                       setdiff(names(hydrocortisone.sim), "DV")]
  # Unit conversion from ug to mg and standardize naming
  hydrocortisone.sim.dose$DOSE <- hydrocortisone.sim.dose$AMT/1000
  hydrocortisone.sim.dose$AMT <- NULL
  hydrocortisone.sim.dose$ROUTE <- "Oral"

  # Update the concentration data
  hydrocortisone.sim.conc <-
    hydrocortisone.sim[,setdiff(names(hydrocortisone.sim), "AMT")]
  # Standardize naming of the concentration variables
  names(hydrocortisone.sim.conc)[names(hydrocortisone.sim.conc) %in% "DV"] <- "CONC"
  
  # Save the data
  devtools::use_data(hydrocortisone.sim.conc,
                     hydrocortisone.sim.dose,
                     pkg=".",
                     overwrite=TRUE)
})
