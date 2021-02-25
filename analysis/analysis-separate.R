# ============
# Packages --- 
# ============

library(formatR)
library(knitr)
library(ggplot2)
library(gridExtra)
library(dplyr)
library(tidyr)
library(bookdown)
library(lme4)
library(texreg)
library(sjPlot)
library(sjmisc)
library(kableExtra)
library(ggplot2)
library(tidyr)
library(dplyr)

rm(list = ls())

# ========
# Data --- 
# ========

setwd("./fictitious-issues-revisited-revisited")

# Read the prepared dataframes
dfw <- readRDS(file = "../data/dfw.Rda")
dfl <- readRDS(file = "../data/dfl.Rda")

# Change Item WCA for World Climate Amt (??) to the proper name in English IPCC 
levels(dfl$item_fac)[levels(dfl$item_fac) == "WCA"] <- "IPCC"

responses <- dfl %>%
  select(item_fac, response, fi) %>%
  filter(is.na(response) == FALSE, fi == 0) %>%
  group_by(item_fac) 

freqs <- table(responses$response, responses$item_fac)[, c(1:2, 4, 6, 9:11, 13)]
props <- round(prop.table(freqs, 2)*100, 2)

responses_fi <- dfl %>%
  select(item_fac, response, fi) %>%
  filter(is.na(response) == FALSE, fi == 1) %>%
  group_by(item_fac) 

freqs_fi <- table(responses_fi$response, responses_fi$item_fac)[, c(3, 5, 7:8, 12, 14)]
props_fi <- round(prop.table(freqs_fi, 2)*100, 2)

kable(props, "latex", booktabs = TRUE, longtable = FALSE, caption = "\\label{tab:freqs}Responses to existent institutions in percent") %>%
  kable_styling(position = "center") %>%
  add_footnote("BW: German Armed Forces (Bundeswehr), DWB: Doctors without Boarders, UN: United Nations, GP: Greenpeace, BKA: German Federal Criminal Police (Bundeskriminalamt), RLF: Rosa-Luxemburg-Foundation, KAF: Konrad-Adenauer-Foundation, IPCC: Intergovernmental Panel on Climate Change", notation = "none", threeparttable = TRUE)

kable(props_fi, "latex", booktabs = TRUE, longtable = FALSE, caption = "\\label{tab:freqs_fi}Responses to fictitious institutions in percent") %>%
  kable_styling(position = "center") %>%
  add_footnote("EC: Environmental Court, CAA: Coastal Aid Agency, PETI: Prague Energy Transition Initiative, GNF: German Nuclear Forum, HSF: Herbert-Schmaar-Foundation, WSA: World Space Agency", notation = "none", threeparttable = TRUE)


# Recode RLs into seconds
summary(dfl$rl)
dfl$rl <- ifelse(dfl$rl < 0, NA, dfl$rl)

dfl$rl <- dfl$rl/1000

# It makes no sense to calculate the standard deviation before eliminating some 
# of the outrageous RLs (20000 seconds, 5000 seconds)
dfl$rl_inv <- ifelse(dfl$rl > 2000, NA, dfl$rl)

# Outliers are RLs larger than 2sd above mean
dfl$rl_out <- ifelse(dfl$rl_inv >= mean(na.omit(dfl$rl_inv)) + 
                       2*sd(na.omit(dfl$rl_inv)), NA, dfl$rl_inv)

# Make id cluster means
rl_out_m_id <- aggregate(dfl$rl_out, by = list(dfl$id), FUN = mean, 
                         na.rm = TRUE, na.action = "na.pass")
names(rl_out_m_id) <- c("id", "rl_out_m_id")
dfl <- merge(dfl, rl_out_m_id, by = "id")

rl2_out_m_id <- aggregate(dfl$rl_out^2, by = list(dfl$id), FUN = mean, 
                          na.rm = TRUE, na.action = "na.pass")
names(rl2_out_m_id) <- c("id", "rl2_out_m_id")
dfl <- merge(dfl, rl2_out_m_id, by = "id")

# Make item cluster means
rl_out_m_item <- aggregate(dfl$rl_out, by = list(dfl$item), 
                           FUN = mean, na.rm = TRUE, na.action = "na.pass")
names(rl_out_m_item) <- c("item", "rl_out_m_item")
dfl <- merge(dfl, rl_out_m_item, by = "item")

qp1 <- qplot(y = dfl$rl, ylab = "Response latency (sec.)")
qp1 + theme_classic()

# Invalid latencies removed
qp2 <- qplot(y = dfl$rl_inv, ylab = "Response latency (sec.)")
qp2 + theme_classic()

# Outliers (> mean(rl) + 2sd) removed
qp3 <- qplot(y = dfl$rl_out, ylab = "Response latency (sec.)")
qp3 + theme_classic()


# =========== 
# Recodes --- 
# =========== 

# Make age variable 
dfl$age <- 2020 - dfl$yob

# Recode opportunity so that high scores mean more opportunity to deliberate
dfl$oppr <- abs(dfl$opp - 6)

# Center IVs
dfl$polint_c <- dfl$polint - mean(na.omit(dfl$polint))
dfl$lr_c <- dfl$lr - mean(na.omit(dfl$lr))
dfl$nsa_c <- dfl$nsa_scale - mean(na.omit(dfl$nsa_scale))
dfl$age_c <- dfl$age - mean(na.omit(dfl$age))
dfl$oppr_c <- dfl$oppr - mean(na.omit(dfl$oppr))
dfl$mot_c <- dfl$mot_scale - mean(na.omit(dfl$mot_scale))

# Center the response latency score 
dfl$rl_out_c <- dfl$rl_out - mean(na.omit(dfl$rl_out))

