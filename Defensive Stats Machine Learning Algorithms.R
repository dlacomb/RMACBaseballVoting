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
   #Gold Glove Winners: Yes = 630, No = 585, new dataset size = [1215, 18]
              
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
    > install.packages("caret")
    > library(caret)
    > confusionMatrix(Prediction, testbds$GoldGlove)
    > #Accuracy = 90%
                        
  > ###Random Forest
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
              
  > #####SVM Model Regular, Linear, and Polynomial (need all numeric data and factor variable)
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
    > ### Polynomial SVM Model
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
    > # Prediction
     > bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 8)
     > CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
     > # 84% accuracy
     > bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 15)
     > CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
     > #84% accuracy
     > bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 5)
     > CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
     > #85% accuracy
     > bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 2)
     > CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
     > #88% accuracy
