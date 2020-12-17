## ----setup, include=FALSE---------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(purl = TRUE)


## ----include=FALSE, message = FALSE-----------------------------------------------
library(DBI)
library(RSQLite)
library(ggplot2)
library(GGally)

db = dbConnect(SQLite(), "lahman2013.sqlite")


# Question 1
## ---- echo = TRUE-----------------------------------------------------------------
# get years data from batting table
numyears_batting = dbGetQuery(db, 
    "SELECT
      'Batting' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      Batting;")


## ----echo=FALSE-------------------------------------------------------------------
# get years data from pitching table
numyears_pitching = dbGetQuery(db, 
    "SELECT
      'Pitching' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      Pitching;")

# get years data from fielding table
numyears_fielding = dbGetQuery(db, 
    "SELECT
      'Fielding' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      Fielding;")

# get years data from allstarfull table
numyears_allstarfull = dbGetQuery(db, 
    "SELECT
      'AllstarFull' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      AllstarFull;")

# get years data from halloffame table
numyears_halloffame = dbGetQuery(db, 
    "SELECT
      'HallofFame' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      HallofFame;")

# get years data from managers table
numyears_managers = dbGetQuery(db, 
    "SELECT
      'Managers' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      Managers;")

# get years data from teams table
numyears_teams = dbGetQuery(db, 
    "SELECT
      'Teams' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      Teams;")

# get years data from battingpost table
numyears_battingpost = dbGetQuery(db, 
    "SELECT
      'BattingPost' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      BattingPost;")

# get years data from pitchingpost table
numyears_pitchingpost = dbGetQuery(db, 
    "SELECT
      'PitchingPost' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      PitchingPost;")

# get years data from fieldingof table
numyears_fieldingof = dbGetQuery(db, 
    "SELECT
      'FieldingOF' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      FieldingOF;")

# get years data from managershalf table
numyears_managershalf = dbGetQuery(db, 
    "SELECT
      'ManagersHalf' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      ManagersHalf;")

# get years data from teamshalf table
numyears_teamshalf = dbGetQuery(db, 
    "SELECT
      'TeamsHalf' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      TeamsHalf;")

# get years data from salaries table
numyears_salaries = dbGetQuery(db, 
    "SELECT
      'Salaries' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      Salaries;")

# get years data from seriespost table
numyears_seriespost = dbGetQuery(db, 
    "SELECT
      'SeriesPost' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      SeriesPost;")

# get years data from awardsmanagers table
numyears_awardsmanagers = dbGetQuery(db, 
    "SELECT
      'AwardsManagers' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      AwardsManagers;")

# get years data from awardsplayers table
numyears_awardsplayers = dbGetQuery(db, 
    "SELECT
      'AwardsPlayers' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      AwardsPlayers;")

# get years data from awardssharemanagers table
numyears_awardssharemanagers = dbGetQuery(db, 
    "SELECT
      'AwardsShareManagers' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      AwardsShareManagers;")

# get years data from awardsshareplayers table
numyears_awardsshareplayers = dbGetQuery(db, 
    "SELECT
      'AwardsSharePlayers' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      AwardsSharePlayers;")

# get years data from fieldingpost table
numyears_fieldingpost = dbGetQuery(db, 
    "SELECT
      'FieldingPost' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      FieldingPost;")

# get years data from appearances table
numyears_appearances = dbGetQuery(db, 
    "SELECT
      'Appearances' AS table_name,
      MIN(yearID) AS min_year,
      MAX(yearID) AS max_year,
      (MAX(yearID) - MIN(yearID) + 1) AS years_between,
      COUNT(DISTINCT(yearID)) AS distinct_years
    FROM 
      Appearances;")

numyears_df = rbind(numyears_batting,
                    numyears_pitching,
                    numyears_fielding,
                    numyears_allstarfull,
                    numyears_halloffame,
                    numyears_managers,
                    numyears_teams,
                    numyears_battingpost,
                    numyears_pitchingpost,
                    numyears_fieldingof,
                    numyears_fieldingpost,
                    numyears_managershalf,
                    numyears_teamshalf,
                    numyears_salaries,
                    numyears_seriespost,
                    numyears_awardsmanagers,
                    numyears_awardsplayers,
                    numyears_awardssharemanagers,
                    numyears_awardsshareplayers,
                    numyears_appearances)
numyears_df


# Question 2
## ----echo = TRUE------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        COUNT(DISTINCT(playerID)) ppl_count
     FROM
        Master;")


## ----echo = TRUE------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        1 AS hitter,
        0 AS pitcher,
        0 AS fielder,
        COUNT(DISTINCT(playerID)) AS ppl_count
     FROM
        Batting
    
     UNION
    
     SELECT
        0 AS hitter,
        1 AS pitcher,
        0 AS fielder,
        COUNT(DISTINCT(playerID)) AS ppl_count
     FROM
        Pitching
    
     UNION
    
     SELECT
        0 AS hitter,
        0 AS pitcher,
        1 AS fielder,
        COUNT(DISTINCT(playerID)) AS ppl_count
     FROM
        Fielding
    
     UNION
     
     SELECT
        1 AS hitter,
        0 AS pitcher,
        1 AS fielder,
        COUNT(DISTINCT(Batting.playerID)) AS ppl_count
     FROM
        Batting
     INNER JOIN
        Fielding
     ON
        Batting.playerID = Fielding.playerID
      
     UNION
     
     SELECT
        0 AS hitter,
        1 AS pitcher,
        1 AS fielder,
        COUNT(DISTINCT(Pitching.playerID)) AS ppl_count
     FROM
        Pitching
     INNER JOIN
        Fielding
     ON
        Pitching.playerID = Fielding.playerID
      
     UNION
    
     SELECT
        1 AS hitter,
        1 AS pitcher,
        0 AS fielder,
        COUNT(DISTINCT(Batting.playerID)) AS ppl_count
     FROM
        Batting
     INNER JOIN
        Pitching
     ON
        Batting.playerID = Pitching.playerID 
        
     UNION
    
     SELECT
        1 AS hitter,
        1 AS pitcher,
        1 AS fielder,
        COUNT(DISTINCT(Batting.playerID)) AS ppl_count
     FROM
        Batting
     INNER JOIN
        Pitching
     ON
        Batting.playerID = Pitching.playerID 
     INNER JOIN
        Fielding
     ON
        Batting.playerID = Fielding.playerID
     ORDER BY
        ppl_count DESC;")


# Question 3
## ---------------------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        'Manager' AS role,
        COUNT(DISTINCT(playerID)) AS ppl_count
     FROM
        ManagerS;")


## ----echo = TRUE------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        (CASE 
          WHEN plyrMgr = 'Y' THEN 'Player-Manager'
          ELSE 'Manager'
        END) AS role,
        COUNT(DISTINCT(Managers.playerID)) AS ppl_count
     FROM
        Managers
     INNER JOIN
        Master
     ON 
        Managers.playerID = Master.playerID
     GROUP BY
        plyrMgr;")


# Question 4
## ----echo = TRUE------------------------------------------------------------------
dbGetQuery(db,
  "SELECT 
      yearID AS year,
      COUNT(DISTINCT(playerID)) AS player_count
   FROM
      Appearances
   WHERE
      yearID >= 2000
   GROUP BY
      yearID;")


## ----echo = TRUE------------------------------------------------------------------
# Number of players per team each year
dbGetQuery(db,
  "SELECT 
      Appearances.yearID AS year,
      Teams.name AS team,
      COUNT(DISTINCT(Appearances.playerID)) AS player_count
   FROM
      Appearances
   JOIN 
      Teams
   ON
      Teams.teamID = Appearances.teamID AND
      Teams.yearID = Appearances.yearID
   WHERE
      Appearances.yearID >= 2000
   GROUP BY
      Appearances.yearID,
      Appearances.teamID
   LIMIT 
      15;")
# Number of players per team overall
dbGetQuery(db,
  "SELECT 
      Teams.name AS team,
      COUNT(DISTINCT(Appearances.playerID)) AS player_count
   FROM
      Appearances
   JOIN
      Teams
   ON
      Teams.yearID = Appearances.yearID AND
      Teams.teamID = Appearances.teamID
   WHERE
      Appearances.yearID >= 2000
   GROUP BY
      Appearances.teamID
   LIMIT 
      15;")



# Question 5
## ---------------------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        SP.yearID AS year,
        SP.round,
        SP.teamIDwinner AS team,
        T.name AS team_name,
        SP.lgIDwinner AS league,
        T.divID AS division
     FROM
        SeriesPost AS SP
     LEFT JOIN
        Teams AS T
     ON
        SP.teamIDwinner = T.teamID AND
        SP.yearID = T.yearID
     WHERE
        SP.yearID = 2010 AND
        SP.round = 'WS';")


# Question 6
## ----echo = TRUE------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        SP.yearID AS year,
        SP.round,
        SP.teamIDloser AS team,
        T.name AS team_name,
        SP.lgIDloser AS league,
        T.divID AS division
     FROM
        SeriesPost AS SP
     LEFT JOIN
        Teams AS T
     ON
        SP.teamIDloser = T.teamID AND
        SP.yearID = T.yearID
     WHERE
        SP.round = 'WS';")


# Question 7
## ----echo = TRUE------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        SP.yearID AS year,
        SP.teamIDwinner AS team,
        T.name AS team_name,
        SP.lgIDwinner AS league,
        T.divID AS division
     FROM
        SeriesPost AS SP
     LEFT JOIN
        Teams AS T
     ON
        SP.teamIDwinner = T.teamID AND
        SP.yearID = T.yearID
     WHERE
        SP.round = 'WS';")


# Question 8
## ----echo = TRUE------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        SP.yearID AS year,
        SP.teamIDwinner AS 'team(w)',
        TW.name AS 'name(w)',
        SP.lgIDwinner AS 'league(w)',
        TW.divID AS 'division(w)',
        SP.wins AS 'wins(w)',
        SP.teamIDloser AS 'team(l)',
        TL.name AS 'name(l)',
        SP.lgIDloser AS 'league(l)',
        TL.divID AS 'division(l)',
        SP.losses AS 'wins(l)'
     FROM
        SeriesPost AS SP
     LEFT JOIN
        Teams AS TW, Teams AS TL
     ON
        SP.teamIDwinner = TW.teamID AND
        SP.yearID = TW.yearID AND
        SP.teamIDloser = TL.teamID AND
        SP.yearID = TL.yearID
     WHERE
        SP.round = 'WS'
     ORDER BY
        SP.yearID ASC;")


# Question 9
## ----echo = TRUE------------------------------------------------------------------
winner_stat = dbGetQuery(db,
    "SELECT
        SP.yearID AS year,
        SP.teamIDwinner AS team,
        T.name AS name,
        T.W AS wins,
        T.L AS losses
     FROM
        SeriesPost AS SP
     LEFT JOIN
        Teams AS T
     ON
        SP.yearID = T.yearID AND
        SP.teamIDwinner = T.teamID
     WHERE
        SP.round = 'WS' AND
        (T.W IS NOT NULL OR
        T.L IS NOT NULL);")
winner_stat


## ----echo=TRUE--------------------------------------------------------------------
lm1 = lm(wins ~ year, data = winner_stat)
plot(wins ~ year, data = winner_stat)
abline(lm1$coefficients, col = "red")
leastwins = subset(winner_stat, winner_stat$wins < 80)
text(leastwins$year, leastwins$wins, leastwins$name, cex=0.6, pos=4, col="blue")


# Question 10
## ----echo = TRUE------------------------------------------------------------------
dbGetQuery(db,
    "SELECT 
        *
     FROM (
        SELECT
            T.name AS team,
            S.lgID,
            M.nameFirst || ' ' || M.nameLast AS name,
            S.salary,
            DENSE_RANK() OVER (ORDER BY S.salary DESC) AS rank
         FROM
            Salaries AS S
         INNER JOIN
            Teams AS T
         ON
            S.teamID = T.teamID AND
            S.yearID = T.yearID
         INNER JOIN
            Master as M
         ON
            S.playerID = M.playerID
         WHERE
            S.yearID = 2003
         ORDER BY
            rank
     ) AS ranked_salary
     WHERE
        rank <= 3;")


# Question 11
## ----echo = TRUE------------------------------------------------------------------
salary2010_info = dbGetQuery(db,
    "SELECT
        T.name AS team,
        SUM(S.salary) AS total_payroll
     FROM
        Salaries AS S
     JOIN
        Teams AS T
     ON
        S.teamID = T.teamID AND
        S.yearID = T.yearID
     WHERE 
        S.yearID = 2010
     GROUP BY 
        S.teamID
     ORDER BY
        total_payroll DESC;")
salary2010_info


## ----echo = TRUE------------------------------------------------------------------
salary_info = dbGetQuery(db,
    "SELECT
        S.yearID AS year,
        S.teamID AS team_id,
        T.name AS team,
        T.lgID AS league,
        T.divID AS division,
        IFNULL(T.WSWin, 'N') AS WS_winner,
        IFNULL(T.LgWin, 'N') AS Lg_winner,
        SUM(S.salary) AS total_payroll
     FROM
        Salaries AS S
     JOIN
        Teams AS T
     ON
        S.teamID = T.teamID AND
        S.yearID = T.yearID
    GROUP BY 
        S.teamID, 
        S.yearID
     ORDER BY
        year ASC,
        total_payroll DESC;")


## ---- fig.width=10, fig.height=12-------------------------------------------------
options(scipen = 10)
ggplot(salary_info, aes(x = year, y = total_payroll)) +
  geom_line() + 
  facet_wrap(vars(team), ncol = 9, labeller = label_wrap_gen(1)) +
  theme(axis.text.x = element_text(angle = 90))


# Question 12
## ---- fig.width=10, fig.height=10, warning = FALSE--------------------------------
options(scipen = 10)

salary_info$win_type = sapply(paste0(salary_info$WS_winner, salary_info$Lg_winner), 
                              switch, 
                              "NN" = "None",
                              "NY" = "Lg",
                              "YN" = "WS",
                              "YY" = "WS + Lg")

ggplot(salary_info, aes(x = year, y = total_payroll)) +
  geom_point(aes(col = win_type)) + 
  geom_line(col = "cyan") +
  facet_wrap(vars(team), ncol = 9, labeller = label_wrap_gen(1)) +
  scale_color_manual(values = c("red", "gray", "blue")) +
  theme(axis.text.x = element_text(angle = 90),
        legend.position = "bottom")


# Question 13
## ---- fig.width=10, fig.height=8, warning = FALSE---------------------------------
options(scipen = 10)
ggplot(salary_info, aes(x = year, y = total_payroll)) +
  geom_line(aes(col = team)) + xlim(1984,2020) +
  facet_grid(vars(league), vars(division), labeller = label_wrap_gen(1)) +
  ggtitle("Payroll of Teams by League (AL, NL) and Division (C, E, W)") +
  theme(axis.text.x = element_text(angle = 90),
        legend.position = "none") +
  directlabels::geom_dl(aes(label = team_id, col = team), 
                        method = list(directlabels::dl.trans(x = x + .2), 
                                      "last.points"))


# Question 14
## ---- results='hide'--------------------------------------------------------------
dbExecute(db,
    "CREATE VIEW IF NOT EXISTS
        total_hr
     AS
        SELECT
            playerID,
            SUM(IFNULL(HR,0)) AS home_runs,
            DENSE_RANK() OVER (ORDER BY SUM(HR) DESC) AS rank
         FROM
            Batting
         GROUP BY
            playerID;")


## ----echo = TRUE------------------------------------------------------------------
most_hr = dbGetQuery(db,
    "SELECT
        B.yearID AS year,
        B.playerID AS id,
        M.nameFirst || ' ' || M.nameLast AS name,
        B.HR AS home_runs
     FROM
        Batting AS B
     LEFT JOIN
        Master AS M
     ON
        B.playerID = M.playerID
     WHERE
        B.playerID = (
            SELECT
                playerID
            FROM
                total_hr
            WHERE
                rank = 1);")


## ---------------------------------------------------------------------------------
most_hr[order(most_hr$home_runs, decreasing = T)[1:5],]


## ---------------------------------------------------------------------------------
lm2 = lm(home_runs ~ year, most_hr)
plot(most_hr$year, most_hr$home_runs,
     main = "Home Runs by year", 
     xlab = "year", ylab = "home runs")
abline(lm2$coefficients, col = "red")


## ----results='hide'---------------------------------------------------------------
dbExecute(db, "DROP VIEW total_hr")


# Question 15
## ---------------------------------------------------------------------------------
homerun_yr = dbGetQuery(db,
    "SELECT
        yearID AS year,
        SUM(G_batting) AS games,
        SUM(HR) AS home_runs
     FROM
        Batting
     GROUP BY
        yearID
     HAVING 
        G_batting IS NOT NULL;")

ggplot(homerun_yr, aes(x = year, y = home_runs/games)) +
  geom_point() +
  xlab("year") + ylab("home runs") + 
  ggtitle("Avg Home Runs per Game by Year")



# Question 16
## ---------------------------------------------------------------------------------
homerun_salary = dbGetQuery(db,
    "SELECT
        B.yearID AS year,
        B.HR AS home_runs,
        S.salary AS salary
     FROM
        Batting AS B
     INNER JOIN
        Salaries AS S
     ON
        B.playerID = S.playerID AND
        B.yearID = S.yearID;")

homerun_salary$period = ifelse(homerun_salary$year %% 10 < 5,
                               paste0(homerun_salary$year %/% 10, "0-", 
                                      homerun_salary$year %/% 10, "4"),
                               paste0(homerun_salary$year %/% 10, "5-", 
                                      homerun_salary$year %/% 10, "9"))
options(scipen = 7)
ggplot(data = homerun_salary,
       aes(x = home_runs, y = salary, na.rm = TRUE)) +
  geom_point(alpha = 0.5, na.rm = TRUE) +
  geom_smooth(method = "loess", formula = y ~ x, na.rm = TRUE) +
  facet_wrap(vars(period))


# Question 17
## ---------------------------------------------------------------------------------
dbl_plays = dbGetQuery(db,
    "SELECT
        yearID AS year,
        SUM(DP) as total_double_plays
     FROM
        Teams
     WHERE
        DP IS NOT NULL
     GROUP BY
        year
     ORDER BY
        year;")

ggplot(dbl_plays, aes(x = year, y = total_double_plays)) + 
  geom_point() + 
  geom_smooth(method = "lm", formula = y ~ x, col = "red") + 
  xlab("year") + ylab("double plays") + 
  ggtitle("Distribution of double plays")


# Question 18
## ---------------------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        M.nameFirst || ' ' || M.nameLast AS name,
        T.name AS team,
        P.yearID AS year,
        GIDP AS double_plays
     FROM
        Pitching AS P
     JOIN
        Master AS M
     ON
        P.playerID = M.playerID
     JOIN
        Teams AS T
     ON
        P.teamID = T.teamID AND
        P.yearID = T.yearID
     ORDER BY
        GIDP DESC
     LIMIT 10;")


# Question 19
## ---------------------------------------------------------------------------------
pitchers = dbGetQuery(db,
    "SELECT
        yearID AS year,
        G AS games,
        W AS wins,
        GS AS starts,
        GF AS finishes
     FROM
        Pitching;")

pitchers$century = paste0(pitchers$year %/% 100, "00s")
ggplot(pitchers, aes(x = starts, y = finishes, na.rm = TRUE)) +
  geom_point(na.rm = TRUE) + facet_wrap(vars(century))


# Question 20
## ---------------------------------------------------------------------------------
ggplot(pitchers, aes(x = games, y = wins)) + 
  geom_point() + 
  facet_wrap(vars(century))


# Question 21
## ---- message=FALSE, warning = FALSE----------------------------------------------
win_stats = dbGetQuery(db,
    "SELECT
        yearID AS year,
        W AS wins,
        H AS hits,
        SO AS strikeouts,
        BB AS walks,
        HR AS homeruns,
        ER AS earned_runs
     FROM
        Teams;")

win_stats$century = paste0(win_stats$year %/% 100, "00s")
plt1 = ggplot(win_stats, aes(x = hits, y = wins, col = century)) +
  geom_point(alpha = 0.5) + ggtitle("Wins vs hits") +
  geom_smooth(method = "lm", col = "black")
plt2 = ggplot(win_stats, aes(x = strikeouts, y = wins, col = century, na.rm = TRUE)) +
  geom_point(alpha = 0.5, na.rm = TRUE) + ggtitle("Wins vs strikeouts") +
  geom_smooth(method = "loess", col = "black", na.rm = TRUE)
plt3 = ggplot(win_stats, aes(x = walks, y = wins, col = century)) +
  geom_point(alpha = 0.5) + ggtitle("Wins vs walks") +
  geom_smooth(method = "lm", col = "black")
plt4 = ggplot(win_stats, aes(x = homeruns, y = wins, col = century)) +
  geom_point(alpha = 0.5) + ggtitle("Wins vs homeruns") +
  geom_smooth(method = "loess", col = "black")
plt5 = ggplot(win_stats, aes(x = earned_runs, y = wins, col = century)) +
  geom_point(alpha = 0.5) + ggtitle("Wins vs earned runs") +
  geom_smooth(method = "loess", col = "black")
ggpubr::ggarrange(plt1, plt2, plt3, plt4, plt5, nrow = 2, ncol = 3)


# Question 22
## ---------------------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        S.schoolName,
        COUNT(SP.playerID) AS count
     FROM
        SchoolsPlayers AS SP
     JOIN
        Schools AS S
     ON
        SP.schoolID = S.schoolID
     GROUP BY
        SP.schoolID
     ORDER BY
        count DESC
     LIMIT
        10;")


## ---------------------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        COUNT(DISTINCT schoolID) AS number_of_colleges
     FROM
        SchoolsPlayers;")


# Question 23
## ---------------------------------------------------------------------------------
dbGetQuery(db,
    "SELECT
        M.nameFirst || ' ' || M.nameLast AS name,
        SUM(P.G) AS 'games_as_pitcher',
        SUM(B.HR) AS homeruns
     FROM
        PitchingPost AS P
     JOIN
        BattingPost AS B
     ON
        P.playerID = B.playerID
     JOIN
        Master AS M
     ON
        M.playerID = P.playerID
     GROUP BY
        P.playerID
     HAVING 
        homeruns > 0
     ORDER BY 
        homeruns DESC;")

