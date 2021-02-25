
# Packages ----------------------------------------------------------------

library(tidyr)
library(dplyr)
library(car)
library(gt)
library( gridExtra)
library(ggeffects)
library(ggplot2)
library(lme4)

# Setup -------------------------------------------------------------------

# Set language to English 
Sys.setenv(LANG = "en")

# Start fresh
rm(list = ls())

# Set working directory 
setwd("D:/Henrik/Seafile/Meine Bibliothek/Henrik Jochen/Papers/SD Papers/SD Projekt Daten Henrik/Articles/Fictitious Issues/Analysis/Data") # PC Home
# setwd("D:/Seafile/Meine Bibliothek/Henrik Jochen/Papers/SD Papers/SD Projekt Daten Henrik/Articles/Fictitious Issues/Analysis/Data")

# Read the csv file
df <- read.csv("sdData_v01.csv")

# Can't seem to rename X, instead, make new duplicate id column 
df$id <- df$X

# Remove rows where they did not make it past page 1
df <- df[df$MAXPAGE != 1, ]


# Experimental designs ----------------------------------------------------

# Make implicit/explict DK column 

df$impDK <- ifelse(!is.na(df$FI01_04) | !is.na(df$FI01_06) | !is.na(df$FI01_08) | !is.na(df$FI01_09) | !is.na(df$FI01_13) | !is.na(df$FI01_15), 1,
                   ifelse(!is.na(df$FI02_04) | !is.na(df$FI02_06) | !is.na(df$FI02_08) | !is.na(df$FI02_09) | !is.na(df$FI02_13) | !is.na(df$FI02_15), 0, NA))

df$impDK <- factor(df$impDK, levels = c(0, 1), labels = c("explicit DK", "implicit DK"))

# Recoding ----------------------------------------------------------------

# ----- Sex 

df$male <- df$DG02

# Make numeric variable
df$male <- as.numeric(ifelse(df$male == "maennlich", 1, 
                  ifelse(df$male == "weiblich", 0, NA)))
# Turn back into factor 
df$male <- factor(df$male, levels = c(0, 1), labels = c("female", "male"))

# ----- Date of birth and age

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


# ----- Nationality

# German 
df$german <- df$DG05
df$german <- ifelse(df$german == "die deutsche und eine andere Staatsangehoerigkeit" | df$german == "nur die deutsche Staatsangehoerigkeit", 1, 0)
df$german <- factor(df$german, levels = c(0, 1), labels = c("no German citizenship", "German citizenship"))

# German w/ migration background
df$gerMigr <- df$DG05
df$gerMigr <- ifelse(df$gerMigr == "die deutsche und eine andere Staatsangehoerigkeit", 1, 0)
df$gerMigr <- factor(df$gerMigr, levels = c(0, 1), labels = c("foreign or only German", "German with migration background"))

# ----- Education 

table(df$DG08)
df$educ <- df$DG08
df$educ <- ifelse(df$educ == "ohne Abschluss von der Schule gegangen", 1,
                  ifelse(df$educ == "(qualifizierter/erweiterter) Hauptschulabschluss / Volksschulabschluss / Polytechnische Oberschule (POS) Abschluss 8. Klasse (DDR-Abschluss)", 2, 
                         ifelse(df$educ == "Realschulabschluss / Mittlere Reife / Fachhochschulreife / Polytechnische Oberschule (POS) 10. Klasse (DDR-Abschluss)", 3, 
                                ifelse(df$educ == "Fachhochschulreife", 4, 
                                       ifelse(df$educ == "Abitur / Hochschulreife / Fachabitur / Erweiterte Oberschule (EOS) (DDR-Abschluss)", 5, NA)))))

df$educ <- factor(df$educ, levels = c(1, 2, 3, 4, 5), labels = c("no degree", "Hauptschule", "Realschule", "Fachhochschulreife", "Abitur"))
table(df$educ)
df$educ <- relevel(df$educ, ref = "Hauptschule")
table(df$educ)
# No degree has just 14 cases, drop it because it is causing problems with 
# caluclation AME
df$educ <- ifelse(df$educ == "no degree", NA, df$educ)
df$educ <- factor(df$educ, levels = c(1, 3, 4, 5), labels = c("Hauptschule", "Realschule", "Fachhochschulreife", "Abitur"))
table(df$educ)
df$educ <- relevel(df$educ, ref = "Hauptschule")

