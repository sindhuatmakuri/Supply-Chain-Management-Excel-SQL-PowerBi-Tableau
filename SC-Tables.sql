
/* calendar table  */
CREATE TABLE `=calendar` (
  `Date` text,
  `Fiscal Year` int DEFAULT NULL,
  `Season` text,
  `Fiscal Quarter` text,
  `Fiscal Period` int DEFAULT NULL,
  `Fiscal Week` int DEFAULT NULL,
  `Fiscal Day of Year` int DEFAULT NULL
) 

/* customer table */
CREATE TABLE `customer` (
  `Cust Key` int DEFAULT NULL,
  `Cust Name` text,
  `Cust Address` text,
  `Cust City` text,
  `Cust State` text,
  `Cust Zip Code` int DEFAULT NULL,
  `Cust County` text,
  `Cust Region` text,
  `Cust Since` text,
  `Cust Type` text,
  `Cust Gender` text,
  `Cust Age` int DEFAULT NULL,
  `Age Group` text,
  `Civil Status` text,
  `Loyalty Program` int DEFAULT NULL
) 

/* counties table */
CREATE TABLE `d_geojson_us_counties` (
  `State Code` int DEFAULT NULL,
  `State Name` text,
  `County Name` text
) 

/* store table */
CREATE TABLE `d_store` (
  `Store Key` int DEFAULT NULL,
  `Store Name` text,
  `Store Address` text,
  `Store City` text,
  `Store State` text,
  `Store Zip Code` int DEFAULT NULL,
  `Store County` text,
  `Store Region` text,
  `Store Open Date` text,
  `Last Layout Update` text,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Store Size` text,
  `Monthly Rent Cost` int DEFAULT NULL,
  `Number of Employees` int DEFAULT NULL,
  `Online Ordering` text,
  `Selling Square Footage` int DEFAULT NULL,
  `Total Square Footage` int DEFAULT NULL
)

/* inventory table */
CREATE TABLE `f_inventory_adjusted` (
  `Product Key` int DEFAULT NULL,
  `Product Name` text,
  `Product Type` text,
  `Product Family` text,
  `Product Line` text,
  `Product Group` text,
  `Product Description` text,
  `Sku Number` text,
  `Price` double DEFAULT NULL,
  `Cost Amount` double DEFAULT NULL,
  `Quantity on Hand` double DEFAULT NULL
) 

/* sales table */
create table sales
(
`Order Number` int,
`Cust Key` int,
`store Key` int,
`Transaction Type` text,
Date datetime,
`Purchase Method` text
)

/* products table */
CREATE TABLE Products (
    `ProductKey` INT PRIMARY KEY,
    `ProductName` VARCHAR(255),
    `ProductType` VARCHAR(255),
    `ProductFamily` VARCHAR(255),
    `ProductLine` VARCHAR(255),
    `ProductGroup` VARCHAR(255),
    `ProductDescription` VARCHAR(255),
    `SkuNumber` VARCHAR(50),
    `Price` DECIMAL(10, 2)
)

/* lab_file */
create table lab_file
(
Order_Number int,
Date datetime,
Sku_Number varchar(20),
Quantity int,
Cost decimal(10,2),
Price decimal(10,2),
Product_Type varchar(255),
Product_Family varchar(255),
Product_Name varchar(255),
Store_Name varchar(255),
Store_Key varchar(255),
Store_Region varchar(255),
Store_State varchar(255),
Store_City varchar(255),
Store_Latitude decimal(20,2),
Store_Longitude decimal(20,2),
Customer_Name varchar(255),
Cust_Key int
); 

