# From 
# Holder DJ, Hsuan F, Dixit R, Soper K. A method for estimating and testing area
# under the curve in serial sacrifice, batch, and complete data designs. J
# Biopharm Stat. 1999;9(3):451-464. doi:10.1081/BIP-100101187

library(assertr)
library(devtools)
library(rio)
library(tidyverse)
requireNamespace("zoo")

local({
  d_raw <-
    import("data-raw/Holder_1999/Holder_1999.csv") %>%
    mutate(
      SUBJID=zoo::na.locf(na_if(SUBJID, ""))
    ) %>%
    rename(
      ID=SUBJID,
      CONC=PCCONC,
      CONCU=PCCONCU,
      DOSE=EXDOSE,
      DOSEU=EXDOSU
    )
  
  # QC the data entry
  Rats2 <-
    data(Rats, package="PK") %>%
    filter(time != 0) %>%
    arrange(id, time)
  
  d_raw2 <-
    d_raw %>%
    arrange(SUBJID, TIME) %>%
    mutate(
      diff=PCCONC - Rats2$conc
    )
  
  wrong <- d_raw2 %>% filter(diff != 0)
  if (nrow(wrong) > 0) {
    stop("Data QC did not pass")
  }

  Holder_1999_conc <-
    d_raw %>%
    select(
      ID, TIME, TIMEU, CONC, CONCU
    )
  
  Holder_1999_dose <-
    d_raw %>%
    mutate(
      TIME=0,
      ROUTE="oral"
    ) %>%
    select(ID, TIME, TIMEU, DOSE, DOSEU, ROUTE) %>%
    unique()
  
  Holder_1999_demog <-
    d_raw %>%
    mutate(
      SPECIES="rat"
    ) %>%
    select(ID, SPECIES, SEX, GROUP) %>%
    unique()
  
  usethis::use_data(
    Holder_1999_conc,
    Holder_1999_dose,
    Holder_1999_demog,

    overwrite=TRUE
  )
})