# ----- Political interest

df$polint <- df$DQ04_01
df$polint <- ifelse(df$polint > 1, df$polint, NA)

# ----- Links-Rechts

df$lr <- df$DQ05_01
df$lr <- ifelse( df$lr > 1, df$lr, NA)
attr(df$lr, "1") = "sehr links"
attr(df$lr, "11") = "sehr rechts"

# ----- NSA

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

# After recoding, higher scores mean more NSA.  

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

# Use lappy to apply the functions to all of the FI items.
# This could be extended to the non-fictional items as well,
# then it would be 
# df[c(which(colnames(df) == "FI01_02"):which(colnames(df) == "FI01_15"))]

orgvars_imp <- paste0("FI01_", sprintf('%0.2d', 2:15))
df[orgvars_imp] <- lapply(df[orgvars_imp], recodeFun)

# df[c(which(colnames(df) == "FI01_04"), 
#      which(colnames(df) == "FI01_06"),
#      which(colnames(df) == "FI01_08"),
#      which(colnames(df) == "FI01_09"),
#      which(colnames(df) == "FI01_13"),
#      which(colnames(df) == "FI01_15"))] <- lapply(df[c(which(colnames(df) == "FI01_04"), 
#                                                        which(colnames(df) == "FI01_06"),
#                                                        which(colnames(df) == "FI01_08"),
#                                                        which(colnames(df) == "FI01_09"),
#                                                        which(colnames(df) == "FI01_13"),
#                                                        which(colnames(df) == "FI01_15"))], recodeFun)

orgvars_exp <- paste0("FI02_", sprintf('%0.2d', 2:15))
df[orgvars_exp] <- lapply(df[orgvars_exp], recodeFun)

# Now to the "don't know" split 
# df[c(which(colnames(df) == "FI02_04"), 
#      which(colnames(df) == "FI02_06"),
#      which(colnames(df) == "FI02_08"),
#      which(colnames(df) == "FI02_09"),
#      which(colnames(df) == "FI02_13"),
#      which(colnames(df) == "FI02_15"))] <- lapply(df[c(which(colnames(df) == "FI02_04"), 
#                                                        which(colnames(df) == "FI02_06"),
#                                                        which(colnames(df) == "FI02_08"),
#                                                        which(colnames(df) == "FI02_09"),
#                                                        which(colnames(df) == "FI02_13"),
#                                                        which(colnames(df) == "FI02_15"))], recodeFun_dk)



# ----- Recode positive + negative to substantive

recodeFun2 <- function(x) {
  y = ifelse(x == "positively" | x == "negatively", 1, 
             ifelse(x == "don't recognize" | x == "continue", 0, NA))
  y = factor(y, levels = c(0, 1), labels = c("don't know", "substantive"))
  return(y)
}

df[orgvars_imp] <- lapply(df[orgvars_imp], recodeFun2)

# df[c(which(colnames(df) == "FI01_04"), 
#      which(colnames(df) == "FI01_06"),
#      which(colnames(df) == "FI01_08"),
#      which(colnames(df) == "FI01_09"),
#      which(colnames(df) == "FI01_13"),
#      which(colnames(df) == "FI01_15"))] <- lapply(df[c(which(colnames(df) == "FI01_04"), 
#                                                        which(colnames(df) == "FI01_06"),
#                                                        which(colnames(df) == "FI01_08"),
#                                                        which(colnames(df) == "FI01_09"),
#                                                        which(colnames(df) == "FI01_13"),
#                                                        which(colnames(df) == "FI01_15"))], recodeFun2)



# df[c(which(colnames(df) == "FI02_04"), 
#      which(colnames(df) == "FI02_06"),
#      which(colnames(df) == "FI02_08"),
#      which(colnames(df) == "FI02_09"),
#      which(colnames(df) == "FI02_13"),
#      which(colnames(df) == "FI02_15"))] <- lapply(df[c(which(colnames(df) == "FI02_04"), 
#                                                        which(colnames(df) == "FI02_06"),
#                                                        which(colnames(df) == "FI02_08"),
#                                                        which(colnames(df) == "FI02_09"),
#                                                        which(colnames(df) == "FI02_13"),
#                                                        which(colnames(df) == "FI02_15"))], recodeFun2)


