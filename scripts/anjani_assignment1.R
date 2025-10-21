# do students with research experience (rsrch = TRUE) tend to
## be more comfortable with programming?
### 'comfortable' means 4 <= prog.comf <= 5

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

# numerical comparisons for comfort with programming

new_merge_df <- merge_df %>% 
  mutate(comfortable = ifelse(prog.comf >= 4, TRUE, FALSE))

new_merge_df %>% 
  group_by(rsrch) %>% 
  summarize(prop_comfortable = mean(comfortable))

# gives us a proportion of students in each group feel comfortable
## with programming


