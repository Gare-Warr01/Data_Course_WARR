library(Lock5Data)
data(StudentSurvey)
head(StudentSurvey)
table.f=table(StudentSurvey$Sex, StudentSurvey$Award)
table.f
two.way.table=addmargins(table.f);two.way.table
popul=max(two.way.table[3, 1:3])
popul
phat=popul/two.way.table[3,4]; phat
barplot(table.f)
table.f.a=table(StudentSurvey$Award, StudentSurvey$Sex)
barplot(table.f.a)
