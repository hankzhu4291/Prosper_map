# Prosper_map
Prosper Loan information by state on US map

## Data Description
This [data set](https://www.google.com/url?q=https://s3.amazonaws.com/udacity-hosted-downloads/ud651/prosperLoanData.csv&sa=D&ust=1515625719599000&usg=AFQjCNFd5rpaQYCYl9W6Ki58Obg5iTI03w) contains 113,937 loans with 81 variables on each loan, including loan amount, borrower rate (or interest rate), current loan status, borrower income, and many others.
There are some states in which no information is given so white blanks are shown on the map.

## Data Preprocessing(data_process.R)
- Extract "creation_year" from "ListingCreationDate"
- Extract 8 features for map creation: "CreditScoreRangeLower", "StatedMonthlyIncome", "DebtToIncomeRatio", "BorrowerRate", "MonthlyLoanPayment", "BorrowerState", "CreditScoreRangeUpper","creation_year"  
- Group other 6 features by "creation_year" and "BorrowerState"

## Variables Description
- BorrowerState:	The two letter abbreviation of the state of the address of the borrower at the time the Listing was created.
- BorrowerRate:	The Borrower's interest rate for this loan.
- year: The year the listing was created.
- CreditScoreRangeLower:	The lower value representing the range of the borrower's credit score as provided by a consumer credit rating agency.
- CreditScoreRangeUpper:	The upper value representing the range of the borrower's credit score as provided by a consumer credit rating agency.
- BankcardUtilization:	The percentage of available revolving credit that is utilized at the time the credit profile was pulled.
- MonthlyLoanPayment:	The scheduled monthly loan payment.
- StatedMonthlyIncome:	The monthly income the borrower stated at the time the listing was created.

## Design section
I used US map by state from 2007 to 2014 to show how the loan information changes in each state.
Because MonthlyLoanPayment would show more variance than others and it is also a representation of loan information, this variable was used for color in the map and darker color means higher value.
The buttons are used to select the map in each year

## Summary
This map is about loan information by state in US from 2007 to 2014. The color is set according to normalized  average "MonthlyLoanPayment" in each state. When mouse move over the state, it would show all information in this state. There are 8 buttons for years. When you click it, the corresponding map in that year would be shown.

## Feedback
1. 'Really impressive. The only reccommendation I would make is just put text next to the years or make the buttons look more clickable. just so the reviewer can clearly see that they can change the year. but other than that minor thing, really looks great!'

2. 'It is vividly showing the relationship of each state’s monthly loan payment, and their changes during 8 years. But the Monthly Loan Payment bar on the right side shows the range from 74-370, while some states obviously have monthly loan payment out of this range. (ie. Kentucky 2007/ Alaska 2014). It would be a little bit confusing as one may initially consider 370 as the maximum loan payment.'

3. 'This visualization looks great. I noticed that from 2007-2009, there’s a drop for overall loan payment due to the specific event. After that, the overall loan payment turns prosper. Especially 2013 and 2014, it enters to an unprecedented level of blossom.
It is reasonable to see the states which could pay decent amount of loan continuously stay in the same level of payment for the next year or the years later. it is also noticeable that for the states which pay high loads would just do it once. something that I can tell to improve is that it would be more clear to put credit score together like [600, 650]'

## Exploration
There is a dramatically decrease about overall loan data from 2007 to 2009. This is reasonable because the economic crisis happened at that time, which greatly influenced global economy including USA. From 2009 to 2014, all loan record gradually increases.

## Resources
[US State Map](https://gist.github.com/NPashaP/a74faf20b492ad377312)
