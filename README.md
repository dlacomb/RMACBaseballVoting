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

![utility](https://user-images.githubusercontent.com/36368488/37243365-484483fc-2435-11e8-8000-83e7664ba503.png)

**Model Analysis**

The Defensive Stats Dataset is a binary classification problem, which a combination of descriptive and numerical statistics can predict whether or not a player will win a Gold Glove.  Since the 5 years of data collected already has the target variable known, I performed 4 different classification supervised learning algorithms.  Decision Tree and Random Forest both gave me a strong accuracy of the balanced dataset which contains 630 Winners and 585 Losers.  I performed and compared a regular, linear, and polynomial svm model against one another.  Lastly, I executed a k-nearest neighbors algorithm on the balanced dataset with k = 2, 5, 8, 15.

<p align="center"> Decision Tree

Accuracy = 90%

Variable Importance Order:
1.) Chances
2.) Putouts 
3.) Double Plays 
4.) Fielding Percentage  
5.) Assists 
6.) Team 
7.) Errors 
8.) Conference Standing 
9.) Year 
10.) Caught Stealing Base 
11.) Stolen Base Attempt Percentage 
12.) Position  
13.) Grade 
14.) Stolen Base Attempts 
15.) Passed Balls 
16.) Catchers Interference

![decision tree](https://user-images.githubusercontent.com/36368488/37243406-da4864bc-2435-11e8-9cf0-ee202fbf8608.png)

<p align="center"> Random Forest

Accuracy = 96%

Variable Importance Order:
1.) Chances
2.) Putouts 
3.) Double Plays 
4.) Errors 
5.) Assists 
6.) Position
7.) Fielding Percentage
8.) Team 
9.) Stolen Base Attempts 
10.) Caught Stealing Base 
11.) Stolen Base Attempt Percentage 
12.) Conference Standing
13.) Passed Balls

![random forest variable importance](https://user-images.githubusercontent.com/36368488/37243418-0b752156-2436-11e8-82d9-44269e556d10.png)

<p align="center"> SVM Model

SVM Model: Support Vectors = 357, Accuracy = 91%
Linear SVM Model: Support Vectors = 871, Accuracy = 81%
Polynomial SVM Model: Support Vectors = 357, Accuracy = 91%

<p align="center"> K Nearest Neighbor
	
k = 2: Accuracy = 88%
k = 5: Accuracy = 85%
k = 8: Accuracy = 84%
k = 15: Accuracy = 84%
