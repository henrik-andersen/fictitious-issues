### 
# Title: Data preparation pseudo opinions paper
# Author: Henrik Andersen 
# Date begun: 04.08.2020 
###


# Setup -------------------------------------------------------------------

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


# Data --------------------------------------------------------------------

# Set the working directory
setwd("./data")

# Read the data 
df <- read.csv("sdData_v01.csv")

# Remove screen-outs
df <- df[df$QUESTNNR != "screen", ]


# Data preparation --------------------------------------------------------

# ----- Questionnaire version

# Change from character to factor 
df$version <- ifelse(df$QUESTNNR == "DQ", 1, 
                     ifelse(df$QUESTNNR == "LL", 2, 
                            ifelse(df$QUESTNNR == "SL", 3, NA)))
df$version <- factor(df$version, levels = c(1, 2, 3), labels = c("DQ", "LL", "SL"))
df$version <- relevel(df$version, ref = "SL") # Set SL to reference category 


# ----- Faking instructions

# Change from integer to factor 
df$faking <- ifelse(df$FG01 == 1, 1, 
                    ifelse(df$FG01 == 2, 2, 
                           ifelse(df$FG01 == 3 | df$FG01 == 4, 3, NA)))
df$faking <- factor(df$faking, levels = c(1, 2, 3), labels = c("faking good", "faking bad", "no faking"))
df$faking <- relevel(df$faking, ref = "faking bad")

# Only respondents in DQ received faking instructions. 
# This means the SL and LL respondents are all non-fakers. 
df$faking[df$version == "LL"] <- "no faking"
df$faking[df$version == "SL"] <- "no faking"

# ----- Sociodemographics

# Make a dummy for sex, with male = 1
df$male <- ifelse(df$DG02 == "maennlich", 1, 
                  ifelse(df$DG02 == "weiblich", 0, NA))
df$male <- factor(df$male, levels = c(0, 1), labels = c("female", "male"))

# Year of birth 
df$yob <- df$DG03_01

# Get rid of implausible or uncertain entries 
df$yob[df$yob == "-1983" | 
         df$yob == "1067" | 
         df$yob == "1874" | 
         df$yob == "1884" | 
         df$yob == "191"  | 
         df$yob == "1067" | 
         df$yob == "200" | 
         df$yob == "2983"] <- NA

# Fix entries where the respondent added a space after the year 
df$yob[df$yob == "1957 "] <- 1957
df$yob[df$yob == "1959 "] <- 1959
df$yob[df$yob == "1961 "] <- 1961
df$yob[df$yob == "1962 "] <- 1962
df$yob[df$yob == "1964 "] <- 1964
df$yob[df$yob == "1967 "] <- 1967
df$yob[df$yob == "1968 "] <- 1968
df$yob[df$yob == "1972 "] <- 1972
df$yob[df$yob == "1973 "] <- 1973
df$yob[df$yob == "1975 "] <- 1975
df$yob[df$yob == "1991 "] <- 1991
df$yob[df$yob == "9.2.1980"] <- 1980

# Turn yob into numeric 
df$yob <- as.numeric(df$yob)

# Recode the plausible entries where respondent entered age instead of yob
df$yob <- ifelse(df$yob < 1943, 2020 - df$yob, df$yob)

# Turn nationality into dummy with German = 1
df$german <- ifelse(df$DG05 == "nur die deutsche Staatsangehoerigkeit" | 
                      df$DG05 == "die deutsche und eine andere Staatsangehoerigkeit", 1, 
                    ifelse(df$DG05 == "eine andere Staatsangehoerigkeit", 0, NA))
df$german <- factor(df$german, levels = c(0, 1), labels = c("not German", "German"))

