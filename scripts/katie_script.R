library(tidyverse)
library(stringr)

# retrieve class survey data
url <- 'https://raw.githubusercontent.com/pstat197/pstat197a/main/materials/labs/lab2-tidyverse/data/'

background <- paste(url, 'background-clean.csv', sep = '') %>%
  read_csv()

interest <- paste(url, 'interest-clean.csv', sep = '') %>%
  read_csv()

metadata <- paste(url, 'survey-metadata.csv', sep = '') %>%
  read_csv()

view(background)
view(interest)

mergeddf <- inner_join(background, interest, by = "response_id")
view(mergeddf)

rsrchVsInterests <- mergeddf %>%
  select(response_id, rsrch, dom.y) %>%
  mutate(countOfInterests = str_count(dom.y, ";") + 1)


rsrchVsInterestsSummarized <- rsrchVsInterests %>%
  group_by(rsrch) %>%
  summarise(mean(countOfInterests), var(countOfInterests))

rsrchVsInterestsSummarized
# This led us to wonder, is the variance significant?
# conduct two tailed t test, see if there is significant difference

rsrch <- rsrchVsInterests %>%
  filter(rsrch = TRUE)

noRsrch <- rsrchVsInterests %>%
  filter(rsrch = FALSE)

rsrchPlot <- ggplot(data = rsrch, aes(x=countOfInterests)) + 
  geom_bar()

noRsrchPlot <- ggplot(data = noRsrch, aes(x=countOfInterests)) + 
  geom_bar()

