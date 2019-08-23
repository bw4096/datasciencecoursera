rankall <- function(outcome, num = "best") {
    ## Read outcome data
    df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if(outcome == "heart attack")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    else if(outcome == "pneumonia")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    else if(outcome == "heart failure")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    state_outcome <- select(df, Hospital.Name, State, outcome_choice)
    answer_list <- state_outcome[order(state_outcome[,2], as.numeric(state_outcome[,3])),]
    
    
    group_answer <- answer_list %>% group_by(state_outcome[,2]) %>% arrange(group_answer[,3], group_answer[,1])
    answer <- slice(group_answer,num)
    return(answer)
}