setwd("~/R/R nhkim/usd_data")
batter <- read.csv('batter.csv')
batter

# 모든 야구팀명을 오름차순으로 정렬한 결과를 구하시오.

library(sqldf)
sqldf('select team from batter order by team',
      drv = "SQLite")
as.matrix(sort(batter$team))

# 팀별 가장 홈런(no_home)을 많이 친 선수의 이름과 홈런수, 팀명을 구하시오.

library(doBy)
library(dplyr)
sqldf('select name, team, max(no_home) from batter group by team',
      drv = 'SQLite')
no_home_m <- aggregate(no_home ~ team, batter, FUN=max)
merge(no_home_m, batter, all.x=TRUE)[c('name', 'no_home', 'team')]

# 포지션별 평균 연봉(salary)을 구하시오.

sqldf('select position, avg(salary) from batter group by position',
      drv = "SQLite")
tapply(batter$salary, batter$position, mean, na.rm=T)

# 연봉이 NULL값일 때 0으로 변경하시오.

sqldf('update batter set "salary"=0 where "salary" is null',
      drv = 'SQLite')
batter2 <- batter
batter2$salary[is.na(batter2$salary)] <- 0
batter_m <- as.matrix(batter$salary)
batter2_m <- as.matrix(batter2$salary)
cbind(batter$salary, batter2$salary)

# league가 American이고 division이 West인 선수와 팀명을 구하시오.

sqldf('select name, team from batter where league = "American" and division = "West"',
      drv='SQLite')
filter(batter, league == 'American', division == 'West')[,c('name', 'team', 'league', 'division')]

# 팀별 연봉이 600이상인 선수들의 숫자를 구하시오.

sqldf('select team, count(name) from batter where salary >= 600 group by team',
      drv = "SQLite")
batter %>% group_by(team) %>% 
  filter(salary >= 600) %>% summarize(count = n())

# division이 East인 팀에서 타율이 0.3이상인 선수들의 숫자를 구하시오.

sqldf('select count(name) from batter where no_hits/no_atbat >= 0.3 and division = "East"',
      drv = "SQLite")
batter$no_hits <- as.numeric(batter$no_hits)
batter$no_atbat <- as.numeric(batter$no_atbat)
batter %>% group_by(division) %>%
  filter(division == 'East', no_hits / no_atbat >= 0.3) %>% summarize(count = n())
