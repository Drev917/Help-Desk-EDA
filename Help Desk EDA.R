# authors: Drew Barton, Jake Pagels, Chris Calvo

library(readxl)
help.desk = read_excel("Help Desk.xlsx")
View(help.desk)

# check whether data set has any null values
sum(is.na(help.desk))
names(help.desk)

# as the number of calls cannot be negative in a given period, recoding values to 0
help.desk$`Number of Calls`[help.desk$`Number of Calls` < 0] = 0

# recoded "Tue" values to "Tues" to create uniformity
help.desk$Day[help.desk$Day == "Tue"] = "Tues"

View(help.desk)

summary(help.desk)
str(help.desk)

avg.total.calls = mean(help.desk$`Number of Calls`); avg.total.calls

library(dplyr)
help.desk %>% 
  group_by(Day) %>%
  arrange(desc(Day)) %>%
  summarize('Number of Calls' = sum(`Number of Calls`))

# given the average number of calls/employee/two-hour shift is 17
avg.calls.per.empl = round(mean(help.desk$`Number of Calls`) / 17); avg.calls.per.empl

hd1 = data.frame(help.desk)
str(hd1)

# create new column with employee need
hd1["Employee Need"] = round(hd1[,3] / avg.calls.per.empl); head(hd1)

# slicing original help.desk data set and transposing columns into rows by hour slots
help.desk.mon = t(help.desk[1:12,c("Number of Calls")])
help.desk.tues = t(help.desk[13:24,c("Number of Calls")])
help.desk.wed = t(help.desk[25:36,c("Number of Calls")]) 
help.desk.thur = t(help.desk[37:48,c("Number of Calls")]) 
help.desk.fri = t(help.desk[49:60,c("Number of Calls")])
help.desk.names = t(help.desk[1:12,c("Hour")])

# creating new dataframe via rbind in order to better visualize data
hd2 = data.frame(rbind(help.desk.mon,help.desk.tues,
                       help.desk.wed,help.desk.thur,help.desk.fri), stringsAsFactors=FALSE)
colnames(hd2) = help.desk.names
rownames(hd2) = c("Monday Calls","Tuesday Calls","Wednesday Calls","Thursday Calls","Friday Calls")
# each column has 5 rows now allowing full data set to be viewed with head() function
View(hd2)

# Average Daily Call Volume
View(rowSums(hd2, na.rm = FALSE))

#average calls by day & hour
avg.calls.by.day = rowMeans(hd2[,1:12]); View(avg.calls.by.day)
avg.calls.by.shift = colMeans(hd2[,1:12]); View(avg.calls.by.shift)

staff.by.day = round(avg.calls.by.day / 17); View(staff.by.day)
staff.by.shift = round(avg.calls.by.shift / 17); View(staff.by.shift)

# average call volume for rest of week + total
View(hd2[-1,10:12])
View(t(colSums(hd2[-1,10:12])))

#visualize categorical data in hd2
barplot(avg.calls.by.day, main = "Daily Average Calls", xlab = "Days", ylab = "Avg. Frequency",
        col = "lightsteelblue3", ylim = range(pretty(c(0,700))))
barplot(avg.calls.by.shift, main = "Average Calls per 2 Hour Shift", xlab = "2 Hour Time Shifts", ylab = "Avg. Frequency",
        col = "darkslategray3", ylim = range(pretty(c(0,800))))