# Make age variable 
dfl$age <- 2020 - dfl$yob

# Recode opportunity so that high scores mean more opportunity to deliberate
dfl$oppr <- abs(dfl$opp - 6)

# Center IVs
dfl$polint_c <- dfl$polint - mean(na.omit(dfl$polint))
dfl$lr_c <- dfl$lr - mean(na.omit(dfl$lr))
dfl$nsa_c <- dfl$nsa_scale - mean(na.omit(dfl$nsa_scale))
dfl$age_c <- dfl$age - mean(na.omit(dfl$age))
dfl$oppr_c <- dfl$oppr - mean(na.omit(dfl$oppr))
dfl$mot_c <- dfl$mot_scale - mean(na.omit(dfl$mot_scale))

# Center the response latency score 
dfl$rl_out_c <- dfl$rl_out - mean(na.omit(dfl$rl_out))


# ==============
# FI Dataset --- 
# ==============

dflfi <- dfl[dfl$fi == 1, ]



dfl$response_d_num <- as.numeric(dfl$response_d) - 1

dflSummary <- dfl %>%
  filter(is.na(response_d_num) == FALSE, fi == 1) %>%
  group_by(impDK, speed, item_fac) %>%
  summarise(value = sum(response_d_num) / n())

levels(dflSummary$speed) <- c("Accuracy", "Speed")

ggplot(dflSummary, aes(x = item_fac, y = value, fill = impDK)) + 
  facet_wrap(~ speed) + 
  geom_bar(stat = "identity", 
           position = "dodge",
           color = "black") + 
  scale_y_continuous(labels = scales::percent) + 
  geom_text(aes(label = paste0(round(value, 2)*100, "%")), 
            size = 3.25, position = position_dodge(width = 1), vjust = -0.5) + 
  labs(x = "Item", y = "Substantive answers (%)", 
       caption = "EC: Environmental Court, CAA: Coastal Aid Agency, PETI: Prague Energy Transition Initiative,\n GNF: German Nuclear Forum, HSF: Herbert-Schmaar-Foundation, WSA: World Space Agency.") +
  scale_fill_discrete(name = "Experimental Group") +
  #theme(legend.justification = c(1, 1), legend.position = c(0.99, 0.99))
  theme(legend.position = "bottom")

dfl_summ <- as.data.frame(dfl %>%
                            select(rl_out, item_fac, speed) %>%
                            group_by(item_fac, speed) %>%
                            summarise(rl_mean = mean(na.omit(rl_out)), rl_sd = sd(na.omit(rl_out)), rl_se = rl_sd/sqrt(n())))

ggplot(dfl_summ, aes(x = item_fac, y = rl_mean, color = speed, linetype = speed)) +
  geom_point() +  
  geom_errorbar(aes(ymin = rl_mean - 1.96*rl_se, ymax = rl_mean + 1.96*rl_se)) + 
  labs(x = "Item", y = "Average response latency (sec.) with 95% CI", 
       caption = "EC: Environmental Court, CAA: Coastal Aid Agency, PETI: Prague Energy Transition Initiative,\n GNF: German Nuclear Forum, HSF: Herbert-Schmaar-Foundation, WSA: World Space Agency.") + 
  theme(legend.position = "bottom") + 
  scale_linetype_discrete(name = "Experimental Group") +
  scale_color_discrete(name = "Experimental Group")

# Make fi into a factor
dfl$fi <- factor(dfl$fi, levels = c(0, 1), labels = c("Existent", "Fictitious"))


# ==========
# Models --- 
# ==========

# 26.01.2021 -------------------------------------------------------------------

m1 <- glmer(response_d ~ rl_out + I(rl_out^2) + rl_out_m_id + 
              impDK + speed + 
              item_fac + 
              (1 | id), 
            data = dflfi, 
            nAGQ = 0, family = binomial(link = "logit"))
summary(m1)

m2 <- glmer(response_d ~ rl_out + I(rl_out^2) + rl_out_m_id + 
              impDK + speed + 
              item_fac + 
              rl_out:impDK + I(rl_out^2):impDK + 
              rl_out:speed + I(rl_out^2):speed + 
              (1 | id), 
            data = dflfi, 
            nAGQ = 0, family = binomial(link = "logit"))
summary(m2)

# ------------------------------------------------------------------------------

m1 <- glmer(response_d ~ rl_out + I(rl_out^2) + rl_out_m_id + 
             item_fac + 
             impDK + speed + 
              #rl_out_c:item_fac + 
              #rl_out_c:impDK + 
              #rl_out_c:speed + 
             (1 | id), 
           data = dflfi, 
           nAGQ = 0, family = binomial(link = "probit"))
summary(m1)

hist(dflfi$rl_out)
summary(dflfi$rl_out)


plot_model(m1, type = "pred", terms = "rl_out[all]")


# =================
# Original data ---
# =================

getwd()
dfo <- read.csv("../data/preparation/sdData_v01.csv") 
head(dfo$IE03)
table(dfo$IE03)

help(merge)

dfo$id <- dfo$X

dfl <- merge(dfl, dfo[, c("id", "IE03", "LASTPAGE")], by = "id")
head(dfl)

dfl$finished <- ifelse(dfl$LASTPAGE == 38, 1, 
                       ifelse(dfl$LASTPAGE != 38, 0, NA))

table(dfl$finished)

dfl$lie <- ifelse(dfl$IE03 == "Ja", 1, 
                  ifelse(dfl$IE03 == "Nein", 0, NA))
table(dfl$lie)

hist(dfl$LASTPAGE)
table(dfl$IE03)

head(dfl$educ)

dfl$rl_out_ln <- log(dfl$rl_out)
