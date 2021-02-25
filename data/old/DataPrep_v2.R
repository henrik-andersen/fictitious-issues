# ----- 
# Title:  Data preparation Pseudo opinions paper
# Author: Henrik Andersen 
# Date:   10.07.2020
# ----- 

# Set language to English 
Sys.setenv(LANG = "en")

# Start fresh
rm(list = ls())

# Packages ----------------------------------------------------------------

library(tidyr)
library(dplyr)
library(car)
library(gt)
library(gridExtra)
library(ggeffects)
library(ggplot2)
library(lme4)


# Setup -------------------------------------------------------------------

# Set working directory 
setwd("D:/Henrik/Seafile/Meine Bibliothek/Henrik Jochen/Papers/SD Papers/SD Projekt Daten Henrik/Articles/Fictitious Issues/Analysis/Data") # PC Home
# setwd("D:/Seafile/Meine Bibliothek/Henrik Jochen/Papers/SD Papers/SD Projekt Daten Henrik/Articles/Fictitious Issues/Analysis/Data")

# Read the csv file
df <- read.csv("sdData_v01.csv")

# Can't seem to rename X, instead, make new duplicate id column 
df$id <- df$X

# Remove rows where they did not make it past page 1
df <- df[df$MAXPAGE != 1, ]


# Data preparation --------------------------------------------------------

# ----- Experimental designs 

# Make implicit/explicit DK column
# Variables with prefix FI01 are IMPLICIT, with FI02 are EXPLICIT
df$impDK <- ifelse(!is.na(df$FI01_04) | 
                     !is.na(df$FI01_06) | 
                     !is.na(df$FI01_08) | 
                     !is.na(df$FI01_09) | 
                     !is.na(df$FI01_13) | 
                     !is.na(df$FI01_15), 1,
                   ifelse(!is.na(df$FI02_04) | 
                            !is.na(df$FI02_06) | 
                            !is.na(df$FI02_08) | 
                            !is.na(df$FI02_09) | 
                            !is.na(df$FI02_13) | 
                            !is.na(df$FI02_15), 0, NA))

# Turn into a factor 
df$impDK <- factor(df$impDK, levels = c(0, 1), labels = c("explicit DK", "implicit DK"))


# ----- Demographics/control variables

# Make sex (male) dummy
df$male <- df$DG02

# Make numeric variable
df$male <- as.numeric(ifelse(df$male == "maennlich", 1, 
                             ifelse(df$male == "weiblich", 0, NA)))

# Turn back into factor 
df$male <- factor(df$male, levels = c(0, 1), labels = c("female", "male"))

# Make year of birth variable 
df$yob <- df$DG03_01 

# Implausible years as NAs
df$yob[ df$yob == "-1983" | df$yob == "1067" | df$yob == "1874" | df$yob == "1884" | 
          df$yob == "191"  | df$yob == "1067" | df$yob == "200" | df$yob == "2983"] <- NA

# Individual years where respondent entered a space after the year 
df$yob[ df$yob == "1957 "] <- 1957
df$yob[ df$yob == "1959 "] <- 1959
df$yob[ df$yob == "1961 "] <- 1961
df$yob[ df$yob == "1962 "] <- 1962
df$yob[ df$yob == "1964 "] <- 1964
df$yob[ df$yob == "1967 "] <- 1967
df$yob[ df$yob == "1968 "] <- 1968
df$yob[ df$yob == "1972 "] <- 1972
df$yob[ df$yob == "1973 "] <- 1973
df$yob[ df$yob == "1975 "] <- 1975
df$yob[ df$yob == "1991 "] <- 1991
df$yob[ df$yob == "9.2.1980"] <- 1980

# Turn yob to numeric
df$yob <- as.numeric(df$yob)

# Recode where respondent plausibly entered age instead of yob
df$yob <- ifelse( df$yob < 1943, 2019 - df$yob, df$yob); table( df$yob)

