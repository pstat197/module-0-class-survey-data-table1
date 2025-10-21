# do students with research experience (rsrch = TRUE) tend to
## be more comfortable with programming?
### 'comfortable' means 4 <= prog.comf <= 5

library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)


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

# two-sample proportion test to see if difference is
## statistically significant

ct <- table(new_merge_df$rsrch, new_merge_df$comfortable)
prop.test(ct)

'
output shows p-value = 1, prop 1 estimate = 0.3529412, 
prop 2 estimate = 0.3125000, 95% CI: -0.278 to 0.359.

Interpretation: This analysis intended to determine whether there
was a statistically significant difference between how
comfortable PSTAT 197A students are with programming
depending on whether they have prior experience with 
#research (rsrch = TRUE) or not (rsrch = FALSE). I defined comfortable to mean self-reported
scores of either a 4 or 5 in the category.

H_0: There is no difference in programming comfort between students with
and without research experience.

From the above output, we can see that there was 
a very small overall difference in proportions for this statistic,
with about 35.29% of researchers feeling comfortable with programming
vs. 31.25% for those who havent done research. Additionally,
the p-value of 1 (a > 0.05) tells us that there is no statistically
significant difference between the populations. A p-value being as high
as 1 tells us that variation in the two groups is fairly likely 
due to random chance. Finally, the confidence interval of -0.278
to 0.359 includes 0, also confirming that there is no meaningful
difference. Therefore, we fail to reject the null hypothesis.
'

# visualization

new_merge_df %>%
  group_by(rsrch) %>% 
  summarize(prop_comfortable = mean(comfortable)) %>% 
  ggplot(aes(x=rsrch, y=prop_comfortable, fill=rsrch)) +
  geom_col() +
  scale_y_continuous(labels = scales::percent_format()) +
              labs(
                title = 'proportion of students comfortable with programming',
                x = 'research experience',
                y = 'proportion') +
  theme_minimal()

