# --- 
# Barchart showing substantive responses to fictitious issues by experimental
# groups: speed vs. accuracy and implict vs. explicit DK 
# Henrik Andersen
# 14.09.2020
# --- 

# Packages

library(ggplot2)
library(tidyr)
library(dplyr)

# Read data 

# dfl <- readRDS(file = "../data/dfl.Rda")

# Preparation 

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
       caption = "Note: EC: Environmental Court, CAA: Coastal Aid Agency,\n PETI: Prague Energy Transition Initiative, GNF: German Nuclear Forum,\n HSF: Herbert-Schmaar-Foundation, WSA: World Space Agency") +
  scale_fill_discrete(name = "Experimental Group") +
  #theme(legend.justification = c(1, 1), legend.position = c(0.99, 0.99))
  theme(legend.position = "bottom")


