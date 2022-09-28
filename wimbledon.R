library(readr)
library(dplyr)
library(ggplot2)
library(stringr)
wimbledon_winners <- read.csv('C:/Users/itsad/Downloads/wimbledons_champions.csv', header = T)

head(wimbledon_winners)

#select the relevant columns
wimbledon<- subset(select(wimbledon_winners, 1:10))
str(wimbledon)

#renaming the first column
wimbledon %>%
  rename('Gender' = 'ï..Gender') %>%
  ggplot(aes(Champion.Nationality))+
  geom_bar()+
  theme(axis.text.x= element_text(angle= 45, vjust = 1, hjust= 1),
        axis.ticks.y= element_blank(), 
        panel.grid.minor.y = element_line(color = 'black'),
        panel.grid = element_blank(),
        panel.background = element_blank(),
        plot.title = element_text(size = 10))+# for rotating axis labels
  labs(title = 'Nationality of Wimbledon Champions', x= 'Nationality', caption = 'Source: Kaggle.com')

wimbledon<- wimbledon %>% 
  rename('Gender' = 'ï..Gender')

#replacing strings with another string
wimbledon$Champion[wimbledon$Champion== 'S.J. Williamsms']<- 'S. Williams'
wimbledon$Champion[wimbledon$Champion== 'S.J. Williams']<- 'S. Williams'
View(wimbledon)

#exporting csv
write.csv(wimbledon, 'C:\\Users\\itsad\\Downloads\\wimbledon.csv', row.names = FALSE)  
