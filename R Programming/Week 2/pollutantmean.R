pollutantmean <- function(directory, pollutant, files=1:332){

library(stringr)

total <- 0

df1 <- data.frame()
for (val in files) {
  val_str <- str_pad(val,3,pad="0")
  df <- read.csv(paste(c(getwd(),"/", directory, "/", val_str, ".csv"), collapse = ""))
  df1 <-rbind(df, df1)
}

if(all(pollutant == "sulfate")) print(mean(df1$sulfate,na.rm = TRUE)) else print(mean(df1$nitrate,na.rm = TRUE))
}