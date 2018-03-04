**RMAC Baseball Voting**

This project is an analysis on the methods and decision making processes Rocky Mountain Athletic Baseball Coaches make when choosing All-Conference and Gold Glove winners.  The purpose is to analyze and discover if there is enough evidence to determine whether RMAC Baseball Coach's vote purely on statistical metrics, or is there enough evidence to prove that players are voted on due to a subjective judgment based on coaches who have evaluated a player’s statistical performance and immeasurable tangibles, such as character, attitude, effort, and/or competitiveness.  Within the analysis, all-conference winners will be decided based on statistical performance and will be analyzed against the winner of that year.

**Data Collection**

I created three seperated datasets to analyze various statistical metrics.  The three datasets are based on Defensive Stats, Pitching Stats, and Offensive Stats.  

<p align="center"> Defensive Stats Data

Information from 2013-2017 including 1,263 players and 18 features (4 categorical, 13 numerical, 1 target):

**Player:** Player's Last Name

**Grade:** Fr = Freshman, So = Sophomore, Jr = Junior, Sr = Senior, R = Redshirt

**Position:** P = Pitcher, C = Catcher, 1B = First Base, 2B = Second Base, 3B = Third Base, SS = Shortstop, OF = Outfield, INF = Infield, UT = Utility, DH = Designated Hitter

**Team:** ASU = Adams State University, CCU = Colorado Christian University, CMU = Colorado Mesa University, CSM = Colorado School of Mines, CSUP = Colorado State University Pueblo, MSUD = Metro State University Denver, NMHU = New Mexico Highlands University, RU = Regis University, UCCS = University Colorado Colorado Springs

**Year:** 2013-2017

**Conference Standing:** That player's team finish in the conference (1-9)

**c:** Chances 

**po:** Putouts 

**a:** Assists 

**e:** Errors 

**fld%:** Fielding Percentage 

**dp:** Double Plays 

**sba:** Stolen Base Attempts 

**csb:** Caught Stealing Base 

**sba%:** Stolen Base Achieved Percentage 

**pb:** Passed Balls 

**ci:** Catchers Interference 

**Gold Glove:** 0 = No, 1 = Yes, Target Variable, Player wins Defensive award for their position or not (45 winners, 9/year, one winner for each position each year)

<p align="center"> Pitching Stats Data

Information from 2015-2017 including 379 players and 31 features (4 categorical, 25 numerical,  2 target):

**Player:** Player's Last Name

**Grade:** Fr = Freshman, So = Sophomore, Jr = Junior, Sr = Senior, R = Redshirt

**Position:** P = Pitcher

**Team:** ASU = Adams State University, CCU = Colorado Christian University, CMU = Colorado Mesa University, CSM = Colorado School of Mines, CSUP = Colorado State University Pueblo, MSUD = Metro State University Denver, NMHU = New Mexico Highlands University, RU = Regis University, UCCS = University Colorado Colorado Springs

**Year:** 2015-2017

**Conference Standing:** That player's team finish in the conference (1-9)

**era:** Earned Run Average

**w:** Wins

**l:** Losses

**app:** Appearances

**gs:** Games Started

**cg:** Complete Games

**isho:** Individual Shutout

**csho:** Combined Shutout

**sv:** Save

**ip:** Innings Pitched

**h:** hits

**r:** runs

**er:** Earned Runs

**bb:** Base on Balls (Walks)

**so:** Strikeouts

**2b:** Doubles

**3b:** Triples

**hr:** Homeruns

**ab:** At Bats (At Bats against the specific player)

**b/avg:** Opponent's Batting Average

**wp:** Wild Pitches

**hbp:** Hit By Pitch

**bk:** Balks

**1st Team:** 0 = No, 1 = Yes, 1st Target Variable, Pitcher wins 1st Team All Conference award or does not (5 winners/year)

**2nd Team:** 0 = No, 1 = Yes, 2nd Target Variable, Pitcher wins 2nd Team All Conference award or does not (5 winners/year)

<p align="center"> Offensive Stats Data

Information from 2015-2017 including 457 players and 29 features (4 categorical, 23 numerical,  2 target):

**Player:** Player's Last Name

**Grade:** Fr = Freshman, So = Sophomore, Jr = Junior, Sr = Senior, R = Redshirt

**Position:** P = Pitcher, C = Catcher, 1B = First Base, 2B = Second Base, 3B = Third Base, SS = Shortstop, OF = Outfield, INF = Infield, UT = Utility, DH = Designated Hitter

**Team:** ASU = Adams State University, CCU = Colorado Christian University, CMU = Colorado Mesa University, CSM = Colorado School of Mines, CSUP = Colorado State University Pueblo, MSUD = Metro State University Denver, NMHU = New Mexico Highlands University, RU = Regis University, UCCS = University Colorado Colorado Springs

