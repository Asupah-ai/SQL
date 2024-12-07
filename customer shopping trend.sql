create database my_projects;
use my_projects;

-- customer purchase shopping trends
-- https://www.kaggle.com/datasets/bhadramohit/customer-shopping-latest-trends-dataset
select * from shopping_trends;
-- creating table like shopping trends 
CREATE TABLE `shopping_trends1` (
  `Customer_ID` int DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` text,
  `Item_Purchased` text,
  `Category` text,
  `Purchase_Amount_USD` int DEFAULT NULL,
  `Location` text,
  `Size` text,
  `Color` text,
  `Season` text,
  `Review_Rating` double DEFAULT NULL,
  `Subscription_Status` text,
  `Payment_Method` text,
  `Shipping_Type` text,
  `Discount_Applied` text,
  `Promo_Code_Used` text,
  `Previous_Purchases` int DEFAULT NULL,
  `Preferred_Payment_Method` text,
  `Frequency_of_Purchases` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into shopping_trends1
select * from shopping_trends;
/* since the data has no missing values,
shall go directly to calculating customer demograpgics*/

select Gender, count(Gender) as Count_of_gender from  shopping_trends1
group by Gender;

-- gender age distribution 

select Gender,avg(Age) as gender_age_average from  shopping_trends1
group by Gender;

-- location of the cutomers
select Location, count(Customer_ID) as number_customers  from shopping_trends1
group by Location;

-- purchased items
select Category, sum(Purchase_Amount_USD) as total_amount_purchased_per_category from shopping_trends1
group by Category
order by total_amount_purchased_per_category desc;
select  Item_Purchased, count(Item_Purchased)
from shopping_trends1
group by Item_Purchased;

-- item rating

select  Item_Purchased, avg(Review_Rating)
from shopping_trends1
group by Item_Purchased;

select Category, avg(Review_Rating)
from shopping_trends1
group by Category;
-- frequency of purchase
select Frequency_of_Purchases ,count(Frequency_of_Purchases) as frequency_purchase
from shopping_trends1
group by Frequency_of_Purchases
order by frequency_purchase asc;

-- preferred payment method
select Preferred_Payment_Method, count(Preferred_Payment_Method) as mode_of_payement
from shopping_trends1
group by Preferred_Payment_Method
order by mode_of_payement desc;

-- season of purchase
select Season, count(Season) as count_season
from shopping_trends1
group by Season
order by count_season desc;

-- type of item purchased for a given season
select  Item_Purchased, count(Item_Purchased) as count_purchased_items
from shopping_trends1
where Season = 'Fall'
group by Item_Purchased
order by count_purchased_items desc;

-- what items are ladies purchasing

select  Item_Purchased, count(Item_Purchased) as count_purchased_items
from shopping_trends1
where Gender = 'Female'
group by Item_Purchased
order by count_purchased_items desc;

-- subscription status of the customers
select Subscription_Status , count(Subscription_Status)
from shopping_trends1
group by Subscription_Status;

-- location of customers
select Location, count(Location)
from shopping_trends1
group by Location
order by count(Location) desc;

-- method of shipping
select distinct Shipping_Type from shopping_trends1;

 
 