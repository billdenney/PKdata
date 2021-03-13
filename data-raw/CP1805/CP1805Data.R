## Dataset provided by Tim Cacek on May 3, 2016

## De-identified dataset for CP1805

## Time in hours, AMT in ug (in the input) and mg (in the output), DV in ng/mL
library(devtools)
library(dplyr)

local({
  ## Read the header
  headernames <-
    unlist(read.csv(
      "data-raw/CP1805Data.csv",
      header=FALSE,
      nrow=1,
      stringsAsFactors=FALSE
    ))
  ## Skip the second row of the file and read the rest of the file
  tmpdata <-
    read.csv(
      "data-raw/CP1805Data.csv",
      header=FALSE,
      skip=2,
      col.names=headernames,
      stringsAsFactors=FALSE
    )
  ## Standardize naming
  tmpdata$ID <- factor(tmpdata$Subject)
  tmpdata$SEX <- factor(tmpdata$Gender)
  tmpdata$DAY <- tmpdata$Day
  tmpdata$Day <- NULL

  ## Separate out the demographic data
  CP1805_demog <-
    tmpdata %>%
    select(ID, SEX, WEIGHT=WGTkg) %>%
    unique() %>%
    mutate(WEIGHTU="kg")
  
  ## Separate out the dosing data
  CP1805_dose <-
    tmpdata %>%
    select(ID, ROUTE="Route", "DAY", DOSE="Dose", NDOSE="Dosemgkg") %>%
    mutate(
      TIME_AFTER_DOSE=0,
      TIME=(DAY - 1)*24 + TIME_AFTER_DOSE,
      TIMEU="hours",
      DOSEU="mg",
      NDOSEU="mg/kg"
    ) %>%
    select(
      ID, ROUTE,
      DAY, TIME_AFTER_DOSE, TIME, TIMEU,
      DOSE, DOSEU,
      NDOSE, NDOSEU,
      everything()
    )

  CP1805_conc <-
    tmpdata %>%
    select(ID, DAY, TIME_AFTER_DOSE=Time, CONC=Conc) %>%
    mutate(
      TIME=(DAY - 1)*24 + TIME_AFTER_DOSE,
      TIMEU="hours",
      CONCU="ug/mL"
    )

  # Save the data
  usethis::use_data(
    CP1805_conc,
    CP1805_demog,
    CP1805_dose,
    overwrite=TRUE
  )
})
