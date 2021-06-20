# --- 
# Title: Data preparation. Now with the accuracy instructions, too. 
# Author: Henrik Andersen 
# Date: 10.09.2020
# --- 

# Setup -------------------------------------------------------------------

Sys.setenv(LANG = "en")

rm(list = ls())



# Packages ----------------------------------------------------------------

library(tidyr)

setwd("C:/Users/Henrik/github_projects/fictitious-issues")

# Data --------------------------------------------------------------------

# Set the working directory
setwd("./data/preparation")

# Read the data 
df <- read.csv("sdData_v01.csv")
head(df)

# Can't seem to rename X, instead, make new duplicate id column 
df$id <- df$X

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
table(df$educ)

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

head(df[ , posNsaRec])

#nsa <- df[, nsa]
#head(nsa)
#nsaRec <- df[, posNsaRec]
#head(nsaRec)

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

# Data preparation --------------------------------------------------------

# To help with writing the code, eliminate LL and DQ

# table(df$QUESTNNR)

# df <- df[df$QUESTNNR == "SL", ]

#sum(table(df$FI01_04),
#table(df$FI02_04),
#table(df$FI03_04),
#table(df$FI04_04))

# --- Experimental designs 

# Implicit/explicit dont know

df$impDK <- ifelse(
  !is.na(df$FI01_04) | !is.na(df$FI03_04) |
  !is.na(df$FI01_06) | !is.na(df$FI03_06) | 
  !is.na(df$FI01_08) | !is.na(df$FI03_08) |
  !is.na(df$FI01_09) | !is.na(df$FI03_09) |
  !is.na(df$FI01_13) | !is.na(df$FI03_13) |
  !is.na(df$FI01_15) | !is.na(df$FI03_15), 1, 
  ifelse(
    !is.na(df$FI02_04) | !is.na(df$FI04_04) |
    !is.na(df$FI02_06) | !is.na(df$FI04_06) |
    !is.na(df$FI02_08) | !is.na(df$FI04_08) |
    !is.na(df$FI02_09) | !is.na(df$FI04_09) |
    !is.na(df$FI02_13) | !is.na(df$FI04_13) |
    !is.na(df$FI02_15) | !is.na(df$FI04_15), 0, NA))

df$impDK <- factor(df$impDK, levels = c(0, 1), labels = c("explicit DK", "implicit DK"))

# Speed/accuracy 

df$speed <- ifelse(
  !is.na(df$FI01_04) | !is.na(df$FI02_04) |
  !is.na(df$FI01_06) | !is.na(df$FI02_06) |
  !is.na(df$FI01_08) | !is.na(df$FI02_08) |
  !is.na(df$FI01_09) | !is.na(df$FI02_09) |
  !is.na(df$FI01_13) | !is.na(df$FI02_13) |
  !is.na(df$FI01_15) | !is.na(df$FI02_15), 1, 
  ifelse(
    !is.na(df$FI03_04) | !is.na(df$FI04_04) |
    !is.na(df$FI03_06) | !is.na(df$FI04_06) |
    !is.na(df$FI03_08) | !is.na(df$FI04_08) |
    !is.na(df$FI03_09) | !is.na(df$FI04_09) |
    !is.na(df$FI03_13) | !is.na(df$FI04_13) |
    !is.na(df$FI03_15) | !is.na(df$FI04_15), 0, NA))

df$speed <- factor(df$speed, levels = c(0, 1), labels = c("accuracy", "speed"))

# --- Fictitious issues 

#         | ImpDK | ExpDK
# --------|-------|--------
# Speed   | FI01  | FI02
# Accur   | FI03  | FI04
# --------|-------|--------

# Two sets of variables
# 1) Original scale, limited to three categories: good, bad, don't know (= continue, don't know in ExpDK)
# 2) Dichotomized, limited to two categories: substantive (= good, bad), don't know (= continue, don't know in ExpDK)

# Merge the implicit/explicit columns
replaceFun <- function(x) {
  
  # This turns the variable name, including df$ into a string  
  nameofx <- deparse(substitute(x))
  
  # If FI01_xx is missing, try FI02_xx
  x <- ifelse(is.na(x), eval(parse(text = paste0(substr(nameofx, 1, 6), "2", substr(nameofx, 8, nchar(nameofx))))), x)
  # If still missing, try FI03_xx
  x <- ifelse(is.na(x), eval(parse(text = paste0(substr(nameofx, 1, 6), "3", substr(nameofx, 8, nchar(nameofx))))), x)
  # If still missing, try FI04_xx
  x <- ifelse(is.na(x), eval(parse(text = paste0(substr(nameofx, 1, 6), "4", substr(nameofx, 8, nchar(nameofx))))), x)
  
  return(x)
  
}

