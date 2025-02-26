library(tidyverse)
library(skimr)
library(janitor)

dat <- read.csv('./Data/Bird_Measurements.csv') %>% clean_names()
skim(dat)
dat2 <-
  dat %>% 
  clean_names()
dat2

names(dat)
male <- 
  dat %>%
  select(-ends_with('_n')) %>%
  select(family,species_name,english_name,clutch_size,egg_mass,mating_system,starts_with('m_'))%>%
  mutate(sex = 'Male')
names(male) <- names(male) %>% str_remove('^m_')

female <- 
  dat %>%
  select(-ends_with('_n')) %>%
  select(family,species_name,english_name,clutch_size,egg_mass,mating_system,starts_with('f_'))%>%
  mutate(sex = 'Female')
names(female) <- names(female) %>% str_remove('^f_')

unsexed <- 
  dat %>%
  select(-ends_with('_n')) %>%
  select(family,species_name,english_name,clutch_size,egg_mass,mating_system,starts_with('unsexed_'))%>%
  mutate(sex = 'unsexed')
names(unsexed) <- names(unsexed) %>% str_remove('^unsexed_')

names(male)
names(female) 
names(unsexed)

dat <- 
  male %>%
  full_join(female) %>%
  full_join(unsexed)

