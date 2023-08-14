/* show date into table */
select * from supermarket_sales

/* Total sales price */

select round(sum(Total),0) as Total_sales_price from supermarket_sales

/* Cogs */

select round(sum(cogs),0) as Total_cogs from supermarket_sales

/* Total gross income*/

select round(sum(gross_income),0) as Total_gross_income from supermarket_sales

/* average Gross margin percentage */

select round(avg(Gross_margin_percentage),2) as average_gross_margin_percentage from supermarket_sales

select round(avg(Gross_margin_percentage),2) as average_gross_margin_percentage from supermarket_sales
where Branch = 'A'

/* ratings */

select round(avg(rating),2) as average_rating from supermarket_sales

/* average rating percentage*/

select round((sum(rating)/count(invoice_ID))*10,0)  as average_rating_percentage from supermarket_sales

/* product line by Quantity in each branch */

select Product_line ,sum(quantity) as Total_quantity from supermarket_sales
Group by Product_line 

select Product_line ,sum(quantity) as Total_quantity from supermarket_sales
where Branch = 'A'
Group by Product_line 

select branch,Product_line , sum(Quantity)from supermarket_sales
where Branch in ('A','B','C')
group by Product_line , Branch
order by branch

/* Product line By Gender */

select Gender ,Product_line ,count(Gender) as Total from supermarket_sales
group by Product_line ,Gender
order by Product_line ,Gender



--select Product_line , (select(count(Gender))from supermarket_sales where Gender = 'Male'),
--(select(count(Gender)) from supermarket_sales where Gender = 'Female')  
--from supermarket_sales
--group by Product_line,Gender

/* product line by average unit price*/

select Product_line , round(avg(unit_price),0) as avg_unit_price from supermarket_sales
group by Product_line

select Product_line , round(avg(unit_price),0) from supermarket_sales
where Gender = 'Male'
group by Product_line

select Product_line , round(avg(unit_price),0) from supermarket_sales
where Gender = 'Female'
group by Product_line

/*tax by branch*/

select Branch ,Product_line , round(sum(tax),0) as Total_tax from supermarket_sales
group by Branch,Product_line
order by Branch

select Branch ,Product_line , round(sum(tax),0) from supermarket_sales
where Gender = 'Female'
group by Branch,Product_line
order by Branch

/*product line by total gross income in each city*/

select Product_line , round(sum(gross_income),0) as Total_gross_income from supermarket_sales
group by Product_line

select city , Product_line , round(sum(gross_income),0) as Total_gross_income from supermarket_sales
group by Product_line,city
order by  city

/* month wise total sales price , total gross inome ,total quantity*/

select datename(month,Date) as Sales_month , 
round(sum(Total),0) as Total_sales_price ,
round(sum(gross_income),0) as total_gross_income ,
sum(Quantity) as total_quantity from supermarket_sales
group by datename(month,Date)

select datename(month,Date) as Sales_month , 
round(sum(Total),0) as Total_sales_price ,
round(sum(gross_income),0) as total_gross_income ,
sum(Quantity) as total_quantity from supermarket_sales
where branch = 'A'
group by datename(month,Date)


/* Quantity by time */

select datepart(hour , time) as time , sum(Quantity) as quantity  from supermarket_sales
group by datepart(hour , time)
order by datepart(hour , time) 

/* customer type by payment method*/

select Customer_type , Payment , count(Payment) as Total from supermarket_sales
group by Customer_type , Payment
order by Payment

select Payment ,count(Payment) as total from supermarket_sales
group by Payment