# Turn education into a factor variable 
df$educ <- ifelse(df$DG08 == "ohne Abschluss von der Schule gegangen", 1, 
                  ifelse(df$DG08 == "(qualifizierter/erweiterter) Hauptschulabschluss / Volksschulabschluss / Polytechnische Oberschule (POS) Abschluss 8. Klasse (DDR-Abschluss)", 2, 
                         ifelse(df$DG08 == "Realschulabschluss / Mittlere Reife / Fachhochschulreife / Polytechnische Oberschule (POS) 10. Klasse (DDR-Abschluss)", 3, 
                                ifelse(df$DG08 == "Fachhochschulreife", 4, 
                                       ifelse(df$DG08 == "Abitur / Hochschulreife / Fachabitur / Erweiterte Oberschule (EOS) (DDR-Abschluss)", 5, NA)))))
df$educ <- factor(df$educ, levels = 1:5, labels = c("no degree", "Hauptschule", "Realschule", "Fachhochschulreife", "Abitur"))
df$educ <- relevel(df$educ, ref = "Abitur")

# Political interest
df$polint <- ifelse(df$DQ04_01 < 1, NA, df$DQ04_01)

# Left-right
df$lr <- ifelse(df$DQ05_01 < 1, NA, df$DQ05_01)


# Xenophobia items --------------------------------------------------------

# Make new column names 
# x: xenophobie
# letter: group (m = muslim, w = women, h = homosexual, etc.)
# number: item number
# a: response latency variable identifier 
xeno  <- c(rep("x", 35))
group <- c(rep("m", 7), 
           rep("w", 4), 
           rep("h", 4), 
           rep("j", 4), 
           rep("f", 4), 
           rep("r", 4), 
           rep("d", 4), 
           rep("o", 4))
ident <- c(seq(1, 7, 1), 
           rep(seq( 1, 4, 1), 7))

varnames <- paste0(xeno, group, ident)
varnamesrl <- paste0(varnames, "a")

# Create new placeholder columns 
df[ , varnames] <- NA
df[ , varnamesrl] <- NA

# Replace NAs in empty columns with the values for no faking 
df[ , varnames] <- df[ , seq(which(colnames(df) == "XP33_02"), which(colnames(df) == "XP33_36"), 2)]
df[ , varnamesrl] <- df[ , seq(which(colnames(df) == "XP33_02a"), which(colnames(df) == "XP33_36a"), 2)]

# Do the same with the faking good and faking bad columns 
fakegood <- paste0(varnames, "fg")
fakebad <- paste0(varnames, "fb")

df[ , fakegood] <- NA
df[ , fakebad] <- NA

df[ , fakegood] <- df[ , seq(which(colnames(df) == "XP34_02"), which(colnames(df) == "XP34_36"), 2)]
df[ , fakebad] <- df[ , seq(which(colnames(df) == "XP35_02"), which(colnames(df) == "XP35_36"), 2)]

fakegoodrl <- paste0(varnames, "a", "fg")
fakebadrl <- paste0(varnames, "a", "fb")

df[ , fakegoodrl] <- NA
df[ , fakebadrl] <- NA

df[ , fakegoodrl] <- df[ , seq(which(colnames(df) == "XP34_02a"), which(colnames(df) == "XP34_36a"), 2)]
df[ , fakebadrl] <- df[ , seq(which(colnames(df) == "XP35_02a"), which(colnames(df) == "XP35_36a"), 2)]

# Have to turn all the columns into numeric 
numColFunc <- function(x) {
  x <- ifelse(x == "5 stimme voll und ganz zu", 5, 
              ifelse(x == "4", 4, 
                     ifelse(x == "3", 3, 
                            ifelse(x == "2", 2, 
                                   ifelse(x == "1 stimme gar nicht zu", 1, NA)))))
  return(x)
}

# Apply the function to all the varnames (xenophobia) columns 
df[ , varnames] <- lapply(df[ , varnames], numColFunc)
df[ , fakegood] <- lapply(df[ , fakegood], numColFunc)
df[ , fakebad] <- lapply(df[ , fakebad], numColFunc)

