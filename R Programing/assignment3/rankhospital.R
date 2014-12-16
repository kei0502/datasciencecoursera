rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv")
  ## Check that state and outcome are valid
  if(sum(data$State==state)==0)
    stop("invalid state")
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
  ## Return hospital name in that state with the given rank 30-day death rate
  state_data<-data[state==data$State,][,c(2,outcomeIndex)]
  # Clean data of "Not Available"
  state_data[,2]<-as.numeric(as.character(state_data[,2]))
  state_data<-state_data[!is.na(state_data[,2]),]
  ordered_data<-state_data[order(state_data[,2],state_data[,1]),]
  if(num=="best")
    as.character(ordered_data[1,1])
  else if(num=="worst")
    as.character(ordered_data[nrow(ordered_data),1])
  else if(num>nrow(ordered_data))
    NA
  else
    as.character(ordered_data[num,1])
}