# table(df$FI01_04); table(df$FI02_04); table(df$FI03_04); table(df$FI04_04) 

# Combine the columns of the original variables 
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

# table(df$FI01_04)

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

# table(df$impDK, df$FI01_04)
# table(df$speed, df$FI01_04)

vars <- paste0("FI01_", sprintf('%0.2d', 2:15)); vars
vars_dich <- paste0("FI01_", sprintf('%0.2d', 2:15), "d"); vars_dich

df[vars_dich] <- NA; df[vars_dich]

df[vars_dich] <- ifelse(df[vars] == "eher gut" | df[vars] == "eher schlecht", 1, 
                        ifelse(df[vars] == "kenne ich nicht" | df[vars] == "weiter", 0, NA))

df[vars] <- ifelse(df[vars] == "eher gut", "positive", 
                   ifelse(df[vars] == "eher schlecht", "negative", 
                          ifelse(df[vars] == "kenne ich nicht", "don't know", "continue")))

# table(df$FI01_04); table(df$FI01_04d)

factorFun <- function(x) {

  x <- factor(x, levels = c(0, 1), labels = c("don't know", "substantive"))
    
}

df[vars_dich] <- lapply(df[vars_dich], factorFun)

# table(df$FI01_04); table(df$FI01_04d)
                        
# Some final scales ---

# Make NSA index

df$nsa_scale <- df$am1r + df$cm1r + df$cm2r

# Make motivation index 

df$mot1 <- ifelse(df$mot1 < 1, NA, df$mot1)
df$mot2 <- ifelse(df$mot2 < 1, NA, df$mot2)
df$mot3 <- ifelse(df$mot3 < 1, NA, df$mot3)

df$mot_scale <- df$mot1 + df$mot2 + df$mot3

# Make long format dataframe ----------------------------------------------

# The RL columns 
vars_rl <- paste0("FI01_", sprintf('%0.2d', 2:15), "a")

# Predictor columns
preds <- c("male", "educ", "yob",
           "lr", "polint", "opp", 
           nsa, posNsaRec, nsarl, "nsa_scale", mot, "mot_scale",
           attacc, 
           "anon", 
           "TIME_SUM", "MISSING", "MISSREL", "TIME_RSI", "DEG_TIME")

# ----- Make the smaller wide-format dataframe 
dfw <- df[, c("id", 
              "impDK", "speed", 
              vars, vars_dich, vars_rl, 
              preds)]
head(dfw)

# Remove rows where impDK is missing, should be 1288 cases
dfw <- dfw[!is.na(dfw$impDK), ]
nrow(dfw)

# Now the long-format data

#head(dfw[, c(1:3, 
#which(colnames(dfw) == "FI01_02"):which(colnames(dfw) == "FI01_15"), 
#which(colnames(dfw) == preds[1]):which(colnames(dfw) == preds[length(preds)]))])

# Original FI variables 
dfl_item <- gather(data = dfw[, c(1:3, 
                                  which(colnames(dfw) == "FI01_02"):which(colnames(dfw) == "FI01_15"), 
                                  which(colnames(dfw) == preds[1]):which(colnames(dfw) == preds[length(preds)]))], 
                   key = item, 
                   value = response, 
                   FI01_02:FI01_15, 
                   factor_key = TRUE)

#head(dfw[, c(1:3, 
#             which(colnames(dfw) == "FI01_02d"):which(colnames(dfw) == "FI01_15d"))])

# Dichotomous FI variables 
dfl_item_d <- gather(data = dfw[, c(1:3, 
                                    which(colnames(dfw) == "FI01_02d"):which(colnames(dfw) == "FI01_15d"))],
                 key = item, 
                 value = response_d, 
                 FI01_02d:FI01_15d, 
                 factor_key = TRUE)

# head(dfw[, c(1:3, 
#             which(colnames(dfw) == "FI01_02a"):which(colnames(dfw) == "FI01_15a"))])

# Response latencies 
dfl_rl <- gather(data = dfw[, c(1:3, 
                                which(colnames(dfw) == "FI01_02a"):which(colnames(dfw) == "FI01_15a"))], 
                 key = item, 
                 value = rl,
                 FI01_02a:FI01_15a,
                 factor_key = TRUE)

# Make item identifiers
dfl_rl$item <- substr(dfl_rl$item, 1, 7)
dfl_item_d$item <- substr(dfl_item_d$item, 1, 7)

# Merge the data
dfl <- merge(dfl_item, dfl_item_d, by = c("id", "item"))
head(dfl)
head(dfw)

# which(colnames(dfl) == "id")
# which(colnames(dfl) == "response")
# which(colnames(dfl) == "response_d")

