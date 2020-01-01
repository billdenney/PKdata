library(devtools)
library(tidyverse)

local({
  d_raw <-
    read.csv(
      "data-raw/KI20160914.csv",
      stringsAsFactors=FALSE,
      na.strings="."
    )
  d_cleaner <-
    d_raw %>%
    select(
      ID=SUBJID,
      PERIOD=VIST,
      DAY,
      TIME_FIRST_DOSE=TIME,
      TIME=NTPD,
      DOSE=AMT,
      CONC=DV,
      FORMULATION=FORM,
      TRTCD,
      SEX,
      AGE,
      WEIGHT=WT
    ) %>%
    mutate(
      SEX=factor(c("F", "M")[SEX + 1]),
      FORMULATION=factor(FORMULATION)
    )
  
  d_dose <-
    d_cleaner %>%
    filter(!is.na(d_cleaner$DOSE)) %>%
    select(
      "ID", "PERIOD", "DAY", "TIME_FIRST_DOSE", "TIME",
      "DOSE", "FORMULATION"
    ) %>%
    mutate(
      TIME_FIRST_DOSE=TIME_FIRST_DOSE - 0.001,
      TIME=TIME - 0.001,
      TIMEU="hours",
      ROUTE="oral"
    )

  d_demog <-
    d_cleaner %>%
    select("ID", "SEX", "AGE", "WEIGHT") %>%
    unique() %>%
    mutate(
      AGEU="years",
      WEIGHTU="kg"
    )
  
  d_conc <-
    d_cleaner %>%
    filter(!is.na(d_cleaner$CONC)) %>%
    select(
      "ID", "PERIOD", "DAY", "TIME_FIRST_DOSE", "TIME",
      "CONC", "FORMULATION"
    )
  
  KI20160914_conc <- d_conc
  KI20160914_dose <- d_dose
  KI20160914_demog <- d_demog

  usethis::use_data(
    KI20160914_conc,
    KI20160914_dose,
    KI20160914_demog,
    overwrite=TRUE
  )
})