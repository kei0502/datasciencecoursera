##Introduction

The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov) run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset es- sentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining whether hospitals should be fined for not providing high quality care to patients (see http://goo.gl/jAXFX for some background on this particular topic).

The Hospital Compare web site contains a lot of data and we will only look at a small subset for this assignment. The zip file for this assignment contains three files
* outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
* hospital-data.csv: Contains information about each hospital.
* Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file (i.e the code book).


### 1 Plot the 30-day mortality rates for heart attack

Read the outcome data into R via the read.csv function and look at the first few rows.
<pre><code>
&gt; outcome &lt;- read.csv("outcome-of-care-measures.csv", colClasses = "character")
&gt; head(outcome)
</code></pre>
There are many columns in this dataset. You can see how many by typing ncol(outcome) (you can see the number of rows with the nrow function). In addition, you can see the names of each column by typing names(outcome) (the names are also in the PDF document.
To make a simple histogram of the 30-day death rates from heart attack (column 11 in the outcome dataset), run
<pre><code>
&gt; outcome[, 11] &lt;- as.numeric(outcome[, 11])
&gt; ## You may get a warning about NAs being introduced; that is okay
&gt; hist(outcome[, 11])
</code></pre>
Because we originally read the data in as character (by specifying colClasses = "character" we need to coerce the column to be numeric. You may get a warning about NAs being introduced but that is okay.
There is nothing to submit for this part.

### 2 Finding the best hospital in a state

Write a function called best that take two arguments: the 2-character abbreviated name of a state and an outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.

Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and “f” are tied for best, then hospital “b” should be returned).

The function should use the following template.
<pre><code>
best <- function(state, outcome) {

}
</code></pre>

The function should check the validity of its arguments. If an invalid state value is passed to best, the function should throw an error via the stop function with the exact message “invalid state”. If an invalid outcome value is passed to best, the function should throw an error via the stop function with the exact message “invalid outcome”.

### 3 Ranking hospitals by outcome in a state

Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument. For example, the call rankhospital("MD", "heart failure", 5) would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate for heart failure. The num argument can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function should return NA. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.

Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause of death. In those cases ties should be broken by using the hospital name. For example, in Texas (“TX”), the hospitals with lowest 30-day mortality rate for heart failure are shown here.

The function should use the following template.
<pre><code>
rankhospital &lt;- function(state, outcome, num = "best") {

}
</code></pre>

The function should check the validity of its arguments. If an invalid state value is passed to best, the function should throw an error via the stop function with the exact message “invalid state”. If an invalid outcome value is passed to best, the function should throw an error via the stop function with the exact message “invalid outcome”.

### 4 Ranking hospitals in all states

Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital rank- ing (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value for every state (some may be NA). The first column in the data frame is named hospital, which contains the hospital name, and the second column is named state, which contains the 2-character abbreviation for the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.

Handling ties. The rankall function should handle ties in the 30-day mortality rates in the same way that the rankhospital function handles ties.

The function should use the following template.
<pre><code>
rankall &lt;- function(outcome, num = "best") {

}
</code></pre>

