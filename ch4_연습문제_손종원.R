# Practice 방법-1

colname = c("이름", "성별", "근무지", "연봉.만원")
produce = read.csv("produce.csv", stringsAsFactors =T, header = F, col.names = colname, na.strings = "blank")
produce
str(produce)
produce$이름 <- as.character(produce$이름)
produce
str(produce)

produce_df = produce[3:15,  ]
produce_df

save(produce_df, file = "produce.RData")
load("produce.RData")
produce_df

# Practice 방법-2

colname = c("이름", "성별", "근무지", "연봉.만원")
produce = read.csv("Produce.csv", header = F, col.names = colname,
                   stringsAsFactors = T, na.strings = "blank",
                   skip = 2, nrow = 13)
produce
str(produce)
produce$이름 = as.character(produce$이름)
str(produce)

save(produce, file = "produce_2.RData")
load("produce_2.RData")
produce