# Make age variable 
df$age <- as.numeric(format(Sys.Date(), "%Y")) - df$yob

# Make nationality (German) dummy 
df$german <- df$DG05
df$german <- ifelse(df$german == "die deutsche und eine andere Staatsangehoerigkeit" | 
                      df$german == "nur die deutsche Staatsangehoerigkeit", 1, 0)
df$german <- factor(df$german, levels = c(0, 1), labels = c("no German citizenship", "German citizenship"))

# German w/ migration background
df$gerMigr <- df$DG05
df$gerMigr <- ifelse(df$gerMigr == "die deutsche und eine andere Staatsangehoerigkeit", 1, 0)
df$gerMigr <- factor(df$gerMigr, levels = c(0, 1), labels = c("foreign or only German", "German with migration background"))

# Education dummies 
df$educ <- df$DG08

# Recode original variable, discard some categories 
df$educ <- ifelse(df$educ == "ohne Abschluss von der Schule gegangen", 1,
                  ifelse(df$educ == "(qualifizierter/erweiterter) Hauptschulabschluss / Volksschulabschluss / Polytechnische Oberschule (POS) Abschluss 8. Klasse (DDR-Abschluss)", 2, 
                         ifelse(df$educ == "Realschulabschluss / Mittlere Reife / Fachhochschulreife / Polytechnische Oberschule (POS) 10. Klasse (DDR-Abschluss)", 3, 
                                ifelse(df$educ == "Fachhochschulreife", 4, 
                                       ifelse(df$educ == "Abitur / Hochschulreife / Fachabitur / Erweiterte Oberschule (EOS) (DDR-Abschluss)", 5, NA)))))

# New factor variable with 5 categories 
df$educ <- factor(df$educ, levels = c(1, 2, 3, 4, 5), 
                  labels = c("no degree", "Hauptschule", "Realschule", "Fachhochschulreife", "Abitur"))

# Set "Hauptschule" as reference  
df$educ <- relevel(df$educ, ref = "Hauptschule")

# "No degree" has just 14 cases, drop it because it is causing problems with models 
df$educ <- ifelse(df$educ == "no degree", NA, df$educ)

# Overwrite first factor variable with new one with just four categories 
df$educ <- factor(df$educ, levels = c(1, 3, 4, 5), 
                  labels = c("Hauptschule", "Realschule", "Fachhochschulreife", "Abitur"))

# Again, make "Hauptschule" the reference 
df$educ <- relevel(df$educ, ref = "Hauptschule")

# Political interest 
df$polint <- df$DQ04_01

# Set missings 
df$polint <- ifelse(df$polint > 1, df$polint, NA)

# Political orientation 
df$lr <- df$DQ05_01

# Set missings 
df$lr <- ifelse( df$lr > 1, df$lr, NA)

# Add labels as attributes 
attr(df$lr, "1") = "sehr links"
attr(df$lr, "11") = "sehr rechts"

# Need for social approval 

# Meine Entscheidungen sind manchmal unklug. 1 = stimme gar nicht zu, 5 = stimme voll zu.
df$am1r <- ifelse(df$BI06_01 == "1 stimme gar nicht zu", 5, 
                  ifelse(df$BI06_01 == "2", 4, 
                         ifelse(df$BI06_01 == "3", 3, 
                                ifelse(df$BI06_01 == "4", 2,
                                       ifelse(df$BI06_01 == "5 stimme voll und ganz zu", 1, NA)))))

# Manchmal lüge ich, wenn es die Situation erfordert. 1 = stimme gar nicht zu, 5 = stimme voll zu.
df$cm1r <- ifelse(df$BI06_05 == "1 stimme gar nicht zu", 5, 
                  ifelse(df$BI06_05 == "2", 4, 
                         ifelse(df$BI06_05 == "3", 3, 
                                ifelse(df$BI06_05 == "4", 2,
                                       ifelse(df$BI06_05 == "5 stimme voll und ganz zu", 1, NA)))))

