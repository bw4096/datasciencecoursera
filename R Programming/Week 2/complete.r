complete <- function(directory, files){
library(stringr)

df1 <- data.frame()
df1 <- c("id", "nobs")


for (val in files) {
  val_str <- str_pad(val,3,pad="0")
  df <- read.csv(paste(c(getwd(),"/", directory, "/", val_str, ".csv"), collapse = ""))
  x <- df[complete.cases(df), ]
   
  df1 <- rbind(df1, c(val, nrow(x)))
  
}
print(df1)
}