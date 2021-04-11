library(dplyr)
setwd("~/R/R nhkim/usd_data")
chicago = readRDS("~/R/R nhkim/usd_data/chicago.rds")
str(chicago)

# select()

names(chicago)[1:3]
subset = select(chicago, city:dptp)
head(subset)
# drop variables with -
select(chicago, -(city:dptp))
# equivalent code in base R
i = match("city", names(chicago))
j = match("dptp", names(chicago))
head(chicago[, -(i:j)])
# ends_with(), starts_with() 활용
subset = select(chicago, ends_with("2"))
str(subset)
subset = select(chicago, starts_with("d"))
str(subset)

# filter()

chic.f = filter(chicago, pm25tmean2 > 30)
str(chic.f)

filter(chicago, pm25tmean2 > median(pm25tmean2, na.rm = T))
# Multiple criteria
filter(chicago, (pm25tmean2 > 30 | pm10tmean2 > 30)) # 왜 pm25tmean 값이 NA인가?
filter(chicago, pm25tmean2 > 30 & pm10tmean2 > 30)
# Multiple arguments are equivalent to "and"
filter(chicago, pm25tmean2 >= median(pm25tmean2, na.rm = T),
       pm25tmean2 <= quantile(pm25tmean2, probs = 0.75, na.rm = T))
filter(chicago, between(pm25tmean2, median(pm25tmean2, na.rm = T),
                        quantile(pm25tmean2, probs = 0.75, na.rm = T)))

# arrange()
chicago = arrange(chicago, date)
# check the first 3 rows
head(select(chicago, date, pm25tmean2), 3)
# and the last 3 rows
tail(select(chicago, date, pm25tmean2), 3)
# desc(): 내림차순 정렬
chicago = arrange(chicago, desc(date))
# order와 비교
head(arrange(chicago, desc(pm25tmean2), desc(pm10tmean2)))
head(chicago[order(chicago$pm25tmean2, chicago$pm10tmean2
                   ,decreasing = c(T, T)),])

# rename()

chicago = rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3)

# base R
names(chicago)
names(chicago)[c(3, 5)] = c("dewpoint", "pm25")
head(chicago)

# base R
chicago = transform(chicago, dptp = dewpoint, pm25teman2 = pm25)
chicago$dptp = NULL
chicago$pm25tmean2 = NULL
head(chicago)

# mutate()
head(mutate(chicago,
            pm25_m = mean(pm25, na.rm = T),
            pm25detrend = pm25 - pm25_m), 3)
# transmute() 함수: mutate()와 유사하지만 변경되지 않은 변수는 모두 제거
head(transmute(chicago,
               pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = T),
               o3detrend = o3tmean2 - mean(o3tmean2, na.rm = T)), 3)
# transform() 함수: 새로 만든 열을 같은 함수 안에서 바로 사용할 수 없음
head(transform(chicago,
               pm25detrend = pm25 - mean(pm25, na.rm = T)), 3)

# group_by_summarize()

chicago = mutate(chicago, year = as.POSIXlt(date)$year + 1900)
years = group_by(chicago, year)
summarize(years, pm25 = mean(pm25, na.rm = T),
          o3 = max(o3tmean2, na.rm = T),
          no2 = median(no2tmean2, na.rm = T))
qq = quantile(chicago$pm25, seq(0, 1, 0.2), na.rm = T)
qq
chicago = mutate(chicago, pm25.quint = cut(pm25, qq))
head(chicago, 3)
quint = group_by(chicago, pm25.quint)
quint
summarize(quint, o3 = mean(o3tmean2, na.rm = T),
          no2 = mean(no2tmean2, na.rm = T))

# %>% : pipeline operator

mutate(chicago, pm25.quint = cut(pm25, qq)) %>%
  group_by(pm25.quint) %>%
  summarize(o3 = mean(o3tmean2, na.rm=T),
            no2 = mean(no2tmean2, na.rm = T))
mutate(chicago, month = as.POSIXlt(date)$mon + 1) %>%
  group_by(month) %>%
  summarize(pm25 = mean(pm25, na.rm =T),
            o3 = max(o3tmean2, na.rm = T),
            no2 = median(no2tmean2, na.rm = T))
