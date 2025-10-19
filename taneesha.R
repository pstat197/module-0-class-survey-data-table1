# Question: Is self rated programming proficiency levels related to taking CS9 or CS16? 

library(readr)
bg <- read.csv("C:/Users/prasa/Desktop/ds/pstat197/197a/module_0/module-0-class-survey-data-table1/data/background-clean.csv")
head(bg)

# clean data cs16
bg_cs16 <- bg[, c("CS16","prog.comf")]
bg_cs16

# correlation --> 0.37 moderately weak
cor(bg_cs16$CS16, bg_cs16$prog.comf)

# chi square test: p-val = 0.99 --> very significant, fail to reject null
x <- table(bg_cs16$CS16, bg_cs16$prog.comf)
chisq.test(table(x))

# plot
ggplot(bg_cs16, aes(x = as.factor(CS16), fill = as.factor(prog.comf))) +
  geom_bar(position = "dodge") +
  labs(x = "Took CS16", y = "Count", fill = "Programming Comfort") +
  theme_minimal()


# clean data cs9
bg_cs9 <- bg[, c("CS9","prog.comf")]
bg_cs9

# correlation --> -0.17
cor(bg_cs9$CS9, bg_cs9$prog.comf)

# chi square test: p-val = 0.99 --> very high
x <- table(bg_cs9$CS9, bg_cs9$prog.comf)
chisq.test(table(x))

# plot data
ggplot(bg_cs9, aes(x = as.factor(CS9), fill = as.factor(prog.comf))) +
  geom_bar(position = "dodge") +
  labs(x = "Took CS9", y = "Count", fill = "Programming Comfort") +
  theme_minimal()