dfl <- dfl[, c(1:71, 74)]

dfl <- merge(dfl, dfl_rl, by = c("id", "item"))
head(dfl)

# which(colnames(dfl) == "id")
# which(colnames(dfl) == "response_d")
# which(colnames(dfl) == "rl")

dfl <- dfl[, c(1:72, 75)]
head(dfl)

names(dfl)[3:4] <- c("impDK", "speed") 

#names(dfl) <- c("id", "item", "impDK", "speed", "nsa", "polint", "lr", "male", "educ", "age", "response", "response_d", "rl")

# Make the response column back into a factor 
dfl$response_d <- ifelse(dfl$response_d == "don't know", 0, 
                       ifelse(dfl$response_d == "substantive", 1, NA))
dfl$response_d <- factor(dfl$response_d, levels = c(0, 1), labels = c("don't know", "substantive"))

dfl$response <- ifelse(dfl$response == "negative", 0, 
                       ifelse(dfl$response == "positive", 1, 
                              ifelse(dfl$response == "continue", 2,
                                     ifelse(dfl$response == "don't know", 3, NA))))
dfl$response <- factor(dfl$response, levels = c(0, 1, 2, 3), labels = c("negative", "positive", "continue", "don't know"))

# Add a dummy for FI (yes/no)
dfl$fi <- ifelse(dfl$item == "FI01_02" | 
                   dfl$item == "FI01_03" | 
                   dfl$item == "FI01_05" | 
                   dfl$item == "FI01_07" | 
                   dfl$item == "FI01_10" | 
                   dfl$item == "FI01_11" | 
                   dfl$item == "FI01_12" | 
                   dfl$item == "FI01_14", 0, 1)


head(dfl)

table(dfl$response)
table(dfl$response_d)

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

saveRDS(dfw, file = "../dfw.Rda")
saveRDS(dfl, file = "../dfl.Rda")
# write.table(dfl, file = "dfl.csv", sep = ",")

# BACKUP ------------------------------------------------------------------

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
orgvars_imp_speed <- paste0("FI01_", sprintf('%0.2d', 2:15))
orgvars_exp_speed <- paste0("FI02_", sprintf('%0.2d', 2:15))
orgvars_imp_accur <- paste0("FI03_", sprintf('%0.2d', 2:15))
orgvars_exp_accur <- paste0("FI04_", sprintf('%0.2d', 2:15))

# Use lappy to apply the functions to all of the items
df[orgvars_imp_speed] <- lapply(df[orgvars_imp_speed], recodeFun)
df[orgvars_exp_speed] <- lapply(df[orgvars_exp_speed], recodeFun_dk)
df[orgvars_imp_accur] <- lapply(df[orgvars_imp_accur], recodeFun)
df[orgvars_exp_accur] <- lapply(df[orgvars_exp_accur], recodeFun_dk)

# Recode positive and negative responses to just substantive yes/no
recodeFun2 <- function(x) {
  y = ifelse(x == "positively" | x == "negatively", 1, 
             ifelse(x == "don't recognize" | x == "continue", 0, NA))
  y = factor(y, levels = c(0, 1), labels = c("don't know", "substantive"))
  return(y)
}

# Add mew columns for copies of original columns to just hold
# whether the response was substantive or not, keep the old columns
# for descriptive statistics purposes 

orgvars_imp_speed_dich <- paste0("FI01_", sprintf('%0.2d', 2:15), "_dich")
orgvars_exp_speed_dich <- paste0("FI02_", sprintf('%0.2d', 2:15), "_dich")
orgvars_imp_accur_dich <- paste0("FI03_", sprintf('%0.2d', 2:15), "_dich")
orgvars_exp_accur_dich <- paste0("FI04_", sprintf('%0.2d', 2:15), "_dich")


# Apply the function 
df[orgvars_imp_speed_dich] <- lapply(df[orgvars_imp_speed], recodeFun2)
df[orgvars_exp_speed_dich] <- lapply(df[orgvars_exp_speed], recodeFun2)
df[orgvars_imp_accur_dich] <- lapply(df[orgvars_imp_accur], recodeFun2)
df[orgvars_exp_accur_dich] <- lapply(df[orgvars_exp_accur], recodeFun2)

table(df$FI01_04); table(df$FI01_04_dich) 
table(df$FI02_04); table(df$FI02_04_dich) 
table(df$FI03_04); table(df$FI03_04_dich) 
table(df$FI04_04); table(df$FI04_04_dich) 

# Now, turn the original EXPLICIT DK into three category variables for
# merging with the IMPLICIT DK variables

