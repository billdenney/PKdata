# From 
# Nedelman JR, Gibiansky E, Lau DT. Applying Bailer’s method for AUC confidence
# intervals to sparse sampling. Pharm Res. 1995;12(1):124-128.
# doi:10.1023/a:1016255124336

library(assertr)
library(devtools)
library(rio)
library(tidyverse)
requireNamespace("zoo")

local({
  d_raw <-
    import("data-raw/Nedelman_1995/Nedelman_1995.csv") %>%
    mutate(
      ID=row_number(),
      CONCU="ng/mL",
      DOSEU="mg/kg",
      TIMEU="hr",
      PARAM="CPI 975"
    )
  
  # QC the data entry
  load(system.file("data", "CPI975.RData", package="PK"))
  CPI975_alt <-
    CPI975 %>%
    mutate(
      sex=as.character(sex)
    ) %>%
    arrange(dose, desc(sex), time)
  
  d_raw2 <-
    d_raw %>%
    arrange(DOSE, desc(SEX), TIME) %>%
    mutate(
      diff=
        case_when(
          is.na(CONC)~as.numeric(is.na(CONC) != is.na(CPI975_alt$conc)),
          TRUE~CONC - CPI975_alt$conc
        )
    )
  
  wrong <- d_raw2 %>% filter(!(diff %in% 0))
  if (nrow(wrong) > 0) {
    stop("Data QC did not pass")
  }

  Nedelman_1995_conc <-
    d_raw %>%
    select(
      ID, TIME, TIMEU, CONC, CONCU
    )
  
  Nedelman_1995_dose <-
    d_raw %>%
    mutate(
      TIME=0,
      ROUTE="oral"
    ) %>%
    select(ID, TIME, TIMEU, DOSE, DOSEU, ROUTE) %>%
    unique()
  
  Nedelman_1995_demog <-
    d_raw %>%
    mutate(
      SPECIES="rat"
    ) %>%
    select(ID, SPECIES, SEX) %>%
    unique()
  
  usethis::use_data(
    Nedelman_1995_conc,
    Nedelman_1995_dose,
    Nedelman_1995_demog,

    overwrite=TRUE
  )
})