# Es ist schonmal vorgekommen, dass ich jemand ausgenutzt habe. 1 = stimme gar nicht zu, 5 = stimme voll zu.
df$cm2r <- ifelse(df$BI06_06 == "1 stimme gar nicht zu", 5, 
                  ifelse(df$BI06_06 == "2", 4, 
                         ifelse(df$BI06_06 == "3", 3, 
                                ifelse(df$BI06_06 == "4", 2,
                                       ifelse(df$BI06_06 == "5 stimme voll und ganz zu", 1, NA)))))

# After recoding, higher scores mean more NSA
df$nsa <- df$am1r + df$cm1r + df$cm2r

# ----- Fictitious issues 

# The following functions recode all the fictitious issues questions 
# into factors with the appropriate categories. For the FI02 items, 
# there is an extra "don't know" category that needs to be accounted for. 

recodeFun <- function(x) {
  # First recode the character variables into numerical
  y = ifelse(x == "eher schlecht", 0, 
             ifelse(x == "eher gut", 1, 
                    ifelse(x == "weiter", 2, NA)))
  # And then turn that back into a factor with the appropriate categories
  y = factor(y, levels = c(0, 1, 2), labels = c("negatively", "positively", "continue"))
  return(y)
}

recodeFun_dk <- function(x) {
  # First recode the character variables into numerical
  y = ifelse(x == "eher schlecht", 0, 
             ifelse(x == "eher gut", 1, 
                    ifelse(x == "kenne ich nicht", 2, 
                           ifelse(x == "weiter", 3, NA))))
  # And then turn that back into a factor with the appropriate categories
  y = factor(y, levels = c(0, 1, 2, 3), labels = c("negatively", "positively", "don't recognize", "continue"))
  return(y)
}

# Names of the items 
orgvars_imp <- paste0("FI01_", sprintf('%0.2d', 2:15))
orgvars_exp <- paste0("FI02_", sprintf('%0.2d', 2:15))

# Use lappy to apply the functions to all of the items
df[orgvars_imp] <- lapply(df[orgvars_imp], recodeFun)
df[orgvars_exp] <- lapply(df[orgvars_exp], recodeFun_dk)

# Recode positive and negative responses to just substantive yes/no
recodeFun2 <- function(x) {
  y = ifelse(x == "positively" | x == "negatively", 1, 
             ifelse(x == "don't recognize" | x == "continue", 0, NA))
  y = factor(y, levels = c(0, 1), labels = c("don't know", "substantive"))
  return(y)
}

# Apply the function 
df[orgvars_imp] <- lapply(df[orgvars_imp], recodeFun2)
df[orgvars_exp] <- lapply(df[orgvars_exp], recodeFun2)

# Merge the implicit/explicit columns
replaceFun <- function(x) {
  nameofx <- deparse(substitute(x))
  if(!is.numeric(x)) {
    x <- ifelse(is.na(x), eval(parse(text = paste0(substr(nameofx, 1, 6), "2", substr(nameofx, 8, nchar(nameofx))))), x)
    x <- ifelse(x == 1, 0, 
                ifelse(x == 2, 1, NA))
    x <- factor(x, levels = c(0, 1), labels = c("don't know", "substantive"))
  } else {
    x <- ifelse(is.na(x), eval(parse(text = paste0(substr(nameofx, 1, 6), "2", substr(nameofx, 8, nchar(nameofx))))), x)
  }
  return(x)
}

