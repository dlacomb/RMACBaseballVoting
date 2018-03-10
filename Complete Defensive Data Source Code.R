#Defensive Stats Data
> library(readr)
> ds <- read_csv("E:/Grad School/Practicum/Defensive Stats.csv", 
                 +     col_types = cols(ConfStanding = col_number(), 
                                        +         Year = col_number(), a = col_number(), 
                                        +         c = col_number(), ci = col_number(), 
                                        +         csb = col_number(), dp = col_number(), 
                                        +         e = col_number(), fp = col_number(), 
                                        +         pb = col_number(), po = col_number(), 
                                        +         sba = col_number(), sbap = col_number()), 
                 +     locale = locale(encoding = "ASCII"))
> View(ds)

> #EDA
  ###Defensive Metric Visual Comparison By Position based on Averages
  > library(dplyr)
> GG <- filter(ds, ds$GoldGlove == 'Yes')
> NGG <- filter(ds, ds$GoldGlove == 'No')

> #Position: Catcher
  > GGCatcher <- filter(GG, GG$Position == 'C')
  > NGGCatcher <- filter(NGG, NGG$Position == 'C')
  > AveStats_GGCatcher = aggregate(GGCatcher[,7:17], list(GGCatcher$Position), FUN=mean)
  > AveStats_NGGCatcher = aggregate(NGGCatcher[,7:17], list(NGGCatcher$Position), FUN=mean)
  > AveStats_GGCatcher <- as.matrix(AveStats_GGCatcher[,2:12])
  > AveStats_NGGCatcher <- as.matrix(AveStats_NGGCatcher[,2:12])
  > CatcherStats <- rbind2(AveStats_GGCatcher,AveStats_NGGCatcher)
  > barplot(CatcherStats, beside = TRUE, xlab = "Defensive Metric", ylab = "Performance Value", main = "Mean Catcher Statistics Comparison", col = c("gold", "brown"))
  > legend("topright", c("Gold Glove","No Gold Glove"), pch=15, col=c("gold","brown"), bty="n")
  
  > #Position: Pitcher
    > GGPitcher <- filter(GG, GG$Position == 'P')
    > NGGPitcher <- filter(NGG, NGG$Position == 'P')
    > AveStats_GGPitcher = aggregate(GGPitcher[,7:17], list(GGPitcher$Position), FUN=mean)
    > AveStats_NGGPitcher = aggregate(NGGPitcher[,7:17], list(NGGPitcher$Position), FUN=mean)
    > AveStats_GGPitcher <- as.matrix(AveStats_GGPitcher[,2:12])
    > AveStats_NGGPitcher <- as.matrix(AveStats_NGGPitcher[,2:12])
    > PitcherStats <- rbind2(AveStats_GGPitcher,AveStats_NGGPitcher)
    > barplot(PitcherStats, beside = TRUE, xlab = "Defensive Metric", ylab = "Performance Value", main = "Mean Pitcher Statistics Comparison", col = c("gold", "brown"))
    > legend("topright", c("Gold Glove","No Gold Glove"), pch=15, col=c("gold","brown"), bty="n")
    
    > #Position: Infield
      > GGInfield <- filter(GG, GG$Position == 'INF')
      > NGGInfield <- filter(NGG, NGG$Position == 'INF')
      > AveStats_GGInfield = aggregate(GGInfield[,7:17], list(GGInfield$Position), FUN=mean)
      > AveStats_NGGInfield = aggregate(NGGInfield[,7:17], list(NGGInfield$Position), FUN=mean)
      > AveStats_GGInfield <- as.matrix(AveStats_GGInfield[,2:12])
      > AveStats_NGGInfield <- as.matrix(AveStats_NGGInfield[,2:12])
      > InfieldStats <- rbind2(AveStats_GGInfield,AveStats_NGGInfield)
      > barplot(InfieldStats, beside = TRUE, xlab = "Defensive Metric", ylab = "Performance Value", main = "Mean Infield Statistics Comparison", col = c("gold", "brown"))
      > legend("topright", c("Gold Glove","No Gold Glove"), pch=15, col=c("gold","brown"), bty="n")
      
      > #Position: Outfield
        > GGOutfield <- filter(GG, GG$Position == 'OF')
        > NGGOutfield <- filter(NGG, NGG$Position == 'OF')
        > AveStats_GGOutfield = aggregate(GGOutfield[,7:17], list(GGOutfield$Position), FUN=mean)
        > AveStats_NGGOutfield = aggregate(NGGOutfield[,7:17], list(NGGOutfield$Position), FUN=mean)
        > AveStats_GGOutfield <- as.matrix(AveStats_GGOutfield[,2:12])
        > AveStats_NGGOutfield <- as.matrix(AveStats_NGGOutfield[,2:12])
        > OutfieldStats <- rbind2(AveStats_GGOutfield,AveStats_NGGOutfield)
        > barplot(OutfieldStats, beside = TRUE, xlab = "Defensive Metric", ylab = "Performance Value", main = "Mean Outfield Statistics Comparison", col = c("gold", "brown"))
        > legend("topright", c("Gold Glove","No Gold Glove"), pch=15, col=c("gold","brown"), bty="n")
        
        > #Position: Utility
          > GGUtility <- filter(GG, GG$Position == 'UT')
          > NGGUtility <- filter(NGG, NGG$Position == 'UT')
          > AveStats_GGUtility = aggregate(GGUtility[,7:17], list(GGUtility$Position), FUN=mean)
          > AveStats_NGGUtility = aggregate(NGGUtility[,7:17], list(NGGUtility$Position), FUN=mean)
          > AveStats_GGUtility <- as.matrix(AveStats_GGUtility[,2:12])
          > AveStats_NGGUtility <- as.matrix(AveStats_NGGUtility[,2:12])
          > UtilityStats <- rbind2(AveStats_GGUtility,AveStats_NGGUtility)
          > barplot(UtilityStats, beside = TRUE, xlab = "Defensive Metric", ylab = "Performance Value", main = "Mean Utility Statistics Comparison", col = c("gold", "brown"))
          > legend("topright", c("Gold Glove","No Gold Glove"), pch=15, col=c("gold","brown"), bty="n")
          
