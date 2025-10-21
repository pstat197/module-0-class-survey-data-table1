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