# Combine the columns
df$FI01_02 <- replaceFun(df$FI01_02)
df$FI01_03 <- replaceFun(df$FI01_03)
df$FI01_04 <- replaceFun(df$FI01_04)
df$FI01_05 <- replaceFun(df$FI01_05)
df$FI01_06 <- replaceFun(df$FI01_06)
df$FI01_07 <- replaceFun(df$FI01_07)
df$FI01_08 <- replaceFun(df$FI01_08)
df$FI01_09 <- replaceFun(df$FI01_09)
df$FI01_10 <- replaceFun(df$FI01_10)
df$FI01_11 <- replaceFun(df$FI01_11)
df$FI01_12 <- replaceFun(df$FI01_12)
df$FI01_13 <- replaceFun(df$FI01_13)
df$FI01_14 <- replaceFun(df$FI01_14)
df$FI01_15 <- replaceFun(df$FI01_15)

# Analogously combine RL columns
df$FI01_02a <- replaceFun(df$FI01_02a)
df$FI01_03a <- replaceFun(df$FI01_03a)
df$FI01_04a <- replaceFun(df$FI01_04a)
df$FI01_05a <- replaceFun(df$FI01_05a)
df$FI01_06a <- replaceFun(df$FI01_06a)
df$FI01_07a <- replaceFun(df$FI01_07a)
df$FI01_08a <- replaceFun(df$FI01_08a)
df$FI01_09a <- replaceFun(df$FI01_09a)
df$FI01_10a <- replaceFun(df$FI01_10a)
df$FI01_11a <- replaceFun(df$FI01_11a)
df$FI01_12a <- replaceFun(df$FI01_12a)
df$FI01_13a <- replaceFun(df$FI01_13a)
df$FI01_14a <- replaceFun(df$FI01_14a)
df$FI01_15a <- replaceFun(df$FI01_15a)

table(df$FI01_04)

# Make long format dataframe ----------------------------------------------

# Just rename the group of columns to work with the following code
# which was written at an earlier point in time 
vars_impDK <- orgvars_imp
vars_expDK <- orgvars_exp
vars_impDK_rl <- paste0("FI01_", sprintf('%0.2d', 2:15), "a")
vars_expDK_rl <- paste0("Fi02_", sprintf('%0.2d', 2:15), "a")

# Predictor columns
preds <- c("nsa", "polint", "lr", "male", "educ", "age")

# ----- Make the smaller wide-format dataframe 
dfw <- df[, c("id", "impDK", vars_impDK, vars_impDK_rl, preds)]

# Remove rows where impDK is missing, should be roughly 321 + 323 = 644 cases
dfw <- dfw[!is.na(dfw$impDK), ]

# Now the long-format data
dfl_item <- gather(data = dfw[, c(1:16, 31:36)], 
                   key = item, 
                   value = response, 
                   FI01_02:FI01_15, 
                   factor_key = TRUE)

dfl_rl <- gather(data = dfw[, c(1:2, 17:36)],
                 key = item, 
                 value = rl, 
                 FI01_02a:FI01_15a, 
                 factor_key = TRUE)

# Make item identifiers
dfl_rl$item <- substr(dfl_rl$item, 1, 7)

# Merge the data
dfl <- merge(dfl_item, dfl_rl, by = c("id", "item"))

# Remove duplicate columns
dfl <- dfl[, c(1:10, 18)]

# Rename columns 
names(dfl) <- c("id", "item", "exp", "nsa", "polint", "lr", "male", "educ", "age", "response", "rl")

table(dfl$exp, dfl$response)

# Make the response column back into a factor 
dfl$response <- ifelse(dfl$response == "don't know", 0, 
                       ifelse(dfl$response == "substantive", 1, NA))

dfl$response <- factor(dfl$response, levels = c(0, 1), labels = c("don't know", "substantive"))

# Add a dummy for FI (yes/no)
dfl$fi <- ifelse(dfl$item == "FI01_02" | 
                   dfl$item == "FI01_03" | 
                   dfl$item == "FI01_05" | 
                   dfl$item == "FI01_07" | 
                   dfl$item == "FI01_10" | 
                   dfl$item == "FI01_11" | 
                   dfl$item == "FI01_12" | 
                   dfl$item == "FI01_14", 0, 1)


# RL treatment ------------------------------------------------------------

