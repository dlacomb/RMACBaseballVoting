**RMAC Baseball Voting**

This project is an analysis on the methods and decision making processes Rocky Mountain Athletic Baseball Coaches make when choosing All-Conference and Gold Glove winners.  The purpose is to analyze and discover if there is enough evidence to determine whether RMAC Baseball Coach's vote purely on statistical metrics, or is there enough evidence to prove that players are voted on due to a subjective judgment based on coaches who have evaluated a player’s statistical performance and immeasurable tangibles, such as character, attitude, effort, and/or competitiveness.  Within the analysis, all-conference winners will be decided based on statistical performance and will be analyzed against the winner of that year.

**Data Collection**

I created three seperated datasets to analyze various statistical metrics.  The three datasets are based on Defensive Stats, Pitching Stats, and Offensive Stats.  

**Defensive Stats Data**

Information from 2013-2017 including 1,264 players and 18 features (4 categorical, 13 numerical, 1 target):

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

**Gold Glove:** Target Variable, Player wins Defensive award for their position or not (45 winners, 9/year, one winner for each position each year)

**Pitching Stats Data**

Information from 2015-2017 including 380 players and 31 features (4 categorical, 25 numerical,  2 target):

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

**1st Team:** 1st Target Variable, Pitcher wins 1st Team All Conference award or does not (5 winners/year)

**2nd Team:** 2nd Target Variable, Pitcher wins 2nd Team All Conference award or does not (5 winners/year)





