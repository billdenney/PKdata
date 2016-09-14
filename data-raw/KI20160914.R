library(devtools)
library(dplyr)

local({
  d.raw <- read.csv("data-raw/KI20160914.csv",
                    stringsAsFactors=FALSE,
                    na.strings=".")
  d.cleaner <-
    rename(d.raw[,c("SUBJID", "VIST", "DAY", "TIME", "NTPD", "AMT",
                    "DV", "FORM", "TRTCD", "SEX", "AGE", "WT")],
           ID=SUBJID,
           PERIOD=VIST,
           TIME.FIRST.DOSE=TIME,
           TIME=NTPD,
           DOSE=AMT,
           CONC=DV,
           FORMULATION=FORM,
           WEIGHT=WT)
  d.cleaner <- mutate(d.cleaner,
                      SEX=factor(c("F", "M")[SEX + 1]),
                      FORMULATION=factor(FORMULATION))
  
  d.dose <-
    d.cleaner[!is.na(d.cleaner$DOSE),
              c("ID", "PERIOD", "DAY", "TIME.FIRST.DOSE", "TIME",
                "DOSE", "FORMULATION")]
  d.dose$TIME.FIRST.DOSE <- d.dose$TIME.FIRST.DOSE - 0.001
  d.dose$TIME <- d.dose$TIME - 0.001
  d.dose$ROUTE <- "oral"

  d.demog <- unique(d.cleaner[,c("ID", "SEX", "AGE", "WEIGHT")])
  
  d.conc <-
    d.cleaner[!is.na(d.cleaner$CONC),
              c("ID", "PERIOD", "DAY", "TIME.FIRST.DOSE", "TIME",
                "CONC", "FORMULATION")]
  
  KI20160914.conc <- d.conc
  KI20160914.dose <- d.dose
  KI20160914.demog <- d.demog

  devtools::use_data(KI20160914.conc,
                     KI20160914.dose,
                     KI20160914.demog,

                     pkg=".",
                     overwrite=TRUE)

})