recodeFun3 <- function(x) {
  y = ifelse(x == "don't recognize" | x == "continue", "don't know", 
             ifelse(x == "negatively", "negatively", 
                    ifelse(x == "positively", "positively")))
  return(y)
}

df[orgvars_exp_speed] <- lapply(df[orgvars_exp_speed], recodeFun3)
df[orgvars_exp_accur] <- lapply(df[orgvars_exp_accur], recodeFun3)

table(df$FI01_04); table(df$FI01_04_dich) 
table(df$FI02_04); table(df$FI02_04_dich) 
table(df$FI03_04); table(df$FI03_04_dich) 
table(df$FI04_04); table(df$FI04_04_dich) 


# Backwards substring function
substrRight <- function(x, n) {
  substr(x, nchar(x) - n + 1, nchar(x))
}

# Need to recode the expDK into three category variables like the impDK for the merge later 

# Implicit DK, speed
# table(df$FI01_04)
# Explicit DK, speed
# table(df$FI02_04)
# Implicit DK, accur
# table(df$FI03_04)
# Explicit DK, accur
# table(df$FI04_04)

df[orgvars_exp_speed] <- ifelse(df[orgvars_exp_speed] == "negatively", "negatively", 
                                ifelse(df[orgvars_exp_speed] == "positively", "positively", 
                                       ifelse(df[orgvars_exp_speed] == "don't recognize", "don't know", 
                                              ifelse(df[orgvars_exp_speed] == "continue", "don't know", NA))))
df[orgvars_exp_accur] <- ifelse(df[orgvars_exp_accur] == "negatively", "negatively", 
                                ifelse(df[orgvars_exp_accur] == "positively", "positively", 
                                       ifelse(df[orgvars_exp_accur] == "don't recognize", "don't know",
                                              ifelse(df[orgvars_exp_accur] == "continue", "don't know", NA))))


# Merge the implicit/explicit columns
replaceFun <- function(x) {
  
  # This turns the variable name, including df$ into a string  
  nameofx <- deparse(substitute(x))
  
  # If FI01_xx is missing, try FI02_xx
  x <- ifelse(is.na(x), eval(parse(text = paste0(substr(nameofx, 1, 6), "2", substr(nameofx, 8, nchar(nameofx))))), x)
  # If still missing, try FI03_xx
  x <- ifelse(is.na(x), eval(parse(text = paste0(substr(nameofx, 1, 6), "3", substr(nameofx, 8, nchar(nameofx))))), x)
  # If still missing, try FI04_xx
  x <- ifelse(is.na(x), eval(parse(text = paste0(substr(nameofx, 1, 6), "4", substr(nameofx, 8, nchar(nameofx))))), x)
  
  return(x)
  
}

# Combine the columns of three category variables
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

# Combine columns of two category variables 
df$FI01_02_dich <- replaceFun(df$FI01_02_dich)
df$FI01_03_dich <- replaceFun(df$FI01_03_dich)
df$FI01_04_dich <- replaceFun(df$FI01_04_dich)
df$FI01_05_dich <- replaceFun(df$FI01_05_dich)
df$FI01_06_dich <- replaceFun(df$FI01_06_dich)
df$FI01_07_dich <- replaceFun(df$FI01_07_dich)
df$FI01_08_dich <- replaceFun(df$FI01_08_dich)
df$FI01_09_dich <- replaceFun(df$FI01_09_dich)
df$FI01_10_dich <- replaceFun(df$FI01_10_dich)
df$FI01_11_dich <- replaceFun(df$FI01_11_dich)
df$FI01_12_dich <- replaceFun(df$FI01_12_dich)
df$FI01_13_dich <- replaceFun(df$FI01_13_dich)
df$FI01_14_dich <- replaceFun(df$FI01_14_dich)
df$FI01_15_dich <- replaceFun(df$FI01_15_dich)

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

# The resulting variables are numeric for some stupid reason... 
table(df$FI01_04); table(df$FI02_04); table(df$FI03_04); table(df$FI04_04)

# Function to turn them back into factors, either with 2 or 3 categories
factorFun <- function(x) {
  substrRight <- function(x, n) {
    substr(x, nchar(x) - n + 1, nchar(x))
  }
  # If last letters of column name are "dich", then only two categories: dont know, substantive
  if(substrRight(x, 4) == "dich") {
    
    x <- factor(x, levels = c(1, 2), labels = c("don't know", "substantive"))
    # Otherwise, 
  } else {
    
    x <- factor(x, levels = c(1, 2, 3), labels = c("negative", "positive", "don't know"))
    
  }
}

df[orgvars_imp_speed_dich] <- lapply(df[orgvars_imp_speed_dich], factorFun)
df[orgvars_imp_speed] <- lapply(df[orgvars_imp_speed], factorFun)