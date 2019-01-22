complete <- function(directory, id = 1:332)
{
  df_dat <- data.frame()
  df_dat_current <- data.frame()
  v_filename <- vector(mode="character", length=length(id))
  for(i in 1:length(id))
  {
    v_filename[i] <- paste("../Projects/Course2/specdata/",formatC(id[i], width=3, flag="0"),".csv",sep="")
    df_dat_current <- read.csv(v_filename[i],header=T)
    df_result <- data.frame(id=id[i],nobs=nrow(df_dat_current[complete.cases(df_dat_current[ , 2:3]),]))
    df_dat <- rbind(df_dat, df_result)
  }
  df_dat
}