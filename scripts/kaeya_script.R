
# Question: Is self rated programming proficiency levels related to taking CS9 or CS16? 

#Upload Data
background <- read.csv("/Users/kaeya/PSTAT 197A/module-0-class-survey-data-table1/data/background-clean.csv")
interest <- read.csv("/Users/kaeya/PSTAT 197A/module-0-class-survey-data-table1/data/interest-clean.csv")

head(background)
names(background)


# ANALYZE TAKING CS16 (OR NOT) AND SELF RATED PROGRAMMING PROFICIENCY

# clean data
backgroundcs16 <- background[, c("CS16", "prog.prof")]
backgroundcs16

# convert to programming prof to numeric values
backgroundcs16$prog.prof <- as.numeric(c(factor(backgroundcs16$prog.prof,
                                                level=c("beg", "int", "adv"),
                                                labels = c(1,2,3))))


# find correlation value --> .19, weak positive relationship
cor(backgroundcs16$CS16, backgroundcs16$prog.prof)

# chi sq test --> pval = .34 --> not statistically significant
table(backgroundcs16$CS16, backgroundcs16$prog.prof)
chisq.test(table(backgroundcs16$CS16, backgroundcs16$prog.prof))

# create plot
backgroundcs16 <- backgroundcs16 %>%
  mutate(
    CS16 = factor(CS16, levels = c(0, 1)),
    prog.prof = factor(prog.prof, levels = c(1, 2, 3))
  )

counts <- backgroundcs16 %>%
  count(CS16, prog.prof)

ggplot(counts, aes(x = CS16, y = n, fill = prog.prof)) +
  geom_col(position = position_dodge(width = 0.8), width = 0.7) +
  scale_fill_manual(values = c("#b9cfed", "#728eb5", "#203654")) +
  labs(
    title = "Programming Proficiency by CS16 Participation",
    x = "CS16 Taken",
    y = "Number of Students",
    fill = "Proficiency Level"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.position = "top"
  )



# ANALYZE TAKING CS9 (OR NOT) AND SELF RATED PROGRAMMING PROFICIENCY

# clean data
backgroundcs9 <- background[, c("CS9", "prog.prof")]
backgroundcs9

# convert to programming prof to numeric values
backgroundcs9$prog.prof <- as.numeric(c(factor(backgroundcs9$prog.prof,
                                                level=c("beg", "int", "adv"),
                                                labels = c(1,2,3))))

# find correlation value --> .05, very weak positive relationship
cor(backgroundcs9$CS9, backgroundcs9$prog.prof)

# chi sq test --> pval = .69 --> not statistically significant
table(backgroundcs9$CS9, backgroundcs9$prog.prof)
chisq.test(table(backgroundcs9$CS9, backgroundcs9$prog.prof))

# create plot
backgroundcs9 <- backgroundcs9 %>%
  mutate(
    CS9 = factor(CS9, levels = c(0, 1)),
    prog.prof = factor(prog.prof, levels = c(1, 2, 3))
  )

counts <- backgroundcs9 %>%
  count(CS9, prog.prof)

ggplot(counts, aes(x = CS9, y = n, fill = prog.prof)) +
  geom_col(position = position_dodge(width = 0.8), width = 0.7) +
  scale_fill_manual(values = c("#b9cfed", "#728eb5", "#203654")) +
  labs(
    title = "Programming Proficiency by CS9 Participation",
    x = "CS9 Taken",
    y = "Number of Students",
    fill = "Proficiency Level"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.position = "top"
  )

hi



