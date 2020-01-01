## Dataset provided by Tim Cacek on May 6, 2016

## Dataset is actual data from a study with compound names and subject
## identifiers blinded.

library(devtools)
library(tidyverse)
library(assertr)

local({
  d_raw <- read.csv("data-raw/TC20160506_ParentMetaboliteDataRich.csv", stringsAsFactors=FALSE)
  
  ## Standardize column names
  d_raw <-
    d_raw %>%
    rename(
      ANALYTE=Compound,
      ID=Subject,
      AGE=Age,
      WEIGHT=WGT,
      SEX=Gender,
      DOSE.LEVEL=DoseLevel,
      DOSE.TOTAL=TotalDose,
      DOSE=AMT,
      TIME=Time,
      CONC=Conc
    ) %>%
    mutate(
      ID=factor(ID)
    )

  ## Create the demographics  
  TC20160506_demog <-
    d_raw %>%
    select("ID", "AGE", "WEIGHT", "SEX") %>%
    unique() %>%
    mutate(
      AGEU="years",
      WEIGHTU="kg"
    ) %>%
    verify(!duplicated(ID))

  ## Create the dosing
  TC20160506_dose <-
    d_raw %>%
    filter(!(DOSE %in% 0)) %>%
    select("ID", "ANALYTE", "TIME", "DOSE") %>%
    mutate(
      DOSEU="ug",
      TIMEU="hours",
      ROUTE="Intranasal"
    )

  TC20160506_conc <-
    d_raw %>%
    select("ID", "ANALYTE", "TIME", "CONC") %>%
    mutate(
      CONC=
        case_when(
          is.na(CONC)~0,
          TRUE~CONC
        ),
      CONCU="ug/L",
      TIMEU="hours"
    ) %>%
    unique()

  # Save the data
  usethis::use_data(
    TC20160506_demog,
    TC20160506_dose,
    TC20160506_conc,
    overwrite=TRUE
  )
})
