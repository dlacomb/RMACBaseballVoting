**RMAC Baseball Voting**

This project is an analysis on the methods and decision making processes Rocky Mountain Athletic Baseball Coaches make when choosing  Gold Glove winners.  The purpose is to analyze and discover voting patterns on coaches voting. Some analysis goals are to determine whether RMAC Baseball Coach's vote purely on statistical metrics, or players are voted on due to a subjective judgment based on coaches who have evaluated a player’s statistical performance and immeasurable tangibles, such as character, attitude, effort, and/or competitiveness.  

**Data Collection**

<p align="center"> Defensive Stats Data

Information from 2013-2017 including 1,263 players and 18 features (4 categorical, 13 numerical, 1 target):

**Player:** Player's Last Name

**Grade:** Fr = Freshman, So = Sophomore, Jr = Junior, Sr = Senior, R = Redshirt

**Position:** P = Pitcher, C = Catcher, INF = Infield, OF = Outfield, , UT = Utility

**Team:** ASU = Adams State University, CCU = Colorado Christian University, CMU = Colorado Mesa University, CSM = Colorado School of Mines, CSUP = Colorado State University Pueblo, MSUD = Metro State University Denver, NMHU = New Mexico Highlands University, RU = Regis University, UCCS = University Colorado Colorado Springs

**Year:** 2013-2017

**ConfStanding:** Conference Standing - That player's team finish in the conference (1-9)

**c:** Chances 

**po:** Putouts 

**a:** Assists 

**e:** Errors 

**fp:** Fielding Percentage 

**dp:** Double Plays 

**sba:** Stolen Base Attempts 

**csb:** Caught Stealing Base 

**sbap:** Stolen Base Achieved Percentage 

**pb:** Passed Balls 

**ci:** Catchers Interference 

**GoldGlove:** Yes or No, Target Variable, Player wins Defensive award for their position or not (45 winners, 9/year, one winner for each position each year (4 INF/year, 3 OF/year), *Note: Some years there are ties)

**Exploratory Data Analysis (EDA)**
	
Majority of the data organizing was performed in Excel.  Data handling was dealt with in R.  I performed Exploratory Data Analysis Visualizations to see visual comparisons of statistics between Gold Glove winners and losers.  Below is a Visualization Comparison for each set of positions.

![catcher](https://user-images.githubusercontent.com/36368488/37243302-61d1277c-2434-11e8-939a-b09645a5a813.png)

![pitcher](https://user-images.githubusercontent.com/36368488/37243350-088b39e0-2435-11e8-93b8-4d202c7cd846.png)

![infield](https://user-images.githubusercontent.com/36368488/37243358-208e2c1e-2435-11e8-9489-f751568ad11c.png)

![outfield](https://user-images.githubusercontent.com/36368488/37243360-34ef6c7c-2435-11e8-95a1-2c0bac7d54d7.png)
