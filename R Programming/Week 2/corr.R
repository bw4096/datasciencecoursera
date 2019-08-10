corr <- function(directory, threshold){
    library(stringr)
    
    
    files <- 1:332
    result_vect <- c()
    
    for (val in files) {
        val_str <- str_pad(val,3,pad="0")
        df <- read.csv(paste(c(getwd(),"/", directory, "/", val_str, ".csv"), collapse = ""))
        x <- df[complete.cases(df), ]
        
        if (nrow(x) > threshold){
            x <- cor(x$sulfate, x$nitrate)
            result_vect <- c(result_vect, x)
        }
        
    }
    print(result_vect)
}
