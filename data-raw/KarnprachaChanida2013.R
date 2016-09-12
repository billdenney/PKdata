rm(list=ls())

## Source for file (downloaded on 2016-09-12):
## https://ir.library.oregonstate.edu/xmlui/bitstream/handle/1957/39168/KarnprachaChanida2013.pdf?sequence=1

## library(devtools)
## install.packages("png")
## install_github("leeper/tabulizerjars")
## install_github("leeper/tabulizer")
library(tabulizer)
library(tidyr)
library(dplyr)

local({
  table.locations <- list(
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
  for (n in names(table.locations)) {
    cat("Reading", n, "...\n")
    table.locations[[n]]$rawdata <-
      extract_tables(file="data-raw/KarnprachaChanida2013.pdf",
                     pages=table.locations[[n]]$pages)[[1]]
  }
  
  ##############################
  ## Clean up the table data
  
  ## Split a column where two values are separated by a space in the
  ## same data.
  split.column <- function(x) {
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
          as.numeric(split.column(
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
  for (n in names(colmap))
    table.locations[[n]]$data <-
    mapdata(table.locations[[n]]$rawdata[colmap[[n]]$rows,],
            colmap[[n]]$columns)
  
  ## Tables where the data came in a single row
  for (n in c("table2", "table15", "table16", "table17",
              "table18")) {
    tmp <- strsplit(table.locations[[n]]$rawdata[3,], split=" \r")
    names(tmp) <- names(colmap$table1$columns)
    table.locations[[n]]$data <- as.data.frame(tmp)
  }
  
  ## Convert "Sample" to always be numeric
  for (n in names(table.locations)) {
    if ("Sample" %in% names(table.locations[[n]]$rawdata)) {
      if (is.factor(table.locations[[n]]$rawdata$Sample)) {
        table.locations[[n]]$rawdata$Sample <-
          as.numeric(as.character(table.locations[[n]]$rawdata$Sample))
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
  
  table.locations$table21$data <-
    rbind(
      cbind(data.frame(dose="Low"),
            get.num.sex(table.locations$table21$rawdata[,1])),
      cbind(data.frame(dose="Medium"),
            get.num.sex(table.locations$table21$rawdata[,2])),
      cbind(data.frame(dose="High"),
            get.num.sex(table.locations$table21$rawdata[,3])))
  
  table.locations$table22$data <-
    data.frame(
      ID=as.numeric(strsplit(table.locations$table22$rawdata[3,1], split=" \r")[[1]]),
      Sex=toupper(strsplit(table.locations$table22$rawdata[3,2], split=" \r")[[1]]),
      Age=factor(strsplit(table.locations$table22$rawdata[3,3], split=" \r")[[1]],
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
    tmp <- table.locations[[n]]$rawdata
    tmp <- tmp[startrow[[n]]:nrow(tmp),]
    if (n %in% names(splitcol)) {
      tmp <- cbind(tmp[,1:(splitcol[[n]]-1)],
                   split.column(tmp[,splitcol[[n]]]),
                   tmp[,(splitcol[[n]] + 1):ncol(tmp)])
    }
    table.locations[[n]]$data <- conc.time.to.long(tmp)
  }
  
  ## Clean up tables 13 and 14
  tmpdata <- table.locations$table13$rawdata
  data.rows <- list(3:20, 3:15, 3:19)
  table.locations$table13$data <-
    rbind(
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[1]],1]),
                       Dose=20),
            split.column(tmpdata[data.rows[[1]],2])),
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[2]],1]),
                       Dose=60),
            split.column(tmpdata[data.rows[[2]],3])),
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[3]],1]),
                       Dose=180),
            split.column(tmpdata[data.rows[[3]],4])))
  names(table.locations$table13$data) <- c("ID", "Dose", "Kinetica", "WinNonlin")
  table.locations$table13$data <-
    rbind(
      mutate(rename(table.locations$table13$data[,c("ID", "Dose", "Kinetica")],
                    Vss=Kinetica),
             Software="Kinetica version 5.0"),
      mutate(rename(table.locations$table13$data[,c("ID", "Dose", "WinNonlin")],
                    Vss=WinNonlin),
             Software="WinNonlin version 5.3"))
  table.locations$table13$data$ANALYTE <- "xanthohumol"
  
  tmpdata <- table.locations$table14$rawdata
  data.rows <- list(3:15, 3:19)
  table.locations$table14$data <-
    rbind(
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[1]],1]),
                       Dose=60),
            split.column(tmpdata[data.rows[[1]],2])),
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[2]],1]),
                       Dose=180),
            split.column(tmpdata[data.rows[[2]],3])))
  names(table.locations$table14$data) <- c("ID", "Dose", "Kinetica", "WinNonlin")
  table.locations$table14$data <-
    rbind(
      mutate(rename(table.locations$table14$data[,c("ID", "Dose", "Kinetica")],
                    Vss=Kinetica),
             Software="Kinetica version 5.0"),
      mutate(rename(table.locations$table14$data[,c("ID", "Dose", "WinNonlin")],
                    Vss=WinNonlin),
             Software="WinNonlin version 5.3"))
  table.locations$table14$data$ANALYTE <- "isoxanthohumol"
  
  tmpdata <- table.locations$table20$rawdata
  data.rows <- list(4:22, 4:22)
  table.locations$table20$data <-
    rbind(
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[1]],1]),
                       ANALYTE="racemic lipoic acid"),
            split.column(tmpdata[data.rows[[1]],2])),
      cbind(data.frame(ID=as.numeric(tmpdata[data.rows[[2]],1]),
                       ANALYTE="r-lipoic acid"),
            split.column(tmpdata[data.rows[[2]],3])))
  names(table.locations$table20$data) <- c("ID", "ANALYTE", "Kinetica", "WinNonlin")
  table.locations$table20$data <-
    rbind(
      mutate(rename(table.locations$table20$data[,c("ID", "ANALYTE", "Kinetica")],
                    Vss=Kinetica),
             Software="Kinetica version 5.0"),
      mutate(rename(table.locations$table20$data[,c("ID", "ANALYTE", "WinNonlin")],
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
  xanthohumol.low.conc <-
    rbind(mutate(table.locations$table23$data,
                 ANALYTE="xanthohumol"),
          mutate(table.locations$table23$data,
                 CONC=0, ## See the top of page 27
                 ANALYTE="isoxanthohumol"))
  xanthohumol.low.demog <-
    subset(table.locations$table21$data, dose %in% "Low")[,setdiff(names(table.locations$table21$data), "dose")]
  xanthohumol.low.dose <- makedose(xanthohumol.low.conc, dose=20) # mg
  
  xanthohumol.low.nca <-
    rbind(ncacleanup(table.locations$table1$data,
                     analyte="xanthohumol",
                     software="Kinetica version 5.0"),
          ncacleanup(table.locations$table4$data,
                     analyte="xanthohumol",
                     software="WinNonlin version 5.3"))
  
  xanthohumol.low.nca <-
    merge(xanthohumol.low.nca,
          table.locations$table13$data[table.locations$table13$data$Dose %in% 20,
                                       setdiff(names(table.locations$table13$data), "Dose")])
  xanthohumol.low.nca <- ncaupdate(xanthohumol.low.nca)
  
  ## Medium dose xanthohumol
  xanthohumol.medium.demog <-
    subset(table.locations$table21$data, dose %in% "Medium")[,setdiff(names(table.locations$table21$data), "dose")]
  xanthohumol.medium.conc <-
    rbind(mutate(table.locations$table24$data,
                 ANALYTE="xanthohumol"),
          mutate(table.locations$table24$data,
                 ANALYTE="isoxanthohumol"))
  xanthohumol.medium.dose <- makedose(xanthohumol.medium.conc, dose=60)
  
  xanthohumol.medium.nca <-
    bind_rows(
      ncacleanup(table.locations$table2$data,
                 analyte="xanthohumol",
                 software="Kinetica version 5.0"),
      ncacleanup(table.locations$table5$data,
                 analyte="xanthohumol",
                 software="WinNonlin version 5.3"),
      ncacleanup(table.locations$table8$data,
                 analyte="isoxanthohumol",
                 software="Kinetica version 5.0"),
      ncacleanup(table.locations$table10$data,
                 analyte="isoxanthohumol",
                 software="WinNonlin version 5.3"))
  
  xanthohumol.medium.nca <-
    merge(xanthohumol.medium.nca,
          rbind(table.locations$table13$data[table.locations$table13$data$Dose %in% 60,
                                             setdiff(names(table.locations$table13$data), "Dose")],
                table.locations$table14$data[table.locations$table14$data$Dose %in% 60,
                                             setdiff(names(table.locations$table14$data), "Dose")]))
  xanthohumol.medium.nca <- ncaupdate(xanthohumol.medium.nca)
  
  xanthohumol.high.demog <-
    subset(table.locations$table21$data, dose %in% "High")[,setdiff(names(table.locations$table21$data), "dose")]
  xanthohumol.high.conc <-
    rbind(mutate(table.locations$table25$data,
                 ANALYTE="xanthohumol"),
          mutate(table.locations$table25$data,
                 ANALYTE="isoxanthohumol"))
  xanthohumol.high.dose <- makedose(xanthohumol.high.conc, dose=180)
  
  xanthohumol.high.nca <-
    bind_rows(
      ncacleanup(table.locations$table3$data,
                 analyte="xanthohumol",
                 software="Kinetica version 5.0"),
      ncacleanup(table.locations$table6$data,
                 analyte="xanthohumol",
                 software="WinNonlin version 5.3"),
      ncacleanup(table.locations$table9$data,
                 analyte="isoxanthohumol",
                 software="Kinetica version 5.0"),
      ncacleanup(table.locations$table11$data,
                 analyte="isoxanthohumol",
                 software="WinNonlin version 5.3"))
  xanthohumol.high.nca <-
    merge(xanthohumol.high.nca,
          rbind(table.locations$table13$data[table.locations$table13$data$Dose %in% 180,
                                             setdiff(names(table.locations$table13$data), "Dose")],
                table.locations$table14$data[table.locations$table14$data$Dose %in% 180,
                                             setdiff(names(table.locations$table14$data), "Dose")]))
  xanthohumol.high.nca <- ncaupdate(xanthohumol.high.nca)
  
  lipoic.acid.demog <- table.locations$table22$data
  lipoic.acid.conc <-
    rbind(mutate(table.locations$table28$data,
                 ANALYTE="racemic lipoic acid",
                 Period=1),
          mutate(table.locations$table29$data,
                 ANALYTE="r-lipoic acid",
                 Period=2))
  lipoic.acid.dose <-
    mutate(unique(lipoic.acid.conc[,c("ID", "Period", "ANALYTE")]),
           TIME=0,
           DOSE=500,
           ROUTE="oral")
  lipoic.acid.nca <-
    bind_rows(
      mutate(ncacleanup(table.locations$table15$data,
                        analyte="racemic lipoic acid",
                        software="Kinetica version 5.0"),
             Period=1),
      mutate(ncacleanup(table.locations$table16$data,
                        analyte="r-lipoic acid",
                        software="Kinetica version 5.0"),
             Period=2),
      mutate(ncacleanup(table.locations$table17$data,
                        analyte="racemic lipoic acid",
                        software="WinNonlin version 5.3"),
             Period=1),
      mutate(ncacleanup(table.locations$table18$data,
                        analyte="r-lipoic acid",
                        software="WinNonlin version 5.3"),
             Period=2))
  lipoic.acid.nca <- merge(lipoic.acid.nca, table.locations$table20$data)
  lipoic.acid.nca <- ncaupdate(lipoic.acid.nca)
  
  
  xanthohumol.demog <- bind_rows(mutate(xanthohumol.low.demog, ID=paste0("L", ID)),
                                 mutate(xanthohumol.medium.demog, ID=paste0("M", ID)),
                                 mutate(xanthohumol.high.demog, ID=paste0("H", ID)))
  xanthohumol.dose <- bind_rows(mutate(xanthohumol.low.dose, ID=paste0("L", ID)),
                                mutate(xanthohumol.medium.dose, ID=paste0("M", ID)),
                                mutate(xanthohumol.high.dose, ID=paste0("H", ID)))
  xanthohumol.conc <- bind_rows(mutate(xanthohumol.low.conc, ID=paste0("L", ID)),
                                mutate(xanthohumol.medium.conc, ID=paste0("M", ID)),
                                mutate(xanthohumol.high.conc, ID=paste0("H", ID)))
  xanthohumol.nca <- bind_rows(mutate(xanthohumol.low.nca, ID=paste0("L", ID)),
                               mutate(xanthohumol.medium.nca, ID=paste0("M", ID)),
                               mutate(xanthohumol.high.nca, ID=paste0("H", ID)))

  ## Write out the data
  devtools::use_data(xanthohumol.demog,
                     xanthohumol.dose,
                     xanthohumol.conc,
                     xanthohumol.nca,
                     
                     lipoic.acid.demog,
                     lipoic.acid.dose,
                     lipoic.acid.conc,
                     lipoic.acid.nca,
                     
                     pkg=".",
                     overwrite=TRUE)
})
