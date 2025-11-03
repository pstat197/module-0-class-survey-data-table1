
background <- read.csv("data/background-clean.csv")
interest <- read.csv("data/interest-clean.csv")

merge_df <- merge(interest, background, by = "response_id")

unique(merge_df$stat.comf)
merge_df$prog.prof <- factor(merge_df$prog.prof, levels = c("beg", "int", "adv"), ordered = TRUE)
merge_df$prog.comf <- factor(merge_df$prog.comf, levels = c("1","2","3","4","5" ), ordered = TRUE)
merge_df$math.prof <- factor(merge_df$math.prof, levels = c("beg", "int", "adv"), ordered = TRUE)
merge_df$math.comf <- factor(merge_df$math.comf, levels = c("1","2","3","4","5" ), ordered = TRUE)
merge_df$stat.prof <- factor(merge_df$stat.prof, levels = c("beg", "int", "adv"), ordered = TRUE)
merge_df$stat.comf <- factor(merge_df$stat.comf, levels = c("1","2","3","4","5" ), ordered = TRUE)
merge_df$updv.num <- factor(merge_df$updv.num, levels = c("0-2","3-5","6-8","9+" ), ordered = TRUE)


nominal_vars <- c("dom.y","PSTAT100",	"PSTAT115",	"PSTAT120",	"PSTAT122",	"PSTAT126",	"PSTAT131",	"PSTAT160",	"PSTAT174",	"CS9", "CS16", "LING104",	"LING110","LING111","CS130",	"CS165","ECON145","PSTAT127",	"PSTAT134", "CS5","rsrch", "lang" ) 
merge_df[nominal_vars] <- lapply(merge_df[nominal_vars], factor)

final_df <- merge_df[, !(names(merge_df) %in% c("type", "dom.x", "area"))]




