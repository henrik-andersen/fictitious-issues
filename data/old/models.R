
# Data --------------------------------------------------------------------

setwd("D:/Henrik/Seafile/Meine Bibliothek/Henrik Jochen/Papers/SD Papers/SD Projekt Daten Henrik/Articles/Fictitious Issues/Analysis/Data")

dfl <- readRDS(file = "dfl.Rda")


# Packages ----------------------------------------------------------------

library(lme4)
library(margins)
library(miceadds)
library(sandwich)
library(lmtest)


# Select FI = TRUE --------------------------------------------------------

dfl <- dfl[dfl$fi == 1, ]

# Models ------------------------------------------------------------------

# ----- Step 1: Run initial models 

# M1: Normal logit with controls/unit characteristics
m1 <- glm(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
            exp + polint + lr + nsa + 
            male + educ + age, 
          data = dfl, family = binomial(link = "logit"))

m1r <- miceadds::glm.cluster(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
                               exp + polint + lr + nsa + 
                               male + educ + age, 
                             data = dfl, family = binomial(link = "logit"), cluster = c("id"))

# M2: Multilevel logit with controls etc.  
m2 <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
              exp + polint + lr + nsa + 
              male + educ + age + 
              (1 | id), 
            data = dfl, nAGQ = 0, family = binomial(link = "logit"))

# M3: Multilevel logit with RL*Item interaction 
m3 <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
              exp + polint + lr + nsa + 
              male + educ + age + 
              rl_log:item_fac + 
              (1 | id), 
            data = dfl, nAGQ = 0, family = binomial(link = "logit"))

# ----- Step 2: Robustness checks

# a) Probit 

# M1a: Normal probit with controls/unit characteristics
m1a <- glm(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
            exp + polint + lr + nsa + 
            male + educ + age, 
          data = dfl, family = binomial(link = "probit"))

m1ar <- miceadds::glm.cluster(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
                               exp + polint + lr + nsa + 
                               male + educ + age, 
                             data = dfl, family = binomial(link = "probit"), cluster = c("id"))

# M2a: Multilevel logit with controls etc.  
m2a <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
               exp + polint + lr + nsa + 
               male + educ + age + 
               (1 | id), 
            data = dfl, nAGQ = 0, family = binomial(link = "probit"))

# M3a: Multilevel logit with RL*Item interaction 
m3a <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
               exp + polint + lr + nsa + 
               male + educ + age + 
               rl_log:item_fac + 
               (1 | id), 
            data = dfl, nAGQ = 0, family = binomial(link = "probit"))

# b) Eliminate speeders

dfl_ns <- dfl[dfl$rl/1000 > 1, ]

# M1: Normal probit with controls/unit characteristics
m1b <- glm(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
             exp + polint + lr + nsa + 
             male + educ + age, 
          data = dfl_ns, family = binomial(link = "probit"))

m1br <- miceadds::glm.cluster(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
                                exp + polint + lr + nsa + 
                                male + educ + age, 
                             data = dfl, family = binomial(link = "probit"), cluster = c("id"))

# M2: Multilevel probit with controls etc.  
m2b <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
               exp + polint + lr + nsa +
               male + educ + age + 
              (1 | id), 
            data = dfl_ns, nAGQ = 0, family = binomial(link = "probit"))

# M3: Multilevel probit with RL*Item interaction 
m3b <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
              exp + polint + lr + nsa +
              male + educ + age + 
              rl_log:item_fac + 
              (1 | id), 
            data = dfl_ns, nAGQ = 0, family = binomial(link = "probit"))

# c) Stripped-down model 

m3c <- glmer(response ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
               (1 | id), 
             data = dfl, nAGQ = 0, family = binomial(link = "probit"))


# Save the model objects --------------------------------------------------

saveRDS(m1, "m1.Rda")
saveRDS(m1r, "m1r.Rda")
saveRDS(m2, "m2.Rda")
saveRDS(m3, "m3.Rda")

saveRDS(m1a, "m1a.Rda")
saveRDS(m1ar, "m1ar.Rda")
saveRDS(m2a, "m2a.Rda")
saveRDS(m3a, "m3a.Rda")