# Remove outliers 2 sd above the median 
dfl$rl_out <- ifelse(dfl$rl >= median(na.omit(dfl$rl)) + 2*sd(na.omit(dfl$rl)), NA, dfl$rl)

# Divide the rl_out variable by 1000 for RL in seconds
dfl$rl_out <- dfl$rl_out/1000

# Make the ln RL column
dfl$rl_log <- log(dfl$rl_out)

# Make a column where RL > 15 are NA
dfl$rl_ext <- ifelse(dfl$rl_out > 15, NA, dfl$rl_out)

# ----- Create the RL cluster means (id)

# Here it is important to differentiate between the cluster means 
# for all 14 items, and the cluster means for just the 6 FI items. 

# For full list of items, not just FI 
rl_mAll <- aggregate(dfl$rl_out, by = list(dfl$id), FUN = mean)
names(rl_mAll) <- c("id", "rl_mAll")
dfl <- merge(dfl, rl_mAll, by = "id")

rl_log_mAll <- aggregate(dfl$rl_log, by = list(dfl$id), FUN = mean)
names(rl_log_mAll) <- c("id", "rl_log_mAll")
dfl <- merge(dfl, rl_log_mAll, by = "id")

rl_ext_mAll <- aggregate(dfl$rl_ext, by = list(dfl$id), FUN = mean)
names(rl_ext_mAll) <- c("id", "rl_ext_mAll")
dfl <- merge(dfl, rl_ext_mAll, by = "id")

# Just for the FI items 
dflJustFi <- dfl[dfl$fi == 1, ]

rl_m <- aggregate(dflJustFi$rl_out, by = list(dflJustFi$id), FUN = mean)
names(rl_m) <- c("id", "rl_m")
dfl <- merge(dfl, rl_m, by = "id")

rl_log_m <- aggregate(dflJustFi$rl_log, by = list(dflJustFi$id), FUN = mean)
names(rl_log_m) <- c("id", "rl_log_m")
dfl <- merge(dfl, rl_log_m, by = "id")

rl_ext_m <- aggregate(dflJustFi$rl_ext, by = list(dflJustFi$id), FUN = mean)
names(rl_ext_m) <- c("id", "rl_ext_m")
dfl <- merge(dfl, rl_ext_m, by = "id")


# Items factor for dummies ------------------------------------------------

# Turn item from character to numeric
dfl$item_num <- ifelse(dfl$item == "FI01_02", 1, 
                       ifelse(dfl$item == "FI01_03", 2, 
                              ifelse(dfl$item == "FI01_04", 3, 
                                     ifelse(dfl$item == "FI01_05", 4, 
                                            ifelse(dfl$item == "FI01_06", 5, 
                                                   ifelse(dfl$item == "FI01_07", 6, 
                                                          ifelse(dfl$item == "FI01_08", 7,
                                                                 ifelse(dfl$item == "FI01_09", 8, 
                                                                        ifelse(dfl$item == "FI01_10", 9, 
                                                                               ifelse(dfl$item == "FI01_11", 10, 
                                                                                      ifelse(dfl$item == "FI01_12", 11, 
                                                                                             ifelse(dfl$item == "FI01_13", 12, 
                                                                                                    ifelse(dfl$item == "FI01_14", 13, 
                                                                                                           ifelse(dfl$item == "FI01_15", 14, NA))))))))))))))

# Turn back into a factor 
dfl$item_fac <- factor(dfl$item_num, 
                       levels = seq(1, 14), 
                       labels = c("BW", "DWB", "EC", "UN", "CAA", "GP", "PETI", 
                                  "GNF", "BKA", "RLF", "KAF", "HSF", "WCA", "WSA"))


# Save data ---------------------------------------------------------------

saveRDS(df, file = "df.Rda")
saveRDS(dfl, file = "dfl.Rda")
write.table(dfl, file = "dfl.csv", sep = ",")

