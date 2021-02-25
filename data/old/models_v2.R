# ----- 
# Title: Models 
# Author: Henrik Andersen
# Date: 14.07.2020
# -----

# Set language to English 
Sys.setenv(LANG = "en")

# Start fresh
rm(list = ls())


# Packages ----------------------------------------------------------------

library(lme4)
library(margins)
library(miceadds)
library(sandwich)
library(lmtest)


# Data --------------------------------------------------------------------

setwd("D:/Henrik/Seafile/Meine Bibliothek/Henrik Jochen/Papers/SD Papers/SD Projekt Daten Henrik/Articles/Fictitious Issues/Analysis/Data")

dfl <- readRDS(file = "dfl.Rda")


# Select FI = TRUE --------------------------------------------------------

dfl <- dfl[dfl$fi == 1, ]


# Double-check RLs --------------------------------------------------------

hist(dfl$rl)
hist(dfl$rl_log)
hist(dfl$rl_ext)


# Center IVs --------------------------------------------------------------

dfl$polint_c <- dfl$polint - mean(na.omit(dfl$polint))
dfl$lr_c <- dfl$lr - mean(na.omit(dfl$lr))
dfl$nsa_c <- dfl$nsa - mean(na.omit(dfl$nsa))
dfl$age_c <- dfl$age - mean(na.omit(dfl$age))

dfl$rl_log_c <- dfl$rl_log - mean(na.omit(dfl$rl_log))
dfl$rl_ext_c <- dfl$rl_ext - mean(na.omit(dfl$rl_ext))

# Models ------------------------------------------------------------------

head(dfl)

# ----- Multilevel probit 

# _0x = without interactions
# _1x = with interactions
# _x0 = rl_log
# _x1 = rl_ext_c

m1_00 <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
              exp + polint_c + lr_c + nsa_c + 
              male + educ + age_c + 
              (1 | id), 
            data = dfl, nAGQ = 0, family = binomial(link = "probit"))
summary(m1_00)

m1_01 <- glmer(response ~ rl_ext_c + I(rl_ext_c^2) + rl_ext_m + item_fac + 
                 exp + polint_c + lr_c + nsa_c + 
                 male + educ + age_c + 
                 (1 | id), 
               data = dfl, nAGQ = 0, family = binomial(link = "probit"))
summary(m1_01)

m1_10 <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
                 exp + polint_c + lr_c + nsa_c + 
                 male + educ + age_c + 
                 rl_log:item_fac + 
                 (1 | id), 
               data = dfl, nAGQ = 0, family = binomial(link = "probit"))
summary(m1_10)

m1_11 <- glmer(response ~ rl_ext_c + I(rl_ext_c^2) + rl_ext_m + item_fac + 
                 exp + polint_c + lr_c + nsa_c + 
                 male + educ + age_c + 
                 rl_ext_c:item_fac + 
                 (1 | id), 
               data = dfl, nAGQ = 0, family = binomial(link = "probit"))
summary(m1_11)


# Eliminate speeders ------------------------------------------------------

dfl_ns <- dfl[dfl$rl/1000 > 1, ]

# Recalculate mean-centered rl_ext

dfl_ns$rl_ext_c <- dfl_ns$rl_ext - mean(na.omit(dfl$rl_ext))

# _0x = without interactions
# _1x = with interactions
# _x0 = rl_log
# _x1 = rl_ext_c

m2_00 <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
                 exp + polint_c + lr_c + nsa_c + 
                 male + educ + age_c + 
                 (1 | id), 
               data = dfl_ns, nAGQ = 0, family = binomial(link = "probit"))
summary(m2_00)

m2_01 <- glmer(response ~ rl_ext_c + I(rl_ext_c^2) + rl_ext_m + item_fac + 
                 exp + polint_c + lr_c + nsa_c + 
                 male + educ + age_c + 
                 (1 | id), 
               data = dfl_ns, nAGQ = 0, family = binomial(link = "probit"))
summary(m2_01)

m2_10 <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
                 exp + polint_c + lr_c + nsa_c + 
                 male + educ + age_c + 
                 rl_log:item_fac + 
                 (1 | id), 
               data = dfl_ns, nAGQ = 0, family = binomial(link = "probit"))
summary(m2_10)

m2_11 <- glmer(response ~ rl_ext_c + I(rl_ext_c^2) + rl_ext_m + item_fac + 
                 exp + polint_c + lr_c + nsa_c + 
                 male + educ + age_c + 
                 rl_ext_c:item_fac + 
                 (1 | id), 
               data = dfl_ns, nAGQ = 0, family = binomial(link = "probit"))
summary(m2_11)


# Save the model objects --------------------------------------------------

saveRDS(m1_00, "m1_00.Rda") # Speeders, no ints., rl_log
saveRDS(m1_01, "m1_01.Rda") # Speeders, no ints., rl_ext_c
saveRDS(m1_10, "m1_10.Rda") # Speeders, ints., rl_log
saveRDS(m1_11, "m1_11.Rda") # Speeders, ints., rl_ext_c

saveRDS(m2_00, "m2_00.Rda") # No speeders, no ints., rl_log
saveRDS(m2_01, "m2_01.Rda") # No speeders, no ints., rl_ext_c
saveRDS(m2_10, "m2_10.Rda") # No speeders, ints., rl_log
saveRDS(m2_11, "m2_11.Rda") # No speeders, ints., rl_ext_c


