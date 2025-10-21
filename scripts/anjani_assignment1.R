# do students with research experience (rsrch = TRUE) tend to
## be more comfortable with programming?

library(readr)
library(dplyr)
library(tidyverse)


background <- read_csv('data/background-clean.csv')
interest <- read_csv('data/interest-clean.csv')

merge_df <- merge(background, interest, by='response_id')

view(merge_df)

rsrch_yes <- merge_df %>% 
  filter(rsrch == TRUE) %>% 
  select(prog.comf)

view(rsrch_yes)

rsrch_no <- merge_df %>% 
  filter(rsrch == FALSE) %>% 
  select(prog.comf)

view(rsrch_no)

# defining our two distinct populations: those with research and
## those without research

rsrch_yes %>% 
  summarize(prop.prog.comf = mean(prog.comf),
            med.comf = median(prog.comf))

rsrch_no %>% 
  summarize(prop.prog.comf = mean(prog.comf),
            med.comf = median(prog.comf))

# numerical comparisons for comfortability