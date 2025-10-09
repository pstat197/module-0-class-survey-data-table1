
# Question 3: Does having research experience influence the number of domains of interest?

library(readr)
library(dplyr)
library(stringr)
background <- read_csv('data/background-clean.csv')
interest <- read_csv('data/interest-clean.csv')

complete_data <- merge(background, interest, by = "response_id")

# Filter for students who have research experience
research <- complete_data %>% filter(rsrch == TRUE) %>% select(response_id, rsrch, dom.y)
research <- research %>% mutate(interest_count = str_count(dom.y, ";") + 1)
research %>% summarize(mean_interest_research = mean(interest_count))

View(research)

# Filter for students who do not have research experience
no_research <- complete_data %>% filter(rsrch == FALSE) %>% select(response_id, rsrch, dom.y)
no_research <- no_research %>% mutate(interest_count = str_count(dom.y, ";") + 1)
View(no_research)
no_research %>% summarize(mean_interest_no_research = mean(interest_count))

# Now let's look at the variance of these two! 
research %>% summarize(var_interest_research = var(interest_count))

no_research %>% summarize(var_interest_no_research = var(interest_count))



# Plot the number of domain interests and compare between the two populations

library(tidyverse)
research %>% ggplot(aes(x=interest_count)) +
  geom_bar() +
  ggtitle("Number of Domain Interests of Students with Research Experience")


no_research %>% ggplot(aes(x=interest_count)) +
  geom_bar() +
  ggtitle("Number of Domain Interests of Students with No Research Experience")




# possibly conduct t-test of the two means and see if there is a huge difference between the two 
