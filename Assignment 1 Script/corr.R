corr <- function(directory, threshold = 0)
{
  df_CompleteCases = data.frame()
  df_dat <- data.frame()
  df_dat_current <- data.frame()
  df_CompleteCases <- complete("specdata")
  v_filename <- vector(mode="character", length=nrow(df_CompleteCases))
  v_correlation <- numeric(0)
  for(i in 1:nrow(df_CompleteCases))
  {
    if(df_CompleteCases$nobs[i] > threshold)
    {
      v_filename[i] <- paste("../Projects/Course2/specdata/",formatC(df_CompleteCases$id[i], width=3, flag="0"),".csv",sep="")
      df_dat_current <- read.csv(v_filename[i],header=T)
      df_dat <- df_dat_current[complete.cases(df_dat_current), ]
      v_correlation <- c(v_correlation, cor(df_dat$nitrate, df_dat$sulfate, use="complete.obs"))
    }
  }
  v_correlation
}