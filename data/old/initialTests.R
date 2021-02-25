# Title:  Preliminary tests pseudo opinions paper    
# Author: Henrik Andersen 
# Date:   10.07.2020 

# Set language to English 
Sys.setenv(LANG = "en")

# Start fresh
rm(list = ls())


# Packages ----------------------------------------------------------------

library(tidyr)
library(dplyr)
library(ggeffects)
library(ggplot2)
library(lme4)


# Setup -------------------------------------------------------------------

# Working directory
setwd("D:/Henrik/Seafile/Meine Bibliothek/Henrik Jochen/Papers/SD Papers/SD Projekt Daten Henrik/Articles/Fictitious Issues/Analysis/Data")

# Prepared data 
dfl <- readRDS(file = "dfl.Rda")

# Remove non-FI items - have to consider later whether this is appropriate
# For now, just find out why the barplot isn't working anymore 

# dfl <- dfl[dfl$fi == 1, ]

# Descriptive barplot -----------------------------------------------------

# Recode response column into numeric. 1 = substantive, 0 = don't know  
dfl$response_num <- as.numeric(dfl$response) - 1

dflSummary <- dfl %>%
  filter(is.na(response_num) == FALSE, fi == 1) %>%
  group_by(exp, item) %>%
  summarise(value = sum(response_num)/n())

# Plot 
ggplot(dflSummary, aes(x = item, y = value)) + 
  geom_bar(aes(fill = exp), stat = "identity", position = "dodge", color = "black") + 
  labs(x = "Item", y = "Substantive answers (%)", caption = "Note: EC: Environmental Court, CAA: Coastal Aid Agency,\n PETI: Prague Energy Transition Initiative, GNF: German Nuclear Forum,\n HSF: Herbert-Schmaar-Foundation, WSA: World Space Agency") + 
  scale_x_discrete(labels = c("EC", "CAA", "PETI", "GNF", "HSF", "WSA")) +
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, .2)) +
  scale_fill_discrete(name = "Experimental Group") +
  theme_classic() +
  theme(legend.justification = c(1, 1), legend.position = c(1, 1))
# scale_fill_brewer(name = "Treatment group", palette = "OrRd") +

# For the rest of the analysis, look at just fi == 1
dfl <- dfl[dfl$fi == 1, ]

head(dfl, n = 30)