# Fictitious issues -------------------------------------------------------

# ----- Basic individual tables 

table(df$FI01_02)
table(df$FI02_02)

# ... 

table(df$FI01_04)
table(df$FI02_04)

table(df$FI01_06)
table(df$FI02_06)

table(df$FI01_08)
table(df$FI02_08)

table(df$FI01_09)
table(df$FI02_09)

table(df$FI01_13)
table(df$FI02_13)

table(df$FI01_15)
table(df$FI02_15)

# Merge the FI implicit/explicit columns ----------------------------------

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

# Combine explicit/implicit DK columns
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


# Here they are still factors 
str(df$FI01_04)

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


# Make long-format df -----------------------------------------------------

# vars_impDK <- c("FI01_04", "FI01_06", "FI01_08", "FI01_09", "FI01_13", "FI01_15")
# vars_expDK <- c("FI02_04", "FI02_06", "FI02_08", "FI02_09", "FI02_13", "FI02_15")

vars_impDK <- orgvars_imp
vars_expDK <- orgvars_exp
 
# vars_impDK_rl <- c("FI01_04a", "FI01_06a", "FI01_08a", "FI01_09a", "FI01_13a", "FI01_15a")
# vars_expDK_rl <- c("FI02_04a", "FI02_06a", "FI02_08a", "FI02_09a", "FI02_13a", "FI02_15a")

vars_impDK_rl <- paste0("FI01_", sprintf('%0.2d', 2:15), "a")
vars_expDK_rl <- paste0("Fi02_", sprintf('%0.2d', 2:15), "a")

preds <- c("nsa", "polint", "lr", "male", "educ", "age")

dfw <- df[, c("id", "impDK", vars_impDK, vars_impDK_rl, preds)]

# Remove rows where impDK is missing, should be roughly 321 + 323 = 644 cases
dfw <- dfw[!is.na(dfw$impDK), ]

head(dfw)

dfl_item <- gather(data = dfw[, c(1:16, 31:36)], 
                   key = item, 
                   value = response, 
                   FI01_02:FI01_15, 
                   factor_key = TRUE)

head(dfl_item[order(dfl_item$id),], n = 30)
length(dfl_item$id)

dfl_rl <- gather(data = dfw[, c(1:2, 17:36)],
                 key = item, 
                 value = rl, 
                 FI01_02a:FI01_15a, 
                 factor_key = TRUE)

dfl_rl$item <- substr(dfl_rl$item, 1, 7)
length(dfl_rl$id)

head(dfl_rl[order(dfl_rl$id),], n = 30)


# No longer factors... 

dfl <- merge(dfl_item, dfl_rl, by = c("id", "item"))
head(dfl, n = 30)
length(dfl$id)

dfl <- dfl[, c(1:10, 18)]
head(dfl, n = 30)

names(dfl) <- c("id", "item", "exp", "nsa", "polint", "lr", "male", "educ", "age", "response", "rl")

head(dfl)
str(dfl$response)

dfl$response <- ifelse(dfl$response == "don't know", 0, 
                       ifelse(dfl$response == "substantive", 1, NA))

dfl$response <- factor(dfl$response, levels = c(0, 1), labels = c("don't know", "substantive"))


# FI dummy ----------------------------------------------------------------

dfl$fi <- ifelse(dfl$item == "FI01_02" | dfl$item == "FI01_03" | dfl$item == "FI01_05" | dfl$item == "FI01_07" | dfl$item == "FI01_10" | dfl$item == "FI01_11" | dfl$item == "FI01_12" | dfl$item == "FI01_14", 0, 1)
head(dfl)

# Outliers ----------------------------------------------------------------

dfl$rl_out <- ifelse(dfl$rl >= median(na.omit(dfl$rl)) + 2*sd(na.omit(dfl$rl)), NA, dfl$rl)

dfl$rl_out <- dfl$rl_out/1000
hist(dfl$rl_out)
min(na.omit(dfl$rl_out)); max(na.omit(dfl$rl_out))
# Remove observations with RL longer than 3 minutes = 3*60 = 180 secs = 180*1000 = 180000 millsecs
#dfl$rl_firstTreat <- ifelse(dfl$rl >= 180000, NA, dfl$rl)

