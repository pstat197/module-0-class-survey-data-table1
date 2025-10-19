
background <- read.csv("/Users/kaeya/PSTAT 197A/module-0-class-survey-data-table1/data/background-clean.csv")
interest <- read.csv("/Users/kaeya/PSTAT 197A/module-0-class-survey-data-table1/data/interest-clean.csv")

head(background)
names(background)

backgroundcs16 <- background[, c("CS16", "prog.prof", "prog.comf")]
backgroundcs16
clean <- backgroundcs16[backgroundcs16$CS16 == 1,]
clean





