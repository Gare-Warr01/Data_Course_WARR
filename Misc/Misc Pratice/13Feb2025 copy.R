dir.create('./Figures')
p1 <- 
iris %>% 
  ggplot(aes(x=Sepal.Length, y = Petal.Width)) +
  geom_point()

ggsave(p1,
       filename = './Figures/basic_plot.png',
       width = 6, 
       height = 6,
       dpi = 300)

# Clean Data 
table1 
table2
table3
table4a
table4b

table3 %>% 
  separate(rate, into = c('Cases', 'Population'), convert = TRUE)
table5 %>%
  separate(rate, into = c('Cases', 'Population'), convert = TRUE) %>%
  mutate(year = paste0(century,year) %>% as.numeric) %>%
  select(-century)
table2 %>%
  pivot_wider(names_from = type, values_from = count)
table4c <-
table4a %>%
  pivot_longer(cols = c('1999', '2000'),
               names_to = 'Year',
               values_to = 'Cases',
               names_transform = as.numeric)
table4d <-
table4b %>%
  pivot_longer(cols = c('1999', '2000'),
               names_to = 'Year',
               values_to = 'Population',
               names_transform = as.numeric)
full_join(table4c, table4d)