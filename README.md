# Prosper_map
Prosper Loan information by state on US map

## Data Description
This [data set](https://www.google.com/url?q=https://s3.amazonaws.com/udacity-hosted-downloads/ud651/prosperLoanData.csv&sa=D&ust=1515625719599000&usg=AFQjCNFd5rpaQYCYl9W6Ki58Obg5iTI03w) contains 113,937 loans with 81 variables on each loan, including loan amount, borrower rate (or interest rate), current loan status, borrower income, and many others.
There are some states in which no information is given so white blanks are shown on the map.

## Data Preprocessing
- Extract "creation_year" from "ListingCreationDate"
- Extract 8 features for map creation: "CreditScoreRangeLower", "StatedMonthlyIncome", "DebtToIncomeRatio", "BorrowerRate", "MonthlyLoanPayment", "BorrowerState", "CreditScoreRangeUpper","creation_year"  
- Group other 6 features by "creation_year" and "BorrowerState"

## Summary
This map is about loan information by state in US from 2007 to 2014. The color is set according to normalized  average "MonthlyLoanPayment" in each state. When mouse move over the state, it would show all information in this state.

## Resources
[US State Map](https://gist.github.com/NPashaP/a74faf20b492ad377312)