#setDT(df)
#table(df$faking, df$xm1)
#for(j in seq_along(fakegood)) {
#  set(df, i = which(is.na(df[[varnames[j]]])), j = varnames[j],
#      value = df[[fakegood[j]]][is.na(df[[varnames[j]]])])
#}
#table(df$faking, df$xm1)
#for(j in seq_along(fakebad)) {
#  set(df, i = which(is.na(df[[varnames[j]]])), j = varnames[j],
#      value = df[[fakebad[j]]][is.na(df[[varnames[j]]])])
#}
#table(df$faking, df$xm1)

# The following function tries to replace NAs in the no faking group 
# first with the corresponding faking good column, i.e., try to 
# replace NA in column xm1 with value in column xm1fg. 
# If that doesn't work, try to replace it with the value in the 
# faking bad column, i.e., if still NA, then try to replace 
# xm1 with xm1fb 

replaceFunc <- function(x) {
  nameofx <- deparse(substitute(x))
  x <- ifelse(is.na(x), eval(parse(text = paste0(nameofx, "fg"))), x)
  x <- ifelse(is.na(x), eval(parse(text = paste0(nameofx, "fb"))), x)
  return(x)
}

# The function works on specific columns, but lapply isn't working
# when I try to apply it to the whole set of columns. 
# This is ugly, but the only way I know how to do it for now. 

df$xm1 <- replaceFunc(df$xm1)
df$xm2 <- replaceFunc(df$xm2)
df$xm3 <- replaceFunc(df$xm3)
df$xm4 <- replaceFunc(df$xm4)

df$xw1 <- replaceFunc(df$xw1)
df$xw2 <- replaceFunc(df$xw2)
df$xw3 <- replaceFunc(df$xw3)
df$xw4 <- replaceFunc(df$xw4)

df$xh1 <- replaceFunc(df$xh1)
df$xh2 <- replaceFunc(df$xh2)
df$xh3 <- replaceFunc(df$xh3)
df$xh4 <- replaceFunc(df$xh4)

df$xj1 <- replaceFunc(df$xj1)
df$xj2 <- replaceFunc(df$xj2)
df$xj3 <- replaceFunc(df$xj3)
df$xj4 <- replaceFunc(df$xj4)

df$xf1 <- replaceFunc(df$xf1)
df$xf2 <- replaceFunc(df$xf2)
df$xf3 <- replaceFunc(df$xf3)
df$xf4 <- replaceFunc(df$xf4)

df$xr1 <- replaceFunc(df$xr1)
df$xr2 <- replaceFunc(df$xr2)
df$xr3 <- replaceFunc(df$xr3)
df$xr4 <- replaceFunc(df$xr4)

df$xd1 <- replaceFunc(df$xd1)
df$xd2 <- replaceFunc(df$xd2)
df$xd3 <- replaceFunc(df$xd3)
df$xd4 <- replaceFunc(df$xd4)

df$xo1 <- replaceFunc(df$xo1)
df$xo2 <- replaceFunc(df$xo2)
df$xo3 <- replaceFunc(df$xo3)
df$xo4 <- replaceFunc(df$xo4)

# Do the same for the RL columns. 

replaceFunc <- function(x) {
  nameofx <- deparse(substitute(x))
  x <- ifelse(is.na(x), eval(parse(text = paste0(nameofx, "fg"))), x)
  x <- ifelse(is.na(x), eval(parse(text = paste0(nameofx, "fb"))), x)
  return(x)
}

df$xm1a <- replaceFunc(df$xm1a)
df$xm2a <- replaceFunc(df$xm2a)
df$xm3a <- replaceFunc(df$xm3a)
df$xm4a <- replaceFunc(df$xm4a)

df$xw1a <- replaceFunc(df$xw1a)
df$xw2a <- replaceFunc(df$xw2a)
df$xw3a <- replaceFunc(df$xw3a)
df$xw4a <- replaceFunc(df$xw4a)

df$xh1a <- replaceFunc(df$xh1a)
df$xh2a <- replaceFunc(df$xh2a)
df$xh3a <- replaceFunc(df$xh3a)
df$xh4a <- replaceFunc(df$xh4a)

