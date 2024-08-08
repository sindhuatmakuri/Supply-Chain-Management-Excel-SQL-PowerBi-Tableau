
/* Total sales */
/* YTD */
select year(Date) as "Year", concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as "LAB_SALES",
sum(concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million")) over ( order by year(Date) ) as YTD
from lab_data group by year(Date) order by year(Date);

/* MTD */
select monthname(Date) as "month", concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as "LAB_SALES",
sum(concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million")) over (order by month(Date) ) as MTD
from lab_data where year(Date)='2022' group by month(Date), monthname(Date) order by month(Date); 

/* QTD */
select  quarter(Date) as "Quater", concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as "LAB_SALES",
sum(concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million")) over (order by quarter(Date)) as QTD
from lab_data where year(Date)='2022' group by quarter(Date) order by quarter(Date); 

/* Product Wise Sales */
select case when grouping(product_type) then "Grand Total" else product_type end Product_Type, 
concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as LAB_SALES 
from lab_data group by Product_Type with rollup;

/* Sales Growth */
select year(Date) as "Year", concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as "SALES TRENDS"
from lab_data group by year(Date) order by year(Date);

select monthname(Date) as "Year", concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as "SALES TRENDS"
from lab_data where year(date)='2019' group by monthname(Date) order by monthname(Date);

/* Top 5 store sales */
select Store_Name,  concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as LAB_SALES 
from lab_data group by Store_Name order by LAB_SALES desc limit 5 ;

/* Store Region Wise Sales */
select case when grouping(Store_Region) then "Grand Total" else Store_Region end Store_Region, 
concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as LAB_SALES 
from lab_data group by Store_Region with rollup;

/* State Wise Sales */
select case when grouping(Store_State) then "Grand Total" else Store_State end Store_State, 
concat(round(sum((Quantity*Price))/1000000, 2)," ", "Million") as LAB_SALES 
from lab_data group by Store_State with rollup;

/* Total Inventory */
Select case when grouping(Product_Type) then "Grand Total" else Product_Type end Product_Type, 
sum(Quantity_on_Hand) as "Total_Inventory_in_Hand" 
from inventory group by Product_Type with rollup;

/* Inventory values */
select concat(round(sum(Quantity*Price)/1000000, 2), " ","Million") as "Inventory value" 
from lab_data;

/* In_Stock out Stock status */
select Product_Type, sum(Quantity_on_Hand) as "Total_Inventory_in_Hand", 
sum(Quantity_on_Hand*Price) as "In_Hand_Inventory_Value",
case when sum(Quantity_on_Hand)>0 then "In_stock"
when sum(Quantity_on_Hand)<0 then "Out_Of_stock"
End as In_Hand_Stock_status from inventory group by Product_Type order by product_type;

/* Understock and over stock INFORMATION */
create view LAB_QUAN as select product_type, sum(Quantity) as LAB_QUAN from lab_data group by product_type;

create view SOL_QUAN as select iv.product_type, sum(sa.sales_quantity) as SOL_QUANTITY from sales sa INNER JOIN inventory iv 
ON sa.product_key=iv.product_key group by iv.product_type;

create view QUAN_IN_HAND as select product_type, sum(quantity_on_hand) as QUAN_IN_HAND from inventory group by product_type;

#-------------#STATUS--------------------------#
select lq.product_type, lq.lab_quan as LAB_QUANTITY, sq.SOL_QUANTITY,  
 qq.QUAN_IN_HAND as QUAN_IN_HAND, lq.lab_quan - sq.SOL_QUANTITY as "LEFT_QUAN",
 CASE WHEN QUAN_IN_HAND < (lq.lab_quan - sq.SOL_QUANTITY) then "UNDER_STOCK" else "OVER_STOCK" end as STOCK_INFO
 from lab_quan lq JOIN sol_quan sq on lq.product_type=sq.product_type 
 JOIN QUAN_IN_HAND qq on lq.product_type=qq.product_type
 order by lq.product_type;


/* Total Stock Quantity */
select case when grouping(Product_Type) then "Grand Total" else Product_Type end Product_Type, 
sum(Quantity)  from lab_data group by Product_Type with rollup;

/* Purchase method Wise Sales */
select sm.Purchase_Method, concat(round(sum((lb.Quantity*lb.Price))/1000000, 2)," ", "Million") as "LAB_SALES"
from lab_data lb INNER JOIN sales_mode sm on lb.Order_Number=sm.Order_Number group by sm.Purchase_Method;
