interest_data <- read.csv("~/Downloads/Courses/197/team_assignment_one/module-0-class-survey-data-table1/data/interest-clean.csv")

background_data <-read.csv("~/Downloads/Courses/197/team_assignment_one/module-0-class-survey-data-table1/data/background-clean.csv")

merged_data <- merge(interest_data, background_data, by = "response_id")

merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project <-
  ifelse(merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project %in%
           c("No preference", "I'm more interested in a research lab project"),
         1, 0)
merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project <-
  as.numeric(merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project)


#testing for all variables 

target <- "do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project"

results <- data.frame(variable = character(),
                      p_value = numeric(),
                      stringsAsFactors = FALSE)

for (var in names(merged_data)) {
  if (var != target && !is.numeric(merged_data[[var]])) {
    tbl <- table(merged_data[[var]], merged_data[[target]])
    if (all(dim(tbl) > 1)) {    
      test <- suppressWarnings(chisq.test(tbl))
      if (any(test$expected < 5)) test <- fisher.test(tbl)
      results <- rbind(results, data.frame(variable = var,
                                           p_value = test$p.value))
    }
  }
}

#print results. sorted by significance
results <- results[order(results$p_value), ]

cat("\n=== All Variables Tested (sorted by p-value) ===\n")
print(results)

#shows only ones with pvalue < 0.05
cat("\n=== Significant Associations (p < 0.05) ===\n")
print(subset(results, p_value < 0.05))

#this is to see what language actually prefers research lab project
cat("\n=== Preference distribution by programming language ===\n")
tbl <- table(
  merged_data$lang,
  merged_data$do_you_have_any_preference_regarding_working_on_an_industry_project_or_a_research_lab_project
)
print(prop.table(tbl, margin = 1))