df$xj1a <- replaceFunc(df$xj1a)
df$xj2a <- replaceFunc(df$xj2a)
df$xj3a <- replaceFunc(df$xj3a)
df$xj4a <- replaceFunc(df$xj4a)

df$xf1a <- replaceFunc(df$xf1a)
df$xf2a <- replaceFunc(df$xf2a)
df$xf3a <- replaceFunc(df$xf3a)
df$xf4a <- replaceFunc(df$xf4a)

df$xr1a <- replaceFunc(df$xr1a)
df$xr2a <- replaceFunc(df$xr2a)
df$xr3a <- replaceFunc(df$xr3a)
df$xr4a <- replaceFunc(df$xr4a)

df$xd1 <- replaceFunc(df$xd1)
df$xd2 <- replaceFunc(df$xd2)
df$xd3 <- replaceFunc(df$xd3)
df$xd4 <- replaceFunc(df$xd4)

df$xo1 <- replaceFunc(df$xo1)
df$xo2 <- replaceFunc(df$xo2)
df$xo3 <- replaceFunc(df$xo3)
df$xo4 <- replaceFunc(df$xo4)

# Recode positively formualted xenophobia items

recodeFunc <- function(x) {
  x <- abs(x - 6)
  return(x)
}

# Identify the positively worded items
posXenoVars <- paste0("x", c("m", "w", "h", "j", "f", "r", "d", "o"), rep(seq(2, 3, 1), each = 8))

posXenoVarsRec <- paste0(posXenoVars, "r")

# Add new columns with "r" for recoded to dataframe
df[ , posXenoVarsRec] <- lapply(df[ , posXenoVars], recodeFunc)


# ----- Desirability belief items

# Rename desirability belief items
db <- c( rep("db", 8))
group <- c("m", "w", "h", "j", "f", "r", "d", "o")

sdbnames <- paste0(db, group)
sdbnamesrl <- paste0(sdbnames, "a")

df[ , c( sdbnames, sdbnamesrl)] <- NA

df[ , sdbnames] <- df[ , seq(which(colnames(df) == "SD40_19"), which(colnames(df) == "SD40_26"), 2)]
df[ , sdbnamesrl] <- df[ , seq(which(colnames(df) == "SD40_19a"), which(colnames(df) == "SD40_26a"), 2)]

# Function to recode the desirability belief items into numeric and get rid of 6 "weiter"
recodeFunc2 <- function(x) {
  x <- ifelse(x == "1 sehr verwerflich", 1, 
              ifelse(x == "2 verwerflich", 2, 
                     ifelse(x == "3 weder noch/neutral", 3, 
                            ifelse(x == "4 erwuenscht", 4, 
                                   ifelse(x == "5 sehr erwuenscht", 5, NA)))))
  return(x)
}

# Apply the function to all the desirability belief items 
df[ , sdbnames] <- lapply(df[ , sdbnames], recodeFunc2)


# ----- NSA items 

bidr <- c(rep("am", 4), rep("cm", 4), rep("sde", 4), rep("sdd", 4))
num <- rep(seq(1, 4, 1), 4)

nsa <- paste0(bidr, num)
nsarl <- paste0(nsa, "a")

df[ , nsa] <- NA
df[ , nsarl] <- NA

df[ , nsa] <- df[ , seq(which(colnames(df) == "BI06_01"), which(colnames(df) == "BI06_16"), 2)]
df[ , nsarl] <- df[ , seq(which(colnames(df) == "BI06_01a"), which(colnames(df) == "BI06_16a"), 2)]

# Recode the NSA items with another function 
recodeFunc3 <- function(x) {
  x <- ifelse(x == "1 stimme gar nicht zu", 1, 
              ifelse(x == "2", 2, 
                     ifelse(x == "3", 3, 
                            ifelse(x == "4", 4, 
                                   ifelse(x == "5 stimme voll und ganz zu", 5, NA)))))
  return(x)
}

# Apply the recodeFunc3 to the NSA items
df[ , nsa] <- lapply(df[ , nsa], recodeFunc3)

