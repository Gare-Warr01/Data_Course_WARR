library(tidyverse)
library(janitor)
library(readxl)

dat <- read.csv('./Data/Utah_Religions_by_County.csv')


dat %>% 
  select(~notthisone)

myorder <- dat %>% 
 clean_names() %>%
  pivot_longer(-c(county,pop_2010,religious),
               names_to = 'religion',
               values_to = 'proportion') %>%
  group_by(religion) %>%
  summarise(sum=sum(proportion)) %>%
  arrange(desc(sum))
myorder


dat %>%
  pivot_longer(-c(County,Pop_2010,Religious),
               names_to = 'religion',
               values_to = 'proportion') %>%
 mutate(religion=factor(religion, levels = myorder$religion)) %>%
  ggplot(aes(x = religion, y = porportion)) + geom_col() + facet_wrap(~county)