> #Model Building and Analysis
      ###Balanced Dataset with SMOTE Algorithm (All variables need to be factors or numeric)
            > ds$`Player ` <- as.factor(ds$`Player `)
            > ds$Grade <- as.factor(ds$Grade)
            > ds$Position <- as.factor(ds$Position)
            > ds$Team <- as.factor(ds$Team)
            > ds$GoldGlove <- as.factor(ds$GoldGlove)
            > ds <- as.data.frame(ds)
            > install.packages("DMwR")
            > library(DMwR)
            > balanced_ds <- SMOTE(GoldGlove ~ ., ds, perc.over = 1300, perc.under = 100)
            > summary(balanced_ds)
            > #Gold Glove Winners: Yes = 630, No = 585, new dataset size = [1215, 18]
              
              > ###Data Partitioning into Training and Test Sets
              > bds <- balanced_ds[,2:18]
              > ind <- sample(2, nrow(bds), replace = TRUE, prob = c(0.8,0.2))
              > trainbds <- bds[ind == 1,]
              > testbds <- bds[ind == 2,]
              
              > ###Decision Tree
                > ###Remove Player name from Dataset
                > install.packages("rpart")  
              > library(rpart)
              > fit <- rpart(GoldGlove ~ ., data = trainbds, method="class")
              > summary(fit)
              > #Variable Importance Order
                > # 1.) Chances 2.) Putouts 3.) Double Plays 4.) Fielding Percentage  5.) Assists 6.) Team 7.) Errors 8.) Conference Standing 9.) Year 10.) Caught Stealing Base 11.) Stolen Base Attempt Percentage 12.) Position  13.) Grade 14.) Stolen Base Attempts 15.) Passed Balls 16.) Catchers Interference
                > plot(fit, uniform=TRUE, main="Classification Tree for Balanced Defensive Data Set")
              > text(fit, use.n = TRUE, all=TRUE, cex=0.8)
              > Prediction <- predict(fit, testbds, type = "class")
              > library(caret)
              > confusionMatrix(Prediction, testbds$GoldGlove)
              > #Accuracy 90%
                
                
                ###Random Forest
                > install.packages("randomForest")
              > library(randomForest)
              > fit <- randomForest(GoldGlove ~ ., data = trainbds, method="class")
              > print(fit)
              > #Accuracy = 96%
                > summary(fit)
              > importance(fit)
              > #Variable Importance Order
                > # 1.) Chances 2.) Putouts 3.) Double Plays 4.) Errors 5.) Assists 6.) Position 7.) Fielding Percentage 8.) Team 9.) Stolen Base Attempts 10.) Caught Stealing Base 11.) Stolen Base Attempt Percentage 12.) Conference Standing 13.) Passed Balls
                > varImpPlot(fit)
              
              #####SVM Model Regular, Linear, and Polynomial (need all numeric data and factor variable)
              > svmbds <- bds
              > svmbds$Grade <- as.numeric(svmbds$Grade)
              > svmbds$Position <- as.numeric(svmbds$Position)
              > svmbds$Team <- as.numeric(svmbds$Team)
              > library(e1071)
              > library(caret)
              > ### Training and Testing Set
                > ind <- sample(2, nrow(svmbds), replace = TRUE, prob = c(0.8,0.2))
                > trainbds <- svmbds[ind == 1,]
                > testbds <- svmbds[ind == 2,]
                > ### Regular SVM Model
                  > svm.model <- svm(GoldGlove ~ ., data = trainbds, kernal = "radial", cost = 1, gamma = 1/ncol(trainbds))
                  > summary(svm.model)
                  > # Num. of Support Vectors = 357
                    > svm.pred <- predict(svm.model, testbds)
                    > confusionMatrix(svm.pred, testbds$GoldGlove)
                    > # Accuracy = 91%
                      > ### Linear SVM Model
                      > svm.model.linear <- svm(GoldGlove ~ ., data = trainbds, kernal = "linear", cost = 1, scale = FALSE)
                      > summary(svm.model.linear)
                      > # Num. of Support Vectors = 871
                        > svm.pred.linear <- predict(svm.model.linear, testbds)
                        > confusionMatrix(svm.pred.linear, testbds$GoldGlove)
                        > # Accuracy = 81%
                          > #Polynomial SVM Model
                          > svm.model.polynomial <- svm(GoldGlove ~ ., data = trainbds, kernal = 'polynomial', cost = 1, degree = 3, coef0 = 0, gamma = 1/ncol(trainbds))
                          > summary(svm.model.polynomial)
                          > # Num. of Support Vectors = 357
                            > svm.pred.polynomial <- predict(svm.model.polynomial, testbds)
                            > confusionMatrix(svm.pred.polynomial, testbds$GoldGlove)
                            > # Accuracy = 91%
                              
                              > ### knn (need all numeric data and factor variable)
                              > library(class)
                            > library(gmodels)
                            > knnds <- svmbds
                            > #Normalize Data
                              > normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))}
                              > bds_n <- as.data.frame(lapply(knnds[1:16], normalize))
                              > #Training and Testing Sets
                                > ind <- sample(2, nrow(bds_n), replace = TRUE, prob = c(0.8,0.2))
                                > trainbds <- bds_n[ind == 1,]
                                > testbds <- bds_n[ind == 2,]
                                > trainbdslabels <- knnds[ind == 1, 17]
                                > testbdslabels <- knnds[ind == 2, 17]
                                # Prediction
                                > bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 8)
                                > CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
                                # 84% accuracy
                                > bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 15)
                                > CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
                                #84% accuracy
                                > bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 5)
                                > CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
                                #85% accuracy
                                > bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 2)
                                > CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
                                #88% accuracy
                                