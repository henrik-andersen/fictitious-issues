# --- 
# Response latency treatment 
# Henrik Andersen
# 14.09.2020 
# --- 

# Remove response latencies less than 0 seconds 
dfl$rl <- ifelse(dfl$rl < 0, NA, dfl$rl)

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