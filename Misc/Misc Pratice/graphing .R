library(tidyverse)
data("starwars")
starwars %>%
  ggplot(aes(x=mass, y = skin_color, color=birth_year)) +
  geom_boxplot() +
  theme_grey()+ theme(axis.title.y = element_text(face ='bold',angle = 360 ))

data("cms_patient_experience")
cms_patient_care %>%
  ggplot(aes(x=ccn, y = score, color=facility_name)) +
  geom_point()+
  theme_bw()

ggplot(data = Formaldehyde, 
       mapping = aes(x = carb, 
                    y = optden)) +geom_point()
ggplot(faithful) +
  geom_histogram(aes(x=eruptions))

library(Lock5Data)
data("BaseballHits2019")
head(BaseballHits2019)
ggplot(data = BaseballHits2019, 
       aes(x = League, col = "green",)) + geom_bar(col = "blue")

ggplot(faithful) + geom_point(aes(x=eruptions, y = waiting), shape = 'triangle', alpha=0.5)

ggplot(faithful) + geom_histogram(aes(x = eruptions, fill = eruptions <3.1))
ggplot(faithful) + geom_histogram(aes(x = eruptions, fill = waiting < 60), postion = 'dodge', alpha= 0.5)

ggplot(faithful) +
  geom_point(aes(x=eruptions, y = waiting)) +
  geom_abline(slope = -30, intercept = 200)

library(cowsay)
cat(cow)

ggplot(mpg) + geom_bar(aes(x=class))
mpg_counted <- mpg %>% 
  count(class, name = 'count')
ggplot(mpg_counted) + geom_bar(aes(x= class, y = count), stat = 'identity')
ggplot(mpg_counted) + geom_col(aes(x=class, y = count))
ggplot(mpg) + geom_bar(aes(x=class, y = after_stat(100*count/ sum(count))))
ggplot(mpg) + geom_density(aes(x=hwy))
ggplot(mpg) + stat_count(aes(x=class))
ggplot(mpg) +
  geom_jitter(aes(x=class, y = hwy), width = 0.2) + 
  stat_summary(aes(x=class, y = hwy), fun= mean, geom = 'point', col = 'red')
ggplot(mpg) + geom_point(aes(x=displ, y= hwy, colour = class))
