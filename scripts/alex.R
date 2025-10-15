interest_data <- read.csv("~/Downloads/Courses/197/team_assignment_one/module-0-class-survey-data-table1/data/interest-clean.csv")

background_data <-read.csv("~/Downloads/Courses/197/team_assignment_one/module-0-class-survey-data-table1/data/background-clean.csv")

merged_data <- merge(interest_data, background_data, by = "response_id")

merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project <-
  ifelse(merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project %in%
           c("No preference", "I'm more interested in a research lab project"),
         1, 0)
merged_data
merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project <-
  as.numeric(merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project)

head(merged_data)

str(merged_data)


tbl <- table(merged_data$prog.prof,
             merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project)
chisq.test(tbl)

tbl <- table(merged_data$math.prof,
             merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project)
chisq.test(tbl)