# Turn into seconds 
#dfl$rl_firstTreat <- dfl$rl_firstTreat/1000

# dfl <- dfl[dfl$rl < 180000, ]

# Either eliminate values greater than mean + 2*sd
#mean(na.omit(dfl$rl_firstTreat))
#sd(na.omit(dfl$rl_firstTreat))
#dfl$rl_out <- ifelse(dfl$rl_firstTreat > mean(na.omit(dfl$rl_firstTreat)) + 
#                       2*sd(na.omit(dfl$rl_firstTreat)), NA, dfl$rl_firstTreat)

#plot(dfl$rl_firstTreat)
plot(dfl$rl_out)
#hist(dfl$rl_firstTreat)
hist(dfl$rl_out)

# Or take the log of rl
dfl$rl_log <- log(dfl$rl_out)
hist(dfl$rl_log)
plot(dfl$rl_log)

max(na.omit(dfl$rl_log))
exp(5.71)

# Extreme outlier treatment, no Rls longer than 15 secs
dfl$rl_ext <- ifelse(dfl$rl_out > 15, NA, dfl$rl_out)


# Add the IV means --------------------------------------------------------

# ----- For full list of all items, not just FI!!! 

rl_mAll <- aggregate(dfl$rl_out, by = list(dfl$id), FUN = mean)
names(rl_mAll) <- c("id", "rl_mAll")
head(rl_mAll)
dfl <- merge(dfl, rl_mAll, by = "id")
head(dfl, n = 30)

rl_log_mAll <- aggregate(dfl$rl_log, by = list(dfl$id), FUN = mean)
names(rl_log_mAll) <- c("id", "rl_log_mAll")
dfl <- merge(dfl, rl_log_mAll, by = "id")

head(dfl, n = 60)

rl_ext_mAll <- aggregate(dfl$rl_ext, by = list(dfl$id), FUN = mean)
names(rl_ext_mAll) <- c("id", "rl_ext_mAll")
dfl <- merge(dfl, rl_ext_mAll, by = "id")

# ----- For just the FI items!!!

dflJustFi <- dfl[dfl$fi == 1, ]

rl_m <- aggregate(dflJustFi$rl_out, by = list(dflJustFi$id), FUN = mean)
names(rl_m) <- c("id", "rl_m")
head(rl_m)
dfl <- merge(dfl, rl_m, by = "id")
head(dfl, n = 30)

rl_log_m <- aggregate(dflJustFi$rl_log, by = list(dflJustFi$id), FUN = mean)
names(rl_log_m) <- c("id", "rl_log_m")
dfl <- merge(dfl, rl_log_m, by = "id")

head(dfl, n = 60)

rl_ext_m <- aggregate(dflJustFi$rl_ext, by = list(dflJustFi$id), FUN = mean)
names(rl_ext_m) <- c("id", "rl_ext_m")
dfl <- merge(dfl, rl_ext_m, by = "id")

# Item means --------------------------------------------------------------

dfl$response_num <- as.numeric(dfl$response) - 1
head(dfl$response_num, n = 30)
item_m <- aggregate(dfl$response_num, by = list(dfl$item), FUN = mean, na.rm = TRUE)

names(item_m) <- c("item", "item_m")
head(item_m, n = 10)

dfl <- merge(dfl, item_m, by = "item")

head(dfl)

# Item dummies

table(dfl$item)

# dfl$ec <- ifelse(dfl$item == "FI01_04", 1, 0)
# dfl$caa <- ifelse(dfl$item == "FI01_06", 1, 0)
# dfl$peti <- ifelse(dfl$item == "FI01_08", 1, 0)
# dfl$gnf <- ifelse(dfl$item == "FI01_09", 1, 0)
# dfl$hsf <- ifelse(dfl$item == "FI01_13", 1, 0)
# dfl$wsa <- ifelse(dfl$item == "FI01_15", 1, 0)

str(dfl$item)

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

dfl$item_fac <- factor(dfl$item_num, levels = seq(1, 14), labels = c("BW", "DWB", "EC", "UN", "CAA", "GP", "PETI", "GNF", "BKA", "RLF", "KAF", "HSF", "WCA", "WSA"))

table(dfl$item); table(dfl$item_fac)

head(dfl, n = 30)

# Save data ---------------------------------------------------------------

saveRDS(dfl, file = "dfl.Rda")
write.table(dfl, file = "dfl.csv", sep = ",")

# Long format logistic regression -----------------------------------------

#library(rms)
library(lme4)
library(texreg)
library(margins)
library(miceadds)
library(sandwich)
library(lmtest)

# Select just the FI items 

dfl <- dfl[dfl$fi == 1, ]

# ----- Normal SEs
m1 <- glm(response ~ rl_out + rl_m + exp + nsa + polint + lr + male + educ + age, 
          data = dfl, family = binomial(link = "logit"))
summary(m1)
m2 <- glm(response ~ rl_log + rl_log_m + exp + nsa + polint + lr + male + educ + age, 
          data = dfl, family = binomial(link = "logit"))

# ----- Robust 

# Probit regression with RL no outliers and cluster means for baseline speed
m1r <- miceadds::glm.cluster(response ~ rl_out + rl_m + exp + nsa + polint + lr + male + educ + age, 
                             cluster = c("id"), data = dfl, family = binomial(link = "logit"))

# Probit regression with log(RL) and cluster means for baseline speed
m2r <- miceadds::glm.cluster(response ~ rl_log + rl_log_m + exp + nsa + polint + lr + male + educ + age, 
                             cluster = c("id"), data = dfl, family = binomial(link = "logit"))

#texreg(c(extract(m1r), extract(m2r)))

# Average marginal effects
plot(margins(m1, vcov = vcovCL(m1, cluster = dfl$id, type = "HC0", fix = TRUE)))

ame <- data.frame(summary(margins(m1, vcov = vcovCL(m1, cluster = dfl$id, type = "HC0", fix = TRUE))))

ame

ggplot(ame, aes(x = factor, y = AME)) + 
  geom_hline(yintercept = 0, color = "grey") + 
  geom_pointrange(aes(ymin = lower, ymax = upper)) + 
  scale_y_continuous(limits = c(-0.2, 0.5), breaks = seq(-0.2, 0.5, 0.1)) + 
  labs(y = "Average marginal effect", x = "Item") + 
  scale_x_discrete(labels = c("Age", "Abitur", "F.Hochschulreife", "Realschule", "Implicit DK", "Pol. Orient.", "Male", "Need soc. approv.", "Pol. Int.", "RL (cluster mean)", "RL")) +
  theme_classic() + 
  coord_flip()

hist(dfl$rl_log_m)

cor(dfl$rl_log_m, as.numeric(dfl$response), use = "pairwise")

plot(dfl$rl_log_m, dfl$response)

# Pr(y = 1|x) means the probability that someone gives a pseudo opinion 

# Logistic regression with robust standard errors 
#install.packages("sandwich")
#library(sandwich)

library(miceadds)

m1br <- miceadds::glm.cluster(response ~ rl_out + rl_m + exp + nsa + polint + lr + male + educ + age, 
                              cluster = "id", data = dfl, family = binomial(link = "logit"))
summary(m1br)

lr_m1 <- glm(response ~ rl_out + exp + nsa + polint + lr + male + educ + age, 
              data = dfl, family = binomial(link = "logit"))
summary(lr_m1)

# install.packages("rms")
library(rms)
# install.packages("Hmisc")
install.packages("backports")

lr_m1_b <- lrm(response ~ rl_out + exp + nsa + polint + lr + male + educ + age, 
               x = T, y = T, data = dfl)
lr_m1_b
lr_m1_brob <- robcov(lr_m1_b, cluster = dfl$id)
lr_m1_brob

library(texreg)

texreg(extract(lr_m1_brob))

# Multilevel logistic regression model 
lr_m1 <- glmer(response ~ rl_out + rl_m + exp + nsa + polint + lr + male + educ + age + (1 + rl_out | id) + (1 | item), 
             data = dfl, family = binomial(link = "logit"))
summary(lr_m1)



lr_m2 <- glmer(response ~ rl_log + exp + nsa + polint + lr + male + educ + age + (1 | id), 
             data = dfl, family = binomial(link = "logit"))
summary(lr_m2)


