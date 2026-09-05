Create table financial_transaction(
 Transaction_Date Date,
 Department Varchar(100),
 Category Varchar(100),
 Region Varchar(100),
 Budget_Amount Float,
 Actual_Amount Float,
 Payment_Method Varchar(50),
 Transaction_Id Varchar(50)
);



select * from financial_transaction;

select count(*) from financial_transaction;

select * from financial_transaction limit(10);

'Financial SQL Analysis'
1)Total Budget Amount-
Select 
sum(Budget_Amount) as Total_Budget
from financial_transaction;

2)Total Actual Amount-
select
sum(Actual_Amount) as Total_Actual
from financial_transaction;

3)Total variance
select 
sum(Actual_Amount) - Sum(Budget_Amount) as Total_variance
from financial_transaction;

"Department Analysis"
1)Which Department is overspending?
select
department,
sum(Budget_Amount) as Budget,
sum(Actual_Amount) as Actual,
sum(Actual_amount)-sum(Budget_Amount) as Variance
from financial_transaction
group by department
order by variance desc;


"CATEGORY ANALYSIS"
1)Which expense category consumes the most money?
select 
category,
sum(Actual_Amount) as actual_spending
from financial_transaction
group by category
order by actual_spending Desc;

"REGION ANALYSIS"
select
region,
sum(Budget_Amount) as Budget,
sum(Actual_Amount) as Actual,
sum(Actual_Amount)-sum(Budget_Amount) as Variance
from financial_transaction
group by region
order by Variance desc;


"SQL CTE"
Advance Level-
"CTEs + aggregation + financial calculations"

with department_finance as (
select
department,
sum(Budget_Amount) as Budget,
sum(Actual_Amount) as Actual
from financial_transaction
group by department
)
select 
Department,
Budget,
Actual,
Actual-Budget as Variance,
(Actual-Budget) / Nullif(Budget,0)* 100
 as Variance_Percentage

 from department_finance
 order by Variance_Percentage desc;

"SQL WINDOWS FUNCTION"

select 
department,
sum(Actual_Amount) as Actual_Spending,

sum(Actual_Amount)*100/
sum(sum(Actual_Amount)) over()
as Spending_Percentage

from financial_transaction
group by Department;