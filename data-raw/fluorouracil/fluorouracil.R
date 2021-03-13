# From 
# MacMillan, William E., William H. Wolberg, and Peter G. Welling. 1978.
# "Pharmacokinetics of Fluorouracil in Humans." Cancer Research 38 (10):
# 3479-82.

library(assertr)
library(devtools)
library(rio)
library(tidyverse)

local({
  d_raw <-
    import_list("data-raw/fluorouracil.xlsx") %>%
    lapply(
      FUN=function(x) {
        x <- type_convert(x)
        # All input data has 1 significant figure
        for (current_col in seq_along(x)) {
          if (is.numeric(x[[current_col]])) {
            x[[current_col]] <- round(x[[current_col]], 1)
          }
        }
        x
      }
    )
  d_conc <-
    d_raw[["Table 2"]] %>%
    gather(key="TIME", value="CONC", `0 min`:`60 min`) %>%
    rename(
      ID=SUBJID,
      NDOSE=`Dose (mg/kg)`
    ) %>%
    mutate(
      TIMEU="minutes",
      CONCU="ug/mL",
      NDOSEU="mg/kg",
      TIME=as.numeric(gsub(x=TIME, pattern=" min", replacement=""))
    ) %>%
    verify(!is.na(TIME)) %>%
    select(ID, TIME, TIMEU, NDOSE, NDOSEU, CONC, CONCU, everything()) %>%
    arrange_all()
  d_demog <-
    d_raw[["Table 1"]] %>%
    rename(
      ID=SUBJID,
      SEX=Sex,
      AGE="Age (yr)",
      WEIGHT="Weight (kg)",
      WBC="WBC (10^3/cu mm)",
      RBC="RBC (10^6/cu mm)",
      BUN="blood urea nitrogen (mg%)",
      AST="aspartate aminotransferase (units/mL)",
      ALT="alaniane aminotransferase (units/mL)"
    ) %>%
    mutate(
      AGEU="years",
      WEIGHTU="kg",
      WBCU="10^9/L", # Equivalent to 10^3/cu mm
      RBCU="10^12/L", # Equivalent to 10^6/cu mm
      BUNU="mg/L", # Equivalent to mg%
      ASTU="U/mL",
      ALTU="U/mL"
    ) %>%
    select(
      ID, SEX,
      AGE, AGEU,
      WEIGHT, WEIGHTU,
      WBC, WBCU,
      RBC, RBCU,
      BUN, BUNU,
      AST, ASTU,
      ALT, ALTU,
      Diagnosis,
      everything()
    )
  d_dose <-
    d_raw[["Table 2"]] %>%
    select(ID=SUBJID, NDOSE="Dose (mg/kg)") %>%
    mutate(
      NDOSEU="mg/kg",
      TIME=0,
      TIME_END=0.5,
      TIMEU="minutes",
      ROUTE="intravenous bolus"
    )
  fluorouracil_conc <- d_conc
  fluorouracil_dose <- d_dose
  fluorouracil_demog <- d_demog

  usethis::use_data(
    fluorouracil_conc,
    fluorouracil_dose,
    fluorouracil_demog,

    overwrite=TRUE
  )
})