## Dataset provided by Tim Cacek on May 3, 2016

## De-identified dataset for CP1805

## Time in hours, AMT in ug (in the input) and mg (in the output), DV in ng/mL
library(devtools)
library(dplyr)

local({
  ## Read the header
  headernames <- unlist(read.csv("data-raw/CP1805Data.csv",
                                 header=FALSE,
                                 nrow=1,
                                 stringsAsFactors=FALSE))
  ## Skip the second row of the file and read the rest of the file
  tmpdata <- read.csv("data-raw/CP1805Data.csv",
                      header=FALSE,
                      skip=2,
                      col.names=headernames,
                      stringsAsFactors=FALSE)
  ## Standardize naming
  tmpdata$ID <- factor(tmpdata$Subject)
  tmpdata$SEX <- factor(tmpdata$Gender)
  tmpdata$DAY <- tmpdata$Day
  tmpdata$Day <- NULL

  ## Separate out the demographic data
  CP1805.demog <- rename(unique(tmpdata[,c("ID", "SEX", "WGTkg")]),
                         WEIGHT=WGTkg)
  
  ## Separate out the dosing data
  CP1805.dose <- rename(unique(tmpdata[,c("ID", "Route", "DAY", "Dose", "Dosemgkg")]),
                        ROUTE=Route,
                        DOSE=Dose,
                        DOSE.WEIGHT=Dosemgkg)
  CP1805.dose$TIME.AFTER.DOSE <- 0
  CP1805.dose$TIME <- (CP1805.dose$DAY - 1)*24 + CP1805.dose$TIME.AFTER.DOSE

  CP1805.conc <- rename(tmpdata[,c("ID", "DAY", "Time", "Conc")],
                        CONC=Conc,
                        TIME.AFTER.DOSE=Time)
  CP1805.conc$TIME <- (CP1805.conc$DAY - 1)*24 + CP1805.conc$TIME.AFTER.DOSE

  # Save the data
  devtools::use_data(CP1805.demog,
                     CP1805.dose,
                     CP1805.conc,
                     pkg=".",
                     overwrite=TRUE)
})
