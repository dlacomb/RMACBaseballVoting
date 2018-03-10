###Balanced Dataset with SMOTE Algorithm (All variables need to be factors or numeric)
> ds$`Player ` <- as.factor(ds$`Player `)
> ds$Grade <- as.factor(ds$Grade)
> ds$Position <- as.factor(ds$Position)
> ds$Team <- as.factor(ds$Team)
> ds$GoldGlove <- as.factor(ds$GoldGlove)
> install.packages("DMwR")
> library(DMwR)
> balanced_ds <- SMOTE(GoldGlove ~ ., ds, perc.over = 1300, perc.under = 100)
> summary(balanced_ds)

> ###Decision Tree
> ###Remove Player name from Dataset
> install.packages("rpart")  
> library(rpart)
> bds <- balanced_ds[,2:18]
> ind <- sample(2, nrow(bds), replace = TRUE, prob = c(0.8,0.2))
> trainbds <- bds[ind == 1,]
> testbds <- bds[ind == 2,]
> fit <- rpart(GoldGlove ~ ., data = trainbds, method="class")
> summary(fit)
> #Variable Importance Order
> # 1.) Chances 2.) Putouts 3.) Double Plays 4.) Errors 5.) Assists 6.) Position 7.) Fielding Percentage 8.) Team 9.) Stolen Base Attempts 10.) Caught Stealing Base 11.) Stolen Base Attempt Percentage 12.) Conference Standing 13.) Passed Balls
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
> summary(fit)
> importance(fit)
> varImpPlot(fit)

###SVM Model Regular, Linear, and Polynomial
> library(e1071)
> ind <- sample(2, nrow(svmbds), replace = TRUE, prob = c(0.8,0.2))
> trainbds <- svmbds[ind == 1,]
> testbds <- svmbds[ind == 2,]
> svm.model <- svm(GoldGlove ~ ., data = trainbds, kernal = "radial", cost = 1, gamma = 1/ncol(trainbds))
> summary(svm.model)
> svm.model.linear <- svm(GoldGlove ~ ., data = trainbds, kernal = "linear", cost = 1, scale = FALSE)
> summary(svm.model)
> svm.model.polynomial <- svm(GoldGlove ~ ., data = trainbds, kernal = 'polynomial', cost = 1, degree = 3, coef0 = 0, gamma = 1/ncol(trainbds))
> summary(svm.model.polynomial)
> library(caret)
> svm.pred <- predict(svm.model, testbds)
> confusionMatrix(svm.pred, testbds$GoldGlove)
> svm.pred.linear <- predict(svm.model.linear, testbds)
> confusionMatrix(svm.pred.linear, testbds$GoldGlove)
> svm.pred.polynomial <- predict(svm.model.polynomial, testbds)
> confusionMatrix(svm.pred.polynomial, testbds$GoldGlove)

> ###Hierarchal clustering
> clustbds = scale(clustbds)
> install.packages("stats")
> library(stats)
> hc.complete = hclust(dist(clustbds, method = "euclidean"), method = "complete")
> hc.complete
> wss <- (nrow(clustbds)-1)*sum(apply(clustbds,2,var))
> for (i in 2:15) wss[i] <- sum(kmeans(clustbds, centers=i)$withinss)
> plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")
> plot(hc.complete, main = "Complete Linkage Dendrogram", cex = .75, hang = .05)
> cutree(hc.complete, k = 8)
> rect.hclust(hc.complete, k = 8, border = "red")

> ### knn 
> library(class)
> library(gmodels)
> knnds <- balanced_ds[,2:18]
> knnds$Position <- as.numeric(knnds$Position)
> knnds$Grade <- as.numeric(knnds$Grade)
> knnds$Team <- as.numeric(knnds$Team)
> normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))}
> bds_n <- as.data.frame(lapply(knnds[1:16], normalize))
> ind <- sample(2, nrow(bds_n), replace = TRUE, prob = c(0.8,0.2))
> trainbds <- bds_n[ind == 1,]
> testbds <- bds_n[ind == 2,]
> trainbdslabels <- knnds[ind == 1, 17]
> testbdslabels <- knnds[ind == 2, 17]
> bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 8)
> CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
# 80% accuracy
> bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 15)
> CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
#82% accuracy
> bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 20)
> CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
#82% accuracy
> bds_pred <- knn(train = trainbds, test = testbds, cl = trainbdslabels, k = 20)
> CrossTable(x = testbdslabels, y = bds_pred, prop.chisq = FALSE)
#80% accuracy