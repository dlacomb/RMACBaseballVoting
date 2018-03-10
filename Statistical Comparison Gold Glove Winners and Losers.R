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