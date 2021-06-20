getwd()

dfl <- readRDS("./data/dfl.Rda")

head(dfl)

# MT02_01: Surveys important to science, ... -> mot1
# MT02_02: Find results interesting          -> mot2
# MT02_03: Results are correct               -> mot3

library(psych)

mot_df <- data.frame(dfl$mot1, dfl$mot2, dfl$mot3)

alpha(mot_df)