# Need to recode some of the NSA items as well, so that high scores always mean high NSA 
posNsa <- c("am1", "am3", "cm1", "cm2", "sde2", "sde3", "sdd1", "sdd3")

# New columns
posNsaRec <- paste0(posNsa, "r")
df[ , posNsaRec] <- NA

# Replace the empty new columns with the recoded NSA items
df[ , posNsaRec] <- lapply(df[, posNsa], recodeFunc)


# ----- Attitude accessibility 

attacc <- c(rep("aa", 8))
attacc <- paste0(attacc, group)

df[ , attacc] <- NA

df[ , attacc] <- df[ , which(colnames(df) == "ZG01_01"):which(colnames(df) == "ZG01_10")]


# ----- Motivation 

mot <- c(rep( "mot", 4))
num <- c(seq( 1, 4, 1))

mot <- paste0(mot, num)

df[ , mot] <- NA

df[ , mot] <- df[ , which(colnames(df) == "MT02_01"):which(colnames(df) == "MT02_04")]


# ----- Opportunity or rather TIME PRESSURE

# df$opp is a measure of time pressure with 5 = very much under pressure 
df$opp <- df$BI06_17

df$opp <- ifelse(df$opp == "1 sehr schwach", 1, 
                 ifelse(df$opp == "2 schwach", 2, 
                        ifelse(df$opp == "3 teils/teils", 3, 
                               ifelse(df$opp == "4 start", 4, 
                                      ifelse(df$opp == "5 sehr stark", 5, NA)))))

# ----- Perceived anonymity

df$anon <- ifelse(df$IE02_01 < 1, NA, df$IE02_01)

# ---- 
# NOTE
# ---- 
# 
# Up until now, this is exactly the data-prep steps for the SD3 paper.
# Idea now is to also incorporate the FI items into this dataset. 
# Then only one prepared dataset is needed for both papers. 
# 

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


# Make long format dataframe ----------------------------------------------

# Just rename the group of columns to work with the following code
# which was written at an earlier point in time 
vars_impDK <- orgvars_imp
vars_expDK <- orgvars_exp
vars_impDK_rl <- paste0("FI01_", sprintf('%0.2d', 2:15), "a")
vars_expDK_rl <- paste0("Fi02_", sprintf('%0.2d', 2:15), "a")

relVars <- c("X", "SERIAL", "REF", 
             "version", "faking",
             "male", "yob", "german", "educ", "polint", "lr", 
             varnames, varnamesrl, posXenoVarsRec, 
             sdbnames, sdbnamesrl, 
             nsa, nsarl, posNsaRec, 
             attacc, mot, "opp", "anon", "impDK", vars_impDK, vars_impDK_rl)

dfSmall <- df[ , relVars]

head(dfSmall)


# Further preparation  ----------------------------------------------------

# ----- Get AMP dataset for TD values

# load() automatically loads the data as "df"
load("AMP.RData")

# ----- TDs 

# Prepare the TD column names 
pre <- rep("td", 32)
mid <- rep(c("m", "w", "j", "f", "r", "d", "o", "h"), each = 4)
suf <- rep(seq(1, 4, 1), 8)
varNames <- paste0(pre, mid, suf)

# Smaller dataset with just TD columns 
td <- df[ , which(colnames(df) == "SB11_01"):which(colnames(df) == "SB05_04")]

# Apply the column names
colnames(td) <- varNames

# Missings
td[td == -9] <- NA

# Create a vector of 32 column means for mean TD of each item 
meantd <- colMeans(na.omit(td))

# Create a vector of 32 column variances 
vartd <- sapply(na.omit(td), var)

# Give the variances names
varNames2 <- paste0(pre, mid, suf, "var")

names(vartd)  <- varNames2

# Add TD means and variances to dataframe
dfSmall[ , varNames] <- NA

# Loop over corresponding column names and fill in with mean TD
for(i in varNames) {
  dfSmall[ , i] <- meantd[i]
}

