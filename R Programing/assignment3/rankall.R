rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv")
  ## Check that state and outcome are valid
  outcomeIndex<-0
  if(outcome=="heart attack") {
    outcomeIndex<-11
  } else if(outcome=="heart failure") {
    outcomeIndex<-17
  } else if(outcome=="pneumonia") {
    outcomeIndex<-23
  }
  if(outcomeIndex==0)
    stop("invalid outcome")
  ## For each state, find the hospital of the given rank
  hospitals<-NULL
  states<-unique(data$State)
  for(state in states){ ##in each state, use the method of rankhospital
    state_data<-data[state==data$State,][,c(2,outcomeIndex)]
    # Clean data of "Not Available"
    state_data[,2]<-as.numeric(as.character(state_data[,2]))
    state_data<-state_data[!is.na(state_data[,2]),]
    ordered_data<-state_data[order(state_data[,2],state_data[,1]),]
    if(num=="best")
      hospitals<-c(hospitals,as.character(ordered_data[1,1]))
    else if(num=="worst")
      hospitals<-c(hospitals,as.character(ordered_data[nrow(ordered_data),1]))
    else if(num>nrow(ordered_data))
      hospitals<-c(hospitals,NA)
    else
      hospitals<-c(hospitals,as.character(ordered_data[num,1]))
  }
  ## Return a data frame with the hospital names and the (abbreviated) state name
  data.frame(hospital=hospitals,state=states)
}