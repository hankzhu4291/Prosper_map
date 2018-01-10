# loan = read.csv('prosperLoanData.csv')
# names(loan)
# head(loan)
# 
# n = dim(loan)[1]
# p = dim(loan)[2]
# 
# selected = rep(0, 81)
# for(i in 1:p){
#   selected[i] = ifelse((mean(is.na(loan[,i]))) > 0.25, 0, 1)
# }
# 
# cleaned_data = loan[ ,selected == 1]
# cleaned_data = na.omit(cleaned_data)
# cleaned_data = cleaned_data[!(cleaned_data$IncomeRange %in% c('$0','Not displayed', 'Not employed')), ]
# 
# 
# cleaned_data = cleaned_data[cleaned_data$BorrowerState != "",]
# write.csv(cleaned_data, 'cleaned_loan.csv')
cleaned_data = read.csv('cleaned_loan.csv')

head(cleaned_data)

year_extract = function(time){
  year = strptime(time, format = "%Y-%m-%d %T")$year+1900
  return(year)
}

cleaned_data$creation_year = sapply(cleaned_data$ListingCreationDate, 
                                    year_extract)
cleaned_data['ProsperRating'] = cleaned_data['ProsperRating..Alpha.']

used_features = c('CreditScoreRangeLower', 
                  'StatedMonthlyIncome', 'DebtToIncomeRatio', 
                  'BorrowerRate',  'MonthlyLoanPayment', 
                  'BorrowerState', 'CreditScoreRangeUpper', 'creation_year')

dropped_data = cleaned_data[,  used_features]

dropped_data$ProsperRating = factor(dropped_data$ProsperRating, levels = c("AA", "A", "B" , "C", "D",  "E", "HR", ""))
dropped_data$IncomeRange = factor(dropped_data$IncomeRange, levels = c( "$100,000+", "$75,000-99,999", "$50,000-74,999",
                                                                        "$25,000-49,999","$1-24,999"))

names(dropped_data)
head(dropped_data)
write.csv(dropped_data, 'dropped_loan.csv', row.names=FALSE)

library(dplyr)
dropp_groupby_year_st = dropped_data %>%
  group_by(creation_year, BorrowerState) %>%
  summarise(AVGCreditScoreRangeLower = median(CreditScoreRangeLower),
            AVGCreditScoreRangeUpper = median(CreditScoreRangeUpper),
            AVGBorrowerRate = median(BorrowerRate),
            AVGMonthlyLoanPayment = median(MonthlyLoanPayment),
            AVGDebtToIncomeRatio = median(DebtToIncomeRatio),
            AVGStatedMonthlyIncome = median(StatedMonthlyIncome)) %>%
  ungroup() 

write.csv(dropp_groupby_year_st, 'dropped_groupby_year_st.csv', row.names=FALSE)
