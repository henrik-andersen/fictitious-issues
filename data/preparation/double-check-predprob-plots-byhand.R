# Read the prepared dataframes
getwd()

dfw <- readRDS(file = "data/dfw.Rda")
dfl <- readRDS(file = "data/dfl.Rda")

# Delete RLs less than 0 seconds 
dfl$rl <- ifelse(dfl$rl < 0, NA, dfl$rl)

# Recode RLs into seconds
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

# Make item cluster means
rl_out_m_item <- aggregate(dfl$rl_out, by = list(dfl$item), 
                           FUN = mean, na.rm = TRUE, na.action = "na.pass")
names(rl_out_m_item) <- c("item", "rl_out_m_item")
dfl <- merge(dfl, rl_out_m_item, by = "item")

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

# --- Add new columns 
dfo <- read.csv("data/preparation/sdData_v01.csv") 

dfo$id <- dfo$X

dfl <- merge(dfl, dfo[, c("id", "IE03", "LASTPAGE")], by = "id")

# Recode LASTPAGE to dummy finished? 
dfl$finished <- ifelse(dfl$LASTPAGE == 38, 1, 
                       ifelse(dfl$LASTPAGE != 38, 0, NA))

# Recode IE03 into lied? 
dfl$lied <- ifelse(dfl$IE03 == "Ja", 1, 
                   ifelse(dfl$IE03 == "Nein", 0, NA)) 

dfl$relspeedind <- dfl$TIME_RSI

# New dataframe with just FIs
dflfi <- dfl[dfl$fi == 1, ]

# Model 1: Predicted Probabilities RL 

# At RL = 10 secs
exp(0.541 - 0.011*10 - 0.065*mean(na.omit(dflfi$rl_out_m_id)))/
  (1 + exp(0.541 - 0.011*10 - 0.065*mean(na.omit(dflfi$rl_out_m_id))))

# At RL = 20 secs
exp(0.541 - 0.011*20 - 0.065*mean(na.omit(dflfi$rl_out_m_id)))/
  (1 + exp(0.541 - 0.011*20 - 0.065*mean(na.omit(dflfi$rl_out_m_id))))

# At RL = 30 secs 
exp(0.541 - 0.011*30 - 0.065*mean(na.omit(dflfi$rl_out_m_id)))/
  (1 + exp(0.541 - 0.011*30 - 0.065*mean(na.omit(dflfi$rl_out_m_id))))

# Model 2: Predicted Probabilities RL 

# At RL = 10 secs 
exp(1.092 - 0.042*10 - 0.370*mean(na.omit(dflfi$rl_out_m_id)) + 0.001*(10^2) + 0.042*mean(na.omit(dflfi$rl_out_m_id^2)))/
  (1 + exp(1.092 - 0.042*10 - 0.370*mean(na.omit(dflfi$rl_out_m_id)) + 0.001*(10^2) + 0.042*mean(na.omit(dflfi$rl_out_m_id^2))))

# At RL = 10 secs with other continuous variables set to zero 
exp(1.092 - 0.042*10 - 0.370*0 + 0.001*(10^2) + 0.042*0)/
  (1 + exp(1.092 - 0.042*10 - 0.370*0 + 0.001*(10^2) + 0.042*0))

# At RL = 20 secs 
exp(1.092 - 0.042*20 - 0.370*mean(na.omit(dflfi$rl_out_m_id)) + 0.001*(20^2) + 0.042*mean(na.omit(dflfi$rl_out_m_id^2)))/
  (1 + exp(1.092 - 0.042*20 - 0.370*mean(na.omit(dflfi$rl_out_m_id)) + 0.001*(20^2) + 0.042*mean(na.omit(dflfi$rl_out_m_id^2))))

# At RL = 20 secs with other continuous variables set to zero 
exp(1.092 - 0.042*20 - 0.370*0 + 0.001*(20^2) + 0.042*0)/
  (1 + exp(1.092 - 0.042*20 - 0.370*0 + 0.001*(20^2) + 0.042*0))

# At RL = 30 secs 
exp(1.092 - 0.042*30 - 0.370*mean(na.omit(dflfi$rl_out_m_id)) + 0.001*(30^2) + 0.042*mean(na.omit(dflfi$rl_out_m_id^2)))/
  (1 + exp(1.092 - 0.042*30 - 0.370*mean(na.omit(dflfi$rl_out_m_id)) + 0.001*(30^2) + 0.042*mean(na.omit(dflfi$rl_out_m_id^2))))

# At RL = 30 secs with other continuous variables set to zero 
exp(1.092 - 0.042*30 - 0.370*0 + 0.001*(30^2) + 0.042*0)/
  (1 + exp(1.092 - 0.042*30 - 0.370*0 + 0.001*(30^2) + 0.042*0))

# At RL = 40 secs 
exp(1.092 - 0.042*40 - 0.370*mean(na.omit(dflfi$rl_out_m_id)) + 0.001*(40^2) + 0.042*mean(na.omit(dflfi$rl_out_m_id^2)))/
  (1 + exp(1.092 - 0.042*40 - 0.370*mean(na.omit(dflfi$rl_out_m_id)) + 0.001*(40^2) + 0.042*mean(na.omit(dflfi$rl_out_m_id^2))))

# At RL = 40 secs with other continuous variables set to zero 
exp(1.092 - 0.042*40 - 0.370*0 + 0.001*(40^2) + 0.042*0)/
  (1 + exp(1.092 - 0.042*40 - 0.370*0 + 0.001*(40^2) + 0.042*0))

# Plot results by hand 

library(ggplot2)

plot_func <- function(b0, b1, b2, rl) {
  pp <- double(length(rl))
  for(i in seq_along(rl)) {
    pp[i] <- exp(b0 + b1*rl[i] + b2*rl[i]^2)/(1 + exp(b0 + b1*rl[i] + b2*rl[i]^2))
  }
  dftemp <- data.frame(rl, pp)
  return(dftemp)
}

dftemp <- plot_func(b0 = 1.092, b1 = -0.042, b2 = 0.001, rl = seq(0, 40, 1))

ggplot(dftemp, aes(x = rl, y = pp)) + 
  geom_line() + 
  scale_y_continuous(limits = c(.6, .8))

plot_func2 <- function(b0, b1, b2, rlc) {
  pp <- double(length(rlc))
  for(i in seq_along(rlc)) {
    pp[i] <- exp(b0 + b1*rlc[i] + b2*rlc[i]^2)/(1 + exp(b0 + b1*rlc[i] + b2*rlc[i]^2))
  }
  dftemp <- data.frame(rlc, pp)
  return(dftemp)
}

dftemp2 <- plot_func2(b0 = 1.092, b1 = -0.370, b2 = 0.042, rlc = seq(0, 15, 0.1))

ggplot(dftemp2, aes(x = rlc, y = pp)) + 
  geom_line() 








