best <- function(state, outcome) {
    ## Read outcome data
    df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if(outcome == "heart attack")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    else if(outcome == "pneumonia")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    else if(outcome == "heart failure")
        outcome_choice <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    
    state_outcome <- select(df, Hospital.Name, State, outcome_choice)
    state_name <- state
    answer_list <- filter(state_outcome, State == state_name)
    answer <- arrange(answer_list, as.numeric(answer_list[,3]))
    
    return(answer[1,1])
}