# Do the same for the variances 
for(i in varNames2) {
  dfSmall[ , i] <- vartd[i]
}


# ----- Make NSA index

dfSmall$nsa <- dfSmall$am1r + dfSmall$cm1r + dfSmall$cm2r

# ----- Make motivation index 

dfSmall$mot1[dfSmall$mot1 < 1] <- NA
dfSmall$mot2[dfSmall$mot2 < 1] <- NA
dfSmall$mot3[dfSmall$mot3 < 1] <- NA

dfSmall$motiv <- dfSmall$mot1 + dfSmall$mot2 + dfSmall$mot3

# ----- Make id variable

dfSmall$id <- seq(1, length(dfSmall$SERIAL), 1)


# Make final wide dataframe -----------------------------------------------

dfw <- dfSmall[!is.na(dfSmall$impDK), ]

fi_long <- reshape2::melt(dfw, 
                          id.vars = c("id", "SERIAL"),
                          measure.vars = which(colnames(dfw) == "FI01_02"):which(colnames(dfw) == "FI01_15"), 
                          variable.name = "item", 
                          value.name = "response")
fi_rl_long <- reshape2::melt(dfw, 
                             id.vars = c("id", "SERIAL"),
                             measure.vars = which(colnames(dfw) == "FI01_02a"):which(colnames(dfw) == "FI01_15a"), 
                             variable.name = "item", 
                             value.name = "rl")

# Fix potential problem with missings with rl = -1 
fi_rl_long$rl[fi_rl_long$rl < 0] <- NA

# Also eliminate extremely long outliers > 1 hour
fi_rl_long$rl[fi_rl_long$rl > 60*60*1000] <- NA

# In fi_rl_long, rename the elements in the "item" column to match up 
# with those in the fi_long data (i.e., delete the "a" suffix)
# head(fi_long); head(fi_rl_long)
fi_rl_long$item <- substr(fi_rl_long$item, 1, 7)

# Merge the two dataframes
dfl <- merge(fi_long, fi_rl_long, by = c("id", "SERIAL", "item"))
head(dfl)

# ----- Person level 
dfl <- merge(dfl, dfw[, c(which(colnames(dfw) == "SERIAL"), 
                          which(colnames(dfw) == "REF"),
                          which(colnames(dfw) == "id"),
                          which(colnames(dfw) == "nsa"),
                          which(colnames(dfw) == "motiv"),
                          which(colnames(dfw) == "opp"),
                          which(colnames(dfw) == "anon"),
                          which(colnames(dfw) == "faking"),
                          which(colnames(dfw) == "version"),
                          which(colnames(dfw) == "yob"),
                          which(colnames(dfw) == "male"),
                          which(colnames(dfw) == "german"),
                          which(colnames(dfw) == "educ"),
                          which(colnames(dfw) == "polint"),
                          which(colnames(dfw) == "lr"),
                          which(colnames(dfw) == "impDK"))])

# Add a dummy for FI (yes/no)
dfl$fi <- ifelse(dfl$item == "FI01_02" | 
                   dfl$item == "FI01_03" | 
                   dfl$item == "FI01_05" | 
                   dfl$item == "FI01_07" | 
                   dfl$item == "FI01_10" | 
                   dfl$item == "FI01_11" | 
                   dfl$item == "FI01_12" | 
                   dfl$item == "FI01_14", 0, 1)

# Make the response column back into a factor 
dfl$response <- ifelse(dfl$response == "don't know", 0, 
                       ifelse(dfl$response == "substantive", 1, NA))

dfl$response <- factor(dfl$response, levels = c(0, 1), labels = c("don't know", "substantive"))


head(dfl, n = 60)


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


# Rename impDK to exp 
dfl$exp <- dfl$impDK
dfl$impDK <- NULL

# Save data ---------------------------------------------------------------

saveRDS(dfw, file = "dfw.Rda")
saveRDS(dfl, file = "dfl.Rda")
write.table(dfw, file = "dfw.csv", sep = ",")
write.table(dfl, file = "dfl.csv", sep = ",")

