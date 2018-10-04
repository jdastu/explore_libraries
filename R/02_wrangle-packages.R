## remember to restart R here!

## create a data frame by reading from data/installed-packages.csv
library(tidyverse)
library(here)
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path
pck = read_csv(here("data/installed-packages.csv"))


## filter out the base and recommended packages
apt = pck %>% filter(!Priority %in% c('base', 'recommended')) %>% select(Package, Built)
## keep the variables Package and Built
## if you use dplyr, code like this will work:

## write this new, smaller data frame to data/add-on-packages.csv
apt %>% write_csv(here("data/add-on-packages.csv"))
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n)); apt_freqtable

## write this data frame to data/add-on-packages-freqtable.csv
apt_freqtable %>% write_csv(here('data/apt_freqtable.csv'))
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples
