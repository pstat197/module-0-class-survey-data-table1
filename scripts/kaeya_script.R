
background <- read.csv("/Users/kaeya/PSTAT 197A/module-0-class-survey-data-table1/data/background-clean.csv")
interest <- read.csv("/Users/kaeya/PSTAT 197A/module-0-class-survey-data-table1/data/interest-clean.csv")

head(background)
names(background)

backgroundcs16 <- background[, c("CS16", "prog.prof")]
backgroundcs16

backgroundcs16$prog.prof <- as.numeric(c(factor(backgroundcs16$prog.prof,
                                                level=c("beg", "int", "adv"),
                                                labels = c(1,2,3))))

cor(backgroundcs16$CS16, backgroundcs16$prog.prof, method = "pearson")
cor(backgroundcs16$CS16, backgroundcs16$prog.prof, method = "spearman")

t.test(prog.prof ~ CS16, data = backgroundcs16)

table(backgroundcs16$CS16, backgroundcs16$prog.prof)
chisq.test(table(backgroundcs16$CS16, backgroundcs16$prog.prof))




backgroundcs9 <- background[, c("CS9", "prog.prof")]
backgroundcs9

backgroundcs9$prog.prof <- as.numeric(c(factor(backgroundcs9$prog.prof,
                                                level=c("beg", "int", "adv"),
                                                labels = c(1,2,3))))

cor(backgroundcs9$CS9, backgroundcs9$prog.prof, method = "pearson")
cor(backgroundcs9$CS9, backgroundcs9$prog.prof, method = "spearman")

t.test(prog.prof ~ CS9, data = backgroundcs9)

table(backgroundcs9$CS9, backgroundcs9$prog.prof)
chisq.test(table(backgroundcs9$CS9, backgroundcs9$prog.prof))