saveRDS(m1b, "m1b.Rda")
saveRDS(m1br, "m1br.Rda")
saveRDS(m2b, "m2b.Rda")
saveRDS(m3b, "m3b.Rda")

saveRDS(m3c, "m3c.Rda")


# Backup ------------------------------------------------------------------


# ----- Normal logit models 

m1 <- glm(response_num ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
            exp + polint +
            lr + nsa + male + educ + age, 
          data = dfl, family = binomial(link = "probit"))

m1r <- miceadds::glm.cluster(response_num ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
                               exp + polint + 
                               lr + nsa + male + educ + age, 
                             data = dfl, family = binomial(link = "probit"), cluster = c("id"))

m2 <- glmer(response_num ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
              exp + polint + 
              lr + nsa + male + educ + age + 
              (1 | id), 
            data = dfl, family = binomial(link = "probit"))

m3 <- glmer(response_num ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
              exp + polint + 
              rl_log:item_fac + 
              (1 | id), 
            data = dfl, family = binomial(link = "probit"))

m4 <- glmer(response_num ~ rl_log + I(rl_log^2) + rl_log_m + item_fac + 
              (1 | id), 
            data = dfl, family = binomial(link = "probit"))

saveRDS(m1, "m1.Rda")
saveRDS(m2, "m2.Rda")
saveRDS(m3, "m3.Rda")
saveRDS(m4, "m4.Rda")

saveRDS(m1r, "m1r.Rda")
#saveRDS(m2r, "m2r.Rda")
#saveRDS(m3r, "m3r.Rda")

#saveRDS(m3b, "m3b.Rda")
#saveRDS(m4, "m4.Rda")

# ----- Normal SEs

# Logit regression with RL no outliers and cluster means for baseline speed
m1 <- glm(response ~ rl_out + rl_m + exp + nsa + polint + lr + male + educ + age, 
          data = dfl, family = binomial(link = "logit"))

# Logit regression with log(RL) and cluster means for baseline speed
m2 <- glm(response ~ rl_log + rl_log_m + exp + nsa + polint + lr + male + educ + age, 
          data = dfl, family = binomial(link = "logit"))
# Extreme outlier removal 
m3 <- glm(response ~ rl_ext + rl_ext_m + exp + nsa + polint + lr + male + educ + age, 
          data = dfl, family = binomial(link = "logit"))

# ----- Robust 

# Logit regression with RL no outliers and cluster means for baseline speed
m1r <- miceadds::glm.cluster(response ~ rl_out + rl_m + exp + nsa + polint + lr + male + educ + age, 
                             cluster = c("id"), data = dfl, family = binomial(link = "logit"))

# Logit regression with log(RL) and cluster means for baseline speed
m2r <- miceadds::glm.cluster(response ~ rl_log + rl_log_m + exp + nsa + polint + lr + male + educ + age, 
                             cluster = c("id"), data = dfl, family = binomial(link = "logit"))
# Extreme outlier removal 
m3r <- miceadds::glm.cluster(response ~ rl_ext + rl_ext_m + exp + nsa + polint + lr + male + educ + age, 
                             cluster = c("id"), data = dfl, family = binomial(link = "logit"))

# ----- Mulitlevel models 

# Logit full model
m3b <- glmer(response ~ rl_ext + rl_ext_m + exp + nsa + polint + lr + male + educ + age + (1 | id) + (1 | item), 
             data = dfl, family = binomial(link = "logit"))

# Probit CRE 
m4 <- glmer(response ~ rl_ext + rl_ext_m + (1 | id) + (1 | item), 
            data = dfl, family = binomial(link = "probit"))


# Save models as objects --------------------------------------------------

saveRDS(m1, "m1.Rda")
saveRDS(m2, "m2.Rda")
saveRDS(m3, "m3.Rda")

saveRDS(m1r, "m1r.Rda")
saveRDS(m2r, "m2r.Rda")
saveRDS(m3r, "m3r.Rda")

saveRDS(m3b, "m3b.Rda")
saveRDS(m4, "m4.Rda")
