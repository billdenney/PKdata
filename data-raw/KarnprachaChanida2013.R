rm(list=ls())

# Source for file (downloaded on 2020-01-01):
# https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf

# library(devtools)
# install.packages("png")
# 
#install.packages("tabulizerjars")
#install.packages("tabulizer")
library(tabulizer)
library(tidyr)
library(dplyr)

local({
  table_locations <- list(
    table1=list(
      pages=31,
      caption="The Pharmacokinetic parameters from Kinetica software of 20 mg of Xanthohumol"),
    table2=list(
      pages=32,
      caption="The Pharmacokinetic parameters from Kinetica software of 60 mg of Xanthohumol"),
    table3=list(
      pages=33,
      caption="The Pharmacokinetic parameters from Kinetica software of 180 mg of Xanthohumol"),
    table4=list(
      pages=34,
      caption="The Pharmacokinetic parameters from WinNonlin software of 20 mg of Xanthohumol"),
    table5=list(
      pages=35,
      caption="The Pharmacokinetic parameters from WinNonlin software of 60 mg of Xanthohumol"),
    table6=list(
      pages=36,
      caption="The Pharmacokinetic parameters from WinNonlin software of 180 mg of Xanthohumol"),
    table7=list(
      pages=37,
      caption="A comparison of Pharmacokinetic parameter of Xanthohumol between Kinetica and WinNonlin software"),
    table8=list(
      pages=43,
      caption="The Pharmacokinetic parameters from Kinetica software of Isoxanthohumol for 60mg Xanthohumol"),
    table9=list(
      pages=44,
      caption="The Pharmacokinetic parameters from Kinetica software of Isoxanthohumol for 180mg Xanthohumol"),
    table10=list(
      pages=45,
      caption="The Pharmacokinetic parameters from WinNonlin software of Isoxanthohumol for 60mg Xanthohumol"),
    table11=list(
      pages=46,
      caption="The Pharmacokinetic parameters from WinNonlin software of Isoxanthohumol for 180mg Xanthohumol"),
    table13=list(
      pages=53,
      caption="A comparison of Volume of distribution (Vss) of Xanthohumol between Kinetica and WinNonlin software"),
    table14=list(
      pages=54,
      caption="A comparison of Volume of distribution (Vss) of Isoxanthohumol between Kinetica and WinNonlin software"),
    table15=list(
      pages=74,
      caption="The Pharmacokinetic parameters of racemic form of Lipoic acid 500mg from Kinetica software"),
    table16=list(
      pages=75,
      caption="The Pharmacokinetic parameters of r-form of Lipoic acid 500mg from Kinetica software"),
    table17=list(
      pages=76,
      caption="The Pharmacokinetic parameters of racemic form of Lipoic acid 500mg from WinNonlin software"),
    table18=list(
      pages=77,
      caption="The Pharmacokinetic parameters of r-form of Lipoic acid 500mg from WinNonlin software"),
    table20=list(
      pages=79,
      caption="A comparison of Volume of distribution (Vss) of Lipoic acid between Kinetica and WinNonlin software"),
    table21=list(
      pages=94,
      caption="Subject detail in sex for Xanthohumol and Isoxanthohumol study"),
    table22=list(
      pages=95,
      caption="Subject detail in sex for Lipoic acid study"),
    table23=list(
      pages=96,
      caption="Concentration (µg/L) of Xanthohumol in Low dose group (20mg)"),
    table24=list(
      pages=97,
      caption="Concentration (µg/L) of Xanthohumol in Medium dose group (60mg)"),
    table25=list(
      pages=98,
      caption="Concentration (µg/L) of Xanthohumol in High dose group (180mg)"),
    table26=list(
      pages=102,
      caption="Concentration (µg/L) of Isoxanthohumol in Medium dose group (60mg)"),
    table27=list(
      pages=103,
      caption="Concentration (µg/L) of Isoxanthohumol in High dose group (180mg)"),
    table28=list(
      pages=106,
      caption="Concentration (ng/ml) of Racemic form of Lipoic acid"),
    table29=list(
      pages=107,
      caption="Concentration (ng/ml) of R- form of Lipoic acid"))
  
  ## Extract the data for each table  
  for (n in names(table_locations)) {
    cat("Reading", n, "...\n")
    table_locations[[n]]$rawdata <-
      extract_tables(
        file="data-raw/KarnprachaChanida2013.pdf",
        pages=table_locations[[n]]$pages
      )[[1]]
  }
  
  ##############################
  ## Clean up the table data
  
  ## Split a column where two values are separated by a space in the
  ## same data.
  split_column <- function(x) {
    ret <- strsplit(x, " ")
    ## If there are any blanks, ensure that the output has blanks as
    ## well.
    mylen <- sapply(ret, length)
    ret[mylen == 0] <- list(rep("", max(mylen)))
    ## collate the results
    do.call(rbind, ret)
  }
  
  mapdata <- function(data, colmap) {
    ret <- data.frame(drop=1:nrow(data))[,-1]
    for (n in names(colmap)) {
      if (length(colmap[[n]]) == 1) {
        ## Extract the column making it numeric
        ret[,n] <-
          as.numeric(data[,colmap[[n]]])
      } else {
        ## Extract part of the column making it numeric
        ret[,n] <-
          as.numeric(split_column(
            data[,colmap[[n]][1]])[,colmap[[n]][2]])
      }
    }
    ret
  }
  
  ## Column mappings for each table
  colmap <- list(
    table1=list(
      columns=list(
        Sample=1,
        Cmax=2,
        Tmax=3,
        thalf=4,
        lambda.z=5,
        AUC=c(7, 1),
        AUMC=c(7, 2),
        MRT=8,
        CL.F=9,
        Vz.F=10)),
    table3=list(
      columns=list(
        Sample=1,
        Cmax=2,
        Tmax=3,
        thalf=4,
        lambda.z=5,
        AUC=7,
        AUMC=8,
        MRT=9,
        CL.F=10,
        Vz.F=11)))
  colmap$table4 <- colmap$table5 <- colmap$table6 <- colmap$table8 <-
    colmap$table9 <- colmap$table10 <- colmap$table11 <- 
    colmap$table3
  
  colmap$table1$rows <- 5:22
  colmap$table3$rows <- 5:21
  colmap$table4$rows <- 5:22
  colmap$table5$rows <- 5:17
  colmap$table6$rows <- 5:21
  #colmap$table7$rows <- 5:17
  colmap$table8$rows <- 5:17
  colmap$table9$rows <- 5:21
  colmap$table10$rows <- 5:17
  colmap$table11$rows <- 5:21
  
  ## Tables where the data came in as multiple rows
  for (n in names(colmap)) {
    table_locations[[n]]$data <-
      mapdata(
        table_locations[[n]]$rawdata[colmap[[n]]$rows,],
        colmap[[n]]$columns
      )
  }
  
  ## Tables where the data came in a single row
  for (n in c("table2", "table15", "table16", "table17",
              "table18")) {
    tmp <- strsplit(table_locations[[n]]$rawdata[3,], split=" \r")
    names(tmp) <- names(colmap$table1$columns)
    table_locations[[n]]$data <- as.data.frame(tmp)
  }
  
  ## Convert "Sample" to always be numeric
  for (n in names(table_locations)) {
    if ("Sample" %in% names(table_locations[[n]]$rawdata)) {
      if (is.factor(table_locations[[n]]$rawdata$Sample)) {
        table_locations[[n]]$rawdata$Sample <-
          as.numeric(as.character(table_locations[[n]]$rawdata$Sample))
      }
    }
  }
  
  ## Demographic information
  
  ## Table 21
  get.num.sex <- function(x) {
    pattern.num.sex <- "^([0-9]+) ([FfMm]) *$"
    mask.sex <- grepl(pattern.num.sex, x)
    x <- x[mask.sex]
    data.frame(ID=as.numeric(
      gsub(pattern.num.sex, "\\1", x)),
      Sex=toupper(
        gsub(pattern.num.sex, "\\2", x)))
  }
  
  table_locations$table21$data <-
    rbind(
      cbind(data.frame(dose="Low"),
            get.num.sex(table_locations$table21$rawdata[,1])),
      cbind(data.frame(dose="Medium"),
            get.num.sex(table_locations$table21$rawdata[,2])),
      cbind(data.frame(dose="High"),
            get.num.sex(table_locations$table21$rawdata[,3])))
  
  table_locations$table22$data <-
    data.frame(
      ID=as.numeric(strsplit(table_locations$table22$rawdata[3,1], split=" \r")[[1]]),
      Sex=toupper(strsplit(table_locations$table22$rawdata[3,2], split=" \r")[[1]]),
      Age=factor(strsplit(table_locations$table22$rawdata[3,3], split=" \r")[[1]],
                 levels=c("y", "e"),
                 labels=c("Young", "Elderly")))
  
  ## Concentration/time data
  conc.time.to.long <- function(x) {
    colnames(x) <- c("ID",
                     paste("TIME", trimws(x[2,2:ncol(x)]), sep="_"))
    x <- x[c(-1,-2),]
    x <- tidyr::gather(as.data.frame(x, stringsAsFactors=FALSE),
                       key="TIME", value="CONC", 2:ncol(x))
    x$ID <- as.numeric(x$ID)
    x$TIME <- as.numeric(gsub("TIME_", "", x$TIME))
    x$CONC <- as.numeric(x$CONC)
    x <- x[with(x, order(ID, TIME)),]
    rownames(x) <- NULL
    x
  }
  
  startrow <- list(table23=1,
                   table24=1,
                   table25=1,
                   table26=2,
                   table27=1,
                   table28=1,
                   table29=1)
  splitcol <- list(table26=8)
  
  for (n in names(startrow)) {
    tmp <- table_locations[[n]]$rawdata
    tmp <- tmp[startrow[[n]]:nrow(tmp),]
    if (n %in% names(splitcol)) {
      tmp <- cbind(tmp[,1:(splitcol[[n]]-1)],
                   split_column(tmp[,splitcol[[n]]]),
                   tmp[,(splitcol[[n]] + 1):ncol(tmp)])
    }
    table_locations[[n]]$data <- conc.time.to.long(tmp)
  }
  
  ## Clean up tables 13 and 14
  tmpdata <- table_locations$table13$rawdata
  data.rows <- list(3:20, 3:15, 3:19)
  table_locations$table13$data <-
    rbind(
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[1]],1]),
                       Dose=20),
            split_column(tmpdata[data.rows[[1]],2])),
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[2]],1]),
                       Dose=60),
            split_column(tmpdata[data.rows[[2]],3])),
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[3]],1]),
                       Dose=180),
            split_column(tmpdata[data.rows[[3]],4])))
  names(table_locations$table13$data) <- c("ID", "Dose", "Kinetica", "WinNonlin")
  table_locations$table13$data <-
    rbind(
      mutate(rename(table_locations$table13$data[,c("ID", "Dose", "Kinetica")],
                    Vss=Kinetica),
             Software="Kinetica version 5.0"),
      mutate(rename(table_locations$table13$data[,c("ID", "Dose", "WinNonlin")],
                    Vss=WinNonlin),
             Software="WinNonlin version 5.3"))
  table_locations$table13$data$ANALYTE <- "xanthohumol"
  
  tmpdata <- table_locations$table14$rawdata
  data.rows <- list(3:15, 3:19)
  table_locations$table14$data <-
    rbind(
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[1]],1]),
                       Dose=60),
            split_column(tmpdata[data.rows[[1]],2])),
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[2]],1]),
                       Dose=180),
            split_column(tmpdata[data.rows[[2]],3])))
  names(table_locations$table14$data) <- c("ID", "Dose", "Kinetica", "WinNonlin")
  table_locations$table14$data <-
    rbind(
      mutate(rename(table_locations$table14$data[,c("ID", "Dose", "Kinetica")],
                    Vss=Kinetica),
             Software="Kinetica version 5.0"),
      mutate(rename(table_locations$table14$data[,c("ID", "Dose", "WinNonlin")],
                    Vss=WinNonlin),
             Software="WinNonlin version 5.3"))
  table_locations$table14$data$ANALYTE <- "isoxanthohumol"
  
  tmpdata <- table_locations$table20$rawdata
  data.rows <- list(4:22, 4:22)
  table_locations$table20$data <-
    rbind(
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[1]],1]),
                       ANALYTE="racemic lipoic acid"),
            split_column(tmpdata[data.rows[[1]],2])),
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[2]],1]),
                       ANALYTE="r-lipoic acid"),
            split_column(tmpdata[data.rows[[2]],3])))
  names(table_locations$table20$data) <- c("ID", "ANALYTE", "Kinetica", "WinNonlin")
  table_locations$table20$data <-
    rbind(
      mutate(rename(table_locations$table20$data[,c("ID", "ANALYTE", "Kinetica")],
                    Vss=Kinetica),
             Software="Kinetica version 5.0"),
      mutate(rename(table_locations$table20$data[,c("ID", "ANALYTE", "WinNonlin")],
                    Vss=WinNonlin),
             Software="WinNonlin version 5.3"))
  
  ncacleanup <- function(data, analyte, software) {
    for (n in names(data)) {
      if (is.factor(data[,n])) {
        data[,n] <- as.numeric(as.character(data[,n]))
      }
    }
    data$ANALYTE <- analyte
    data$Software <- software
    data$ID <- data$Sample
    data$Sample <- NULL
    data
  }
  
  ncaupdate <- function(x) {
    ret <-
      arrange(gather(x, Parameter, Value, -ID, -ANALYTE, -Software),
              ID, ANALYTE, Parameter, Software)
    ret[,c("ID", "ANALYTE", "Parameter", "Software", "Value")]
  }
  
  makedose <- function(conc, dose) {
    data.frame(ID=unique(conc$ID),
               TIME=0,
               DOSE=dose,
               ROUTE="oral")
  }
  
  ## Low dose xanthohumol
  xanthohumol_low_conc <-
    rbind(mutate(table_locations$table23$data,
                 ANALYTE="xanthohumol"),
          mutate(table_locations$table23$data,
                 CONC=0, ## See the top of page 27
                 ANALYTE="isoxanthohumol"))
  xanthohumol_low_demog <-
    subset(table_locations$table21$data, dose %in% "Low")[,setdiff(names(table_locations$table21$data), "dose")]
  xanthohumol_low_dose <- makedose(xanthohumol_low_conc, dose=20) # mg
  
  xanthohumol_low_nca <-
    rbind(ncacleanup(table_locations$table1$data,
                     analyte="xanthohumol",
                     software="Kinetica version 5.0"),
          ncacleanup(table_locations$table4$data,
                     analyte="xanthohumol",
                     software="WinNonlin version 5.3"))
  
  xanthohumol_low_nca <-
    merge(xanthohumol_low_nca,
          table_locations$table13$data[table_locations$table13$data$Dose %in% 20,
                                       setdiff(names(table_locations$table13$data), "Dose")])
  xanthohumol_low_nca <- ncaupdate(xanthohumol_low_nca)
  
  ## Medium dose xanthohumol
  xanthohumol_medium_demog <-
    subset(table_locations$table21$data, dose %in% "Medium")[,setdiff(names(table_locations$table21$data), "dose")]
  xanthohumol_medium_conc <-
    rbind(mutate(table_locations$table24$data,
                 ANALYTE="xanthohumol"),
          mutate(table_locations$table24$data,
                 ANALYTE="isoxanthohumol"))
  xanthohumol_medium_dose <- makedose(xanthohumol_medium_conc, dose=60)
  
  xanthohumol_medium_nca <-
    bind_rows(
      ncacleanup(table_locations$table2$data,
                 analyte="xanthohumol",
                 software="Kinetica version 5.0"),
      ncacleanup(table_locations$table5$data,
                 analyte="xanthohumol",
                 software="WinNonlin version 5.3"),
      ncacleanup(table_locations$table8$data,
                 analyte="isoxanthohumol",
                 software="Kinetica version 5.0"),
      ncacleanup(table_locations$table10$data,
                 analyte="isoxanthohumol",
                 software="WinNonlin version 5.3"))
  
  xanthohumol_medium_nca <-
    merge(xanthohumol_medium_nca,
          rbind(table_locations$table13$data[table_locations$table13$data$Dose %in% 60,
                                             setdiff(names(table_locations$table13$data), "Dose")],
                table_locations$table14$data[table_locations$table14$data$Dose %in% 60,
                                             setdiff(names(table_locations$table14$data), "Dose")]))
  xanthohumol_medium_nca <- ncaupdate(xanthohumol_medium_nca)
  
  xanthohumol_high_demog <-
    subset(table_locations$table21$data, dose %in% "High")[,setdiff(names(table_locations$table21$data), "dose")]
  xanthohumol_high_conc <-
    rbind(mutate(table_locations$table25$data,
                 ANALYTE="xanthohumol"),
          mutate(table_locations$table25$data,
                 ANALYTE="isoxanthohumol"))
  xanthohumol_high_dose <- makedose(xanthohumol_high_conc, dose=180)
  
  xanthohumol_high_nca <-
    bind_rows(
      ncacleanup(table_locations$table3$data,
                 analyte="xanthohumol",
                 software="Kinetica version 5.0"),
      ncacleanup(table_locations$table6$data,
                 analyte="xanthohumol",
                 software="WinNonlin version 5.3"),
      ncacleanup(table_locations$table9$data,
                 analyte="isoxanthohumol",
                 software="Kinetica version 5.0"),
      ncacleanup(table_locations$table11$data,
                 analyte="isoxanthohumol",
                 software="WinNonlin version 5.3"))
  xanthohumol_high_nca <-
    merge(xanthohumol_high_nca,
          rbind(table_locations$table13$data[table_locations$table13$data$Dose %in% 180,
                                             setdiff(names(table_locations$table13$data), "Dose")],
                table_locations$table14$data[table_locations$table14$data$Dose %in% 180,
                                             setdiff(names(table_locations$table14$data), "Dose")]))
  xanthohumol_high_nca <- ncaupdate(xanthohumol_high_nca)
  
  lipoic.acid_demog <- table_locations$table22$data
  lipoic.acid_conc <-
    rbind(mutate(table_locations$table28$data,
                 ANALYTE="racemic lipoic acid",
                 Period=1),
          mutate(table_locations$table29$data,
                 ANALYTE="r-lipoic acid",
                 Period=2))
  lipoic.acid_dose <-
    mutate(unique(lipoic.acid_conc[,c("ID", "Period", "ANALYTE")]),
           TIME=0,
           DOSE=500,
           ROUTE="oral")
  lipoic.acid.nca <-
    bind_rows(
      mutate(ncacleanup(table_locations$table15$data,
                        analyte="racemic lipoic acid",
                        software="Kinetica version 5.0"),
             Period=1),
      mutate(ncacleanup(table_locations$table16$data,
                        analyte="r-lipoic acid",
                        software="Kinetica version 5.0"),
             Period=2),
      mutate(ncacleanup(table_locations$table17$data,
                        analyte="racemic lipoic acid",
                        software="WinNonlin version 5.3"),
             Period=1),
      mutate(ncacleanup(table_locations$table18$data,
                        analyte="r-lipoic acid",
                        software="WinNonlin version 5.3"),
             Period=2))
  lipoic.acid.nca <- merge(lipoic.acid.nca, table_locations$table20$data)
  lipoic.acid.nca <- ncaupdate(lipoic.acid.nca)
  
  
  xanthohumol_demog <- bind_rows(mutate(xanthohumol_low_demog, ID=paste0("L", ID)),
                                 mutate(xanthohumol_medium_demog, ID=paste0("M", ID)),
                                 mutate(xanthohumol_high_demog, ID=paste0("H", ID)))
  xanthohumol_dose <- bind_rows(mutate(xanthohumol_low_dose, ID=paste0("L", ID)),
                                mutate(xanthohumol_medium_dose, ID=paste0("M", ID)),
                                mutate(xanthohumol_high_dose, ID=paste0("H", ID)))
  xanthohumol_conc <- bind_rows(mutate(xanthohumol_low_conc, ID=paste0("L", ID)),
                                mutate(xanthohumol_medium_conc, ID=paste0("M", ID)),
                                mutate(xanthohumol_high_conc, ID=paste0("H", ID)))
  xanthohumol.nca <- bind_rows(mutate(xanthohumol_low_nca, ID=paste0("L", ID)),
                               mutate(xanthohumol_medium_nca, ID=paste0("M", ID)),
                               mutate(xanthohumol_high_nca, ID=paste0("H", ID)))

  ## Write out the data
  usethis::use_data(
    xanthohumol_demog,
    xanthohumol_dose,
    xanthohumol_conc,
    xanthohumol.nca,
    
    lipoic.acid_demog,
    lipoic.acid_dose,
    lipoic.acid_conc,
    lipoic.acid.nca,

    overwrite=TRUE
  )
})
