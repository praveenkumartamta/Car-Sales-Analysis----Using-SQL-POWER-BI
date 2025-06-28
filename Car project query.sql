create table Car_Data(
Car_ID varchar(20) not null,
Brand varchar(20),
Model varchar(20),
Year integer,
Fuel_Type varchar(20),
Transmission varchar(20),
Color varchar(20),
Owner_Type varchar(20),
Mileage_kmpl decimal(10,2),
Price_Lakh decimal(10,2))

copy Car_Data
from 'D:\Car_Data.csv'
delimiter ','
csv header 

create table Insurance_data(
Car_ID varchar(20),
Provider varchar(20),
Policy_Number varchar(20),
Expiry_Date date,
Status varchar(20))

copy  Insurance_data
from 'D:\Insurance_data.csv'
delimiter ','
csv header


create table Owners_data(
Car_ID varchar(20),
Owner_Name varchar(20),
Contact	text,
City varchar,
Purchase_Year integer
)


copy Owners_data
from 'D:\Owners_data.csv'
delimiter ','
csv header 




create table Sales_data(
Car_ID varchar(20),
Sale_Price_Lakh decimal(10,2),
Sale_Date date,
Buyer_Name varchar(20))


copy Sales_data
from 'D:\Sales_data.csv'
delimiter ','
csv header



create table Service_History(
Car_ID varchar(20),
Service_Type varchar(20),
Service_Date date,
Service_Cost integer,
Service_Center varchar(30)
)

copy Service_History
from 'D:\Service_History.csv'
delimiter ','
csv header



--Create Master Table
select car_data.car_id,brand,model,year,fuel_type,transmission,color,owner_type,mileage_kmpl,price_lakh,
provider,policy_number,expiry_date,status,
owner_name,contact,city,purchase_year,
sale_price_lakh,sale_date,buyer_name,
service_type,service_date,service_cost,service_center into Master_car_data
from car_data
left join insurance_data
on car_data.car_id = insurance_data.car_id
left join owners_data
on owners_data.car_id = car_data.car_id
left join sales_data
on sales_data.car_id = car_data.car_id
left join service_history
on service_history.car_id = car_data.car_id