**Year:** 2015-2017

**Conference Standing:** That player's team finish in the conference (1-9)

**avg:** Batting Average

**gp:** Games Played

**gs:** Games Started

**ab:** At Bats

**r:** Runs

**h:** Hits

**2b:** Doubles

**3b:** Triples

**hr:** Homeruns

**rbi:** Runs Batted In

**tb:** Total Bases

**slg%:** Slugging Percentage

**bb:** Base on Balls (Walks)

**hbp:** Hit By Pitch

**so:** Strikeouts

**gdp:** Grounded into Double Play 

**ob%:** On Base Percentage

**sf:** Sacrifice Flys

**sh:** Sacrifice Hits

**sb:** Stolen Bases

**sba:** Stolen Base Attempts

**1st Team:** 0 = No, 1 = Yes, 1st Target Variable, Player wins 1st Team All Conference award or does not (1 winner/year for DH, C, 1B, 2B, 3B, SS, 3 winners/year for OF)

**2nd Team:** 0 = No, 1 = Yes, 2nd Target Variable, Player wins 2nd Team All Conference award or does not (1 winner/year for DH, C, 1B, 2B, 3B, SS, 3 winners/year for OF)

**Exploratory Data Analysis (EDA)**
	
EDA was performed on all three datasets.  Majority of the data organizing was performed in Excel.  Data cleaning and handling of NA values was handled in R.  Below is R Source Code handling missing values for datasets Pitching Stats and Offensive Stats.

```{r }

> #Pitching Stats Data

> str(ps)

> summary(ps)
  
> ps$`2b `[is.na(ps$`2b `)] <- with(ps, median(ps$`2b `, na.rm = TRUE))

> which((is.na(ps$`2b `)))

> which((is.na(ps$`3b `)))
 
> ps$`3b `[is.na(ps$`3b `)] <- with(ps, median(ps$`3b `, na.rm = TRUE))

> which((is.na(ps$`3b `)))

> which((is.na(ps$`hr `)))
  
> ps$`hr `[is.na(ps$`hr `)] <- with(ps, median(ps$`hr `, na.rm = TRUE))

> which((is.na(ps$`hr `)))

> which((is.na(ps$`ab `)))
 
> ps$`ab `[is.na(ps$`ab `)] <- with(ps, median(ps$`ab `, na.rm = TRUE))

> which((is.na(ps$`ab `)))

> which((is.na(ps$`b/avg `)))

> ps$`b/avg `[is.na(ps$`b/avg `)] <- with(ps, median(ps$`b/avg `, na.rm = TRUE))

> which((is.na(ps$`b/avg `)))

> which((is.na(ps$`wp `)))

> ps$`wp `[is.na(ps$`wp `)] <- with(ps, median(ps$`wp `, na.rm = TRUE))

> which((is.na(ps$`wp `)))

> which((is.na(ps$`hbp `)))

> ps$`hbp `[is.na(ps$`hbp `)] <- with(ps, median(ps$`hbp `, na.rm = TRUE))

> which((is.na(ps$`hbp `)))

> which((is.na(ps$`bk `)))

> ps$`bk `[is.na(ps$`bk `)] <- with(ps, median(ps$`bk `, na.rm = TRUE))

> which((is.na(ps$`bk `)))

> View(ps)

```
``` {r }

#Offensive Stats Data 

> str(os)

> summary(os)
                                    
> which((is.na(os$`tb `)))
 
> os$`tb `[is.na(os$`tb `)] <- with(os, median(os$`tb `, na.rm = TRUE))

> which((is.na(os$`tb `)))

> which((is.na(os$`slg% `)))

> os$`slg% `[is.na(os$`slg% `)] <- with(os, median(os$`slg% `, na.rm = TRUE))

> which((is.na(os$`slg% `)))

> which((is.na(os$`gdp `)))

> os$`gdp `[is.na(os$`gdp `)] <- with(os, median(os$`gdp `, na.rm = TRUE))

> which((is.na(os$`gdp `)))

> which((is.na(os$`ob% `)))

> os$`ob% `[is.na(os$`ob% `)] <- with(os, median(os$`ob% `, na.rm = TRUE))

> which((is.na(os$`ob% `)))

> which((is.na(os$`sf `)))
 
> os$`sf `[is.na(os$`sf `)] <- with(os, median(os$`sf `, na.rm = TRUE))

> which((is.na(os$`sf `)))

> which((is.na(os$`sh `)))

> os$`sh `[is.na(os$`sh `)] <- with(os, median(os$`sh `, na.rm = TRUE))

> which((is.na(os$`sh `)))

> View(os)

```