# FE, Correlated random effects probit model 
pr_m1 <- glmer(response ~ rl_out + rl_m + (1 | id), 
             data = dfl, family = binomial(link = "probit"))
summary(pr_m1)

pr_m1 <- glmer(response ~ rl_log + rl_m + (1 | id), 
               data = dfl, family = binomial(link = "probit"))
summary(pr_m1)

# Plots -------------------------------------------------------------------

# ----- Predicted probabilities

# log(rl)

pred_rl <- ggpredict(lr_m2, terms = c("rl_log [all]", "exp"))
pred_rl

ggplot(pred_rl, aes(x = x, y = predicted, color = group)) + 
  geom_line() + 
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = 0.1) + 
  scale_color_discrete(name = "Experimental group", labels = c("Don't know explicit", "Don't know implicit")) + 
  labs(x = "log(response latency)", y = "Predicted probability of giving a pseudo opinion") + 
  ggtitle("M1") + 
  theme_light()

# nsa 

pred_nsa <- ggpredict(lr_m2, terms = c("nsa [all]", "exp"))
pred_nsa

ggplot(pred_nsa, aes(x = x, y = predicted, color = group)) + 
  geom_line() + 
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = 0.1) + 
  scale_color_discrete(name = "Experimental group", labels = c("Don't know explicit", "Don't know implicit")) + 
  labs(x = "Need for social approval", y = "Predicted probability of giving a pseudo opinion") + 
  ggtitle("M1") + 
  theme_light()

# polint

pred_polint <- ggpredict(lr_m2, terms = c("polint [all]", "exp"))
pred_polint

ggplot(pred_polint, aes(x = x, y = predicted, color = group)) + 
  geom_line() + 
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = 0.1) + 
  scale_color_discrete(name = "Experimental group", labels = c("Don't know explicit", "Don't know implicit")) + 
  labs(x = "Political interest", y = "Predicted probability of giving a pseudo opinion") + 
  ggtitle("M1") + 
  theme_light()

# lr

pred_lr <- ggpredict(lr_m2, terms = c("lr [all]", "exp"))
pred_lr

ggplot(pred_lr, aes(x = x, y = predicted, color = group)) + 
  geom_line() + 
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = 0.1) + 
  scale_color_discrete(name = "Experimental group", labels = c("Don't know explicit", "Don't know implicit")) + 
  labs(x = "Political orientation (1: left, 11: right)", y = "Predicted probability of giving a pseudo opinion") + 
  ggtitle("M1") + 
  theme_light()

# male

pred_male <- ggpredict(lr_m2, terms = c("male", "exp"))
pred_male

ggplot(pred_male, aes(x = x, y = predicted, color = group)) + 
  geom_point(position = position_dodge(0.1)) + 
  geom_errorbar(
    aes(ymin = conf.low, ymax = conf.high), 
    position = position_dodge(0.1)
  ) + 
  scale_x_discrete() + 
  scale_color_discrete(name = "Experimental group", labels = c("Don't know explicit", "Don't know implicit")) + 
  labs(x = "Sex", y = "Predicted probability of giving a pseudo opinion") + 
  ggtitle("M1") + 
  theme_light()

# educ

pred_educ <- ggpredict(lr_m2, terms = c("educ", "exp"))
pred_educ

ggplot(pred_educ, aes(x = x, y = predicted, color = group)) + 
  geom_point(position = position_dodge(0.1)) + 
  geom_errorbar(
    aes(ymin = conf.low, ymax = conf.high), 
    position = position_dodge(0.1)
  ) + 
  scale_x_discrete() + 
  scale_color_discrete(name = "Experimental group", labels = c("Don't know explicit", "Don't know implicit")) + 
  labs(x = "Education level", y = "Predicted probability of giving a pseudo opinion") + 
  ggtitle("M1") + 
  theme_light()

# age

pred_age <- ggpredict(lr_m2, terms = c("age [all]", "exp"))
pred_age

ggplot(pred_age, aes(x = x, y = predicted, color = group)) + 
  geom_line() + 
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = 0.1) + 
  scale_color_discrete(name = "Experimental group", labels = c("Don't know explicit", "Don't know implicit")) + 
  labs(x = "Age", y = "Predicted probability of giving a pseudo opinion") + 
  ggtitle("M1") + 
  theme_light()


# ----- gt table

