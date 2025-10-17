library(readr)
bg <- read.csv("C:/Users/prasa/Desktop/ds/pstat197/197a/module_0/module-0-class-survey-data-table1/data/background-clean.csv")
head(bg)

bg_cs9 <- bg[, c("CS9","prog.comf")]
bg_cs9

cor(bg_cs16$CS16, bg_cs16$prog.comf, method = "pearson")
cor(bg_cs16$CS16, bg_cs16$prog.comf, method = "spearman")

t.test(prog.comf ~ CS16, data = bg_cs16)

x <- table(bg_cs16$CS16, bg_cs16$prog.comf)
chisq.test(table(x))

bg_cs9 <- bg[, c("CS9","prog.comf")]
bg_cs9

cor(bg_cs9$CS9, bg_cs9$prog.comf, method = "pearson")
cor(bg_cs9$CS9, bg_cs9$prog.comf, method = "spearman")

t.test(prog.comf ~ CS9, data = bg_cs9)

x <- table(bg_cs9$CS9, bg_cs9$prog.comf)
chisq.test(table(x))
