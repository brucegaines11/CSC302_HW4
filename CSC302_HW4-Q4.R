library(tidyverse)
library(ggplot2) 
install.packages('ggridges')
library(ggridges) 
library(lubridate) 
library(ggrepel) 
library(colorspace)
library(dplyr)

#put your folder's path inside quotes below 
folder_location='C:/users/brgaines11.UMR00t/Documents/CSC302'

setwd(folder_location)

load("./preprint_growth.rda") 

head(preprint_growth)

preprint_growth %>% filter(archive == "bioRxiv") %>%
  filter(count > 0) -> biorxiv_growth

head(biorxiv_growth)

preprints<-preprint_growth %>% filter(archive %in% c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")) %>%filter(count > 0) %>% 
  
  head(preprints)

preprints_final <- filter(preprints, date == ymd("2017-01-01"))

ggplot(preprints) + aes(date, count, color = archive, fill = archive) +
  geom_line(size = 1) + scale_y_continuous(limits = c(0, 600), expand = c(0, 0)
         name = "preprints / month", sec.axis = dup_axis( #this part is for the second y axis
           breaks = preprints_final$count, #and we use the counts to position our labels 
           labels = c("arXivq-bio", "PeerJPreprints", "bioRxiv"),
           name = NULL)
  )+
  scale_x_date(name = "year",
               limits = c(min(biorxiv_growth$date), ymd("2017-01-01"))) +
  scale_color_manual(values = c("#0072b2", "#D55E00", "#009e73"),
                     name = NULL) +
  theme(legend.position = "none")

#######################################################################################################
      
#changes for Q4 in HW4:

preprints_final <- filter(preprints, date == ymd("2017-01-01"))

ggplot(preprints) + aes(date, count, color = archive, fill = archive, shape = archive) +
  geom_line(size = 1) + scale_y_continuous(limits = c(0, 600), expand = c(0, 0),
           name = "preprints / month",  
           sec.axis = dup_axis(
             breaks = preprints_final$count,
             labels = c("arXiv\nq-bio", "PeerJ\nPreprints", "bioRxiv"),
             name = NULL)
  )+
  scale_x_date(name = "year", limits = c(ymd("2015-01-01"), ymd("2017-01-01")), #change start date to 2015
               expand = expand_scale(mult = c(0.02, 0))) +
  scale_color_manual(values = c("#702082", "#00B2A9", "#655A52"), #changed colors
                     name = NULL) +
  scale_fill_manual(values = c("#702082", "#00B2A9", "#655A52"),
                    name = NULL) +
  scale_shape_manual(values = c(21, 22, 23),
                     name = NULL) +
  coord_cartesian(clip = "off") +
  theme(legend.position = "none") +
  theme(axis.line.y.right = element_blank(),
        axis.ticks.y.right = element_blank(),
        axis.text.y.right = element_text(margin = margin(0, 0, 0, 0)),
        plot.margin = margin(14, 7, 3, 1.5))