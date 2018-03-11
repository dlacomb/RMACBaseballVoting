###Random Forest top 5 variables based on importance: chances, putouts, double plays, errors, and assists
> ###Find players who have same minimum amount of chances, putouts, double plays, and assists, and maximum amount of errors as GoldGlove players.
  >library(dplyr)

  > #Position: Catcher
  > GGCatcher <- filter(GG, GG$Position == 'C')
  > summary(GGCatcher)
  > ###Stat Requirements needed: chances >= 172, putouts >= 94, double plays >= 1, errors <= 7, assists >= 19
  > NGGCatcher <- filter(NGG, NGG$Position == 'C')
  > NGGCatcher_Candidates <- filter(NGGCatcher, NGGCatcher$c >= 227 & NGGCatcher$po >= 193 & NGGCatcher$dp >= 2 & NGGCatcher$e <= 7 & NGGCatcher$a >= 33)
  > View(NGGCatcher_Candidates)
  
  > #Position: Pitcher
  > GGPitcher <- filter(GG, GG$Position == 'P')
  > summary(GGPitcher)
  > ###Stat Requirements needed: chances >= 15, putouts >= 2, double plays >= 0, errors <= 1, assists >= 11
  > NGGPitcher <- filter(NGG, NGG$Position == 'P')
  > NGGPitcher_Candidates <- filter(NGGPitcher, NGGPitcher$c >= 15 & NGGPitcher$po >= 2 & NGGPitcher$dp >= 0 & NGGPitcher$e <= 1 & NGGPitcher$a >= 11)
  > View(NGGPitcher_Candidates)
  
  > #Position: Infield
  > GGInfield <- filter(GG, GG$Position == 'INF')
  > summary(GGInfield)
  > ###Stat Requirements needed: chances >= 160, putouts >= 60, double plays >= 19, errors <= 9, assists >= 49
  > NGGInfield <- filter(NGG, NGG$Position == 'INF')
  > NGGInfield_Candidates <- filter(NGGInfield, NGGInfield$c >= 160 & NGGInfield$po >= 60 & NGGInfield$dp >= 19 & NGGInfield$e <= 9 & NGGInfield$a >= 49)
  > View(NGGInfield_Candidates)
  
  > #Position: Outfield
  > GGOutfield <- filter(GG, GG$Position == 'OF')
  > summary(GGOutfield)
  > ###Stat Requirements needed: chances >= 90, putouts >= 84, double plays >= 0, errors <= 2, assists >= 3
  > NGGOutfield <- filter(NGG, NGG$Position == 'OF')
  > NGGOutfield_Candidates <- filter(NGGOutfield, NGGOutfield$c >= 90 & NGGOutfield$po >= 84 & NGGOutfield$dp >= 0 & NGGOutfield$e <= 2 & NGGOutfield$a >= 3)
  > View(NGGOutfield_Candidates)
  
  
  