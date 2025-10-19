
# Question 3: Does having research experience influence the number of domains of interest?

# Loading in Data
library(readr)
library(dplyr)
library(stringr)
background <- read_csv('data/background-clean.csv')
interest <- read_csv('data/interest-clean.csv')

complete_data <- merge(background, interest, by = "response_id")

# Filter for students who have research experience
research <- complete_data %>% filter(rsrch == TRUE) %>% select(response_id, rsrch, dom.y)
research <- research %>% mutate(interest_count = str_count(dom.y, ";") + 1)
# Calculate Mean # of domains of interest
research %>% summarize(mean_interest_research = mean(interest_count))

View(research)

# Filter for students who do not have research experience
no_research <- complete_data %>% filter(rsrch == FALSE) %>% select(response_id, rsrch, dom.y)
no_research <- no_research %>% mutate(interest_count = str_count(dom.y, ";") + 1)
View(no_research)
# Calculate Mean # of domains of interest
no_research %>% summarize(mean_interest_no_research = mean(interest_count))

# Now let's look at the variance of these two! 
research %>% summarize(var_interest_research = var(interest_count))
no_research %>% summarize(var_interest_no_research = var(interest_count))

# The variance in the number of domains of interest for the research group is higher
# than that of the non-research group, but it is important to note that this may stem
# from the fact the there are more individuals who had done research (around double), 
# which could contribute to more variance

# Plot the number of domain interests and compare between the two populations
library(tidyverse)
research %>% ggplot(aes(x=interest_count)) +
  geom_bar() +
  ggtitle("Number of Domain Interests of Students with Research Experience")


no_research %>% ggplot(aes(x=interest_count)) +
  geom_bar() +
  ggtitle("Number of Domain Interests of Students with No Research Experience")

# Analysis:
# It appears that the research group has more of a bell shaped curve, skewed to the right,
# while the non-research group has a more uniform distribution


# possibly conduct t-test of the two means and see if there is a huge difference between the two 
t.test(research$interest_count, no_research$interest_count)

# Based on the t-test, there is no significant difference between the number of domains of
# interest between the research group and non-research group

