## Dataset provided by Tim Cacek on May 6, 2016

## Dataset is actual data from a study with compound names and subject
## identifiers blinded.

library(devtools)
library(dplyr)

local({
  tmpdata <- read.csv("data-raw/TC20160506_ParentMetaboliteDataRich.csv", stringsAsFactors=FALSE)
  
  ## Standardize column names
  tmpdata <- rename(tmpdata,
                    ANALYTE=Compound,
                    ID=Subject,
                    AGE=Age,
                    WEIGHT=WGT,
                    SEX=Gender,
                    DOSE.LEVEL=DoseLevel,
                    DOSE.TOTAL=TotalDose,
                    DOSE=AMT,
                    TIME=Time,
                    CONC=Conc)
  tmpdata$ID <- factor(tmpdata$ID)

  ## Create the demographics  
  TC20160506.demog <- unique(tmpdata[,c("ID", "AGE", "WEIGHT", "SEX")])
  if (length(unique(TC20160506.demog$ID)) != nrow(TC20160506.demog))
    stop("Error generating TC20160506 demographics")
  
  ## Create the dosing
  TC20160506.dose <-
    unique(tmpdata[!(tmpdata$DOSE %in% 0),
                   c("ID", "ANALYTE", "TIME", "DOSE")])
  TC20160506.dose$ROUTE <- "Intranasal"

  TC20160506.conc <- tmpdata[,c("ID", "ANALYTE", "TIME", "CONC")]
  ## Set BLQ data to 0
  TC20160506.conc$CONC[is.na(TC20160506.conc$CONC)] <- 0
  TC20160506.conc <- unique(TC20160506.conc)

  # Save the data
  devtools::use_data(TC20160506.demog,
                     TC20160506.dose,
                     TC20160506.conc,
                     pkg=".",
                     overwrite=TRUE)
})
