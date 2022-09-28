install.packages("dplyr")
library(gapminder)
library(dplyr)

#to do a pipe , use %>%#
gapminder

#filter verb - filter for the year 2002#
gapminder %>%
  filter(year == 2002)
#arrange verb - arrange gdppercap in descending order#
gapminder %>%
  arrange(desc(gdpPercap))

#filter and arrange#
gapminder %>%
  filter (year == 2002, continent == 'Africa') %>%
  arrange (desc(gdpPercap))

#mutate gdp#
gapminder %>%
  mutate(gdp= pop*gdpPercap)

#combine everything#
gapminder %>%
  filter(year==2002, continent=='Africa') %>%
  mutate(gdp= pop*gdpPercap) %>%
  arrange(desc(gdp))

#ggplots#
library(ggplot2)
ggplot(gapminder,aes(x=gdpPercap, y= lifeExp, color= continent, size= pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)

#summarize and plot#
by_year_continent<- gapminder %>%
  group_by(year, continent) %>%
  summarize(meanlifeExp= mean(lifeExp), meangdpPercap= mean(gdpPercap))

by_year_continent
ggplot(by_year_continent, aes(x=year, y= meangdpPercap, color= continent))+
  geom_line()+
  expand_limits(y=0)
#boxplots
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10()+
  ggtitle('Comparing GDP per capita across continents')



# from datacamp
# Set the color scale
palette <- brewer.pal(5, "RdYlBu")[-(2:4)]

# Add a title and caption
ggplot(gm2007, aes(x = lifeExp, y = country, color = lifeExp)) +
  geom_point(size = 4) +
  geom_segment(aes(xend = 30, yend = country), size = 2) +
  geom_text(aes(label = round(lifeExp,1)), color = "white", 
            size = 1.5) +
  scale_x_continuous("", expand = c(0,0), limits = c(30,90), 
                     position = "top") +
  scale_color_gradientn(colors = palette) +
  labs(title= 'Highest and lowest life expectancies, 2007', 
       caption= 'Source: gapminder')


plt_country_vs_lifeExp +
  theme_classic() +
  theme(axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text = element_text(color= 'black'),
        axis.title = element_blank(),
        legend.position = 'none')

global_mean <- mean(gm2007_full$lifeExp)
x_start <- global_mean + 4
y_start <- 5.5
x_end <- global_mean
y_end <- 7.5


plt_country_vs_lifeExp +  
  step_1_themes +
  geom_vline(xintercept = global_mean, color = "grey40", linetype = 3) +
  step_3_annotation +
  annotate(
    "curve",
    x = x_start, y = y_start,
    xend = x_end, yend = y_end,
    arrow = arrow(length = unit(0.2, "cm"), type = "closed"),
    color = "grey40"
  )
