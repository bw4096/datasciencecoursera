rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    df1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    df <- df1[complete.cases(df1),]
    
    ## Check that state and outcome are valid
    if(num == "best")
        num <- 1
    if(outcome == "heart attack")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    else if(outcome == "pneumonia")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    else if(outcome == "heart failure")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    state_outcome <- select(df, Hospital.Name, State, outcome_choice)
    state_name <- state
    answer_list <- filter(state_outcome, State == state_name)
    answer <- arrange(answer_list, as.numeric(answer_list[,3])) 
    
    answer1 <- answer[order(as.numeric(answer[,3]), answer[,1]),]
    answer1[,3]<- replace(answer1[,3], answer1[,3] == "Not Available", NA)
    answer1 <- na.omit(answer1)
    if(num == "worst")
        num <- length(answer1[,3])
    return(answer1[num, 1])
}