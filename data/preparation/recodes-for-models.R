# --- 
# Recode some variables for use in the multilevel models 
# Henrik Andersen 
# 14.09.2020 
# --- 

# Packages

# xxx 

# Read data 

# getwd()
# dfl <- readRDS(file = "./data/dfl.Rda")

# Recodes 

dfl$oppr <- abs(dfl$opp - 6)

dfl$age <- 2020 - dfl$yob

dfl$polint_c <- dfl$polint - mean(na.omit(dfl$polint))
dfl$lr_c <- dfl$lr - mean(na.omit(dfl$lr))
dfl$nsa_c <- dfl$nsa_scale - mean(na.omit(dfl$nsa_scale))
dfl$age_c <- dfl$age - mean(na.omit(dfl$age))

dfl$rl_log_c <- dfl$rl_log - mean(na.omit(dfl$rl_log))
dfl$rl_ext_c <- dfl$rl_ext - mean(na.omit(dfl$rl_ext))