tableFun <- function(x) {
  tabColMarg <- as.data.frame(addmargins(table(x)))
  tabColProp <- as.data.frame(addmargins(prop.table(table(x))))
  tabdf <- cbind(tabColMarg, tabColProp[2:ncol(tabColProp)])
  return(tabdf)
}

tabledf <- as.data.frame(lapply(df[c("FI01_04", "FI01_06", "FI01_08", "FI01_09", "FI01_13", "FI01_15")], tableFun))
tabledf <- tabledf[ , c(1:3, 5, 6, 8, 9, 11, 12, 14, 15, 17, 18)]
colnames(tabledf) <- c("Response", 
                       "FI01_04 Freq", "FI01_04 Prop", 
                       "FI01_06 Freq", "FI01_06 Prop", 
                       "FI01_08 Freq", "FI01_08 Prop", 
                       "FI01_09 Freq", "FI01_09 Prop", 
                       "FI01_13 Freq", "FI01_13 Prop", 
                       "FI01_15 Freq", "FI01_15 Prop")

tabledf_dk <- as.data.frame(lapply(df[c("FI02_04", "FI02_06", "FI02_08", "FI02_09", "FI02_13", "FI02_15")], tableFun))
tabledf_dk <- tabledf_dk[ , c(1:3, 5, 6, 8, 9, 11, 12, 14, 15, 17, 18)]
colnames(tabledf_dk) <- c("Response", 
                          "FI02_04 Freq", "FI02_04 Prop", 
                          "FI02_06 Freq", "FI02_06 Prop", 
                          "FI02_08 Freq", "FI02_08 Prop", 
                          "FI02_09 Freq", "FI02_09 Prop", 
                          "FI02_13 Freq", "FI02_13 Prop", 
                          "FI02_15 Freq", "FI02_15 Prop")

# Potentially rbind the two 
colnames(tabledf_dk) <- c("Response", 
                          "FI01_04 Freq", "FI01_04 Prop", 
                          "FI01_06 Freq", "FI01_06 Prop", 
                          "FI01_08 Freq", "FI01_08 Prop", 
                          "FI01_09 Freq", "FI01_09 Prop", 
                          "FI01_13 Freq", "FI01_13 Prop", 
                          "FI01_15 Freq", "FI01_15 Prop")

tabledf <- rbind(tabledf, tabledf_dk)
tabledf$ex <- c(rep("Don't know implicit", 4), rep("Don't know explicit", 5))

gt_fi_table <- tabledf %>%
  gt(groupname_col = "ex") %>%
  tab_spanner(label = "Environmental Court", columns = matches("FI01_04 Freq|FI01_04 Prop")) %>%
  tab_spanner(label = "Coastal Aid Agency", columns = matches("FI01_06 Freq|FI01_06 Prop")) %>%
  tab_spanner(label = "Prague Energy Transition Initiative", columns = matches("FI01_08 Freq|FI01_08 Prop")) %>%
  tab_spanner(label = "German Nuclear Forum", columns = matches("FI01_09 Freq|FI01_09 Prop")) %>%
  tab_spanner(label = "Herbert-Schmaar-Foundation", columns = matches("FI01_13 Freq|FI01_13 Prop")) %>%
  tab_spanner(label = "World Space Agency", columns = matches("FI01_15 Freq|FI01_15 Prop")) %>%
  cols_label(
    "FI01_04 Freq" = "Freq", 
    "FI01_06 Freq" = "Freq", 
    "FI01_08 Freq" = "Freq",
    "FI01_09 Freq" = "Freq",
    "FI01_13 Freq" = "Freq",
    "FI01_15 Freq" = "Freq",
    "FI01_04 Prop" = "Prop", 
    "FI01_06 Prop" = "Prop", 
    "FI01_08 Prop" = "Prop",
    "FI01_09 Prop" = "Prop",
    "FI01_13 Prop" = "Prop",
    "FI01_15 Prop" = "Prop",
  ) %>%
  fmt_number(columns = vars("FI01_04 Prop", "FI01_06 Prop", "FI01_08 Prop", "FI01_09 Prop", "FI01_13 Prop", "FI01_15 Prop"), decimals = 2)
gt_fi_table

# Save the table 
gtsave(gt_fi_table, "gt_fi_table.html")
