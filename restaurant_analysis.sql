create database zomato_db ;
use zomato_db;

create table restaurant_db(
restaurant_id int,
restaurant_name varchar(50),
country_name varchar(15),
country_code int,
city varchar(20),
address varchar(100),
locality varchar(50),
locality_verbose varchar(50),
longitude double,
latitude double,
cuisine varchar(50),
avg_cost_for_two int,
currency varchar(20),
has_table_booking varchar(10),
has_online_delivery varchar(10),
price_range int,
rating double,
rating_colour varchar(10),
rating_text varchar(10),
votes int
);

set global local_infile = 1;

LOAD DATA LOCAL INFILE "C:/data analystresource/Portfolio-data analyst/Marketing capstone dataset/Dataset/restaurant_db.csv"
INTO TABLE restaurant_db
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from restaurant_db;
select * from country_code;
select * from cuisine_table;

describe restaurant_db;
describe country_code;
describe cuisine_table;


-- EDA --

-- Total Restaurant 
select count(distinct restaurant_id) as Total_Restaurant from restaurant_db;

-- Avg Rating 
select round(avg(rating), 2) as Avg_Rating from restaurant_db;

-- Overall Avg cost for two 
select round(avg(avg_cost_for_two), 2) as Average_cost_for_2 from restaurant_db;

-- Total cities
select count(distinct city) as Total_cities from restaurant_db;

-- Total COuntries
select count(distinct country_name) as Total_cities from restaurant_db;

/* Explore the geographical distribution of the restaurants, finding out the cities with maximum / minimum number of restaurants. */

-- City wise restaurant distribution
select city, count(restaurant_id) as Total_Restaurant 
from restaurant_db
group by city
order by Total_Restaurant desc;

-- cities which only have one restaurant
select count(*) as cities_with_one_restaurant
from (select city, count(restaurant_id) as Total_Restaurant 
from restaurant_db
group by city
having count(restaurant_id) = 1 ) as t ;

-- country wise restaurant distribution
select country_name, count(restaurant_id) as Total_Restaurant 
from restaurant_db
group by country_name
order by Total_Restaurant desc;

-- Count of restaurants as per rating
select rating , count(restaurant_id) as Total_restaurant
from restaurant_db
group by rating
order by rating desc;

-- explore the franchise with most national presence
select restaurant_name, count(country_name) as total_country
from restaurant_db
group by restaurant_name
order by total_country desc ; 

-- What is the ratio between restaurants that allow table booking vs that do not allow table booking*/
select has_table_booking,
count(restaurant_id) as total_restaurant,
round(count(restaurant_id) / sum(count(restaurant_id)) over(), 2) as ratio
from restaurant_db
group by has_table_booking;

-- What is the percentage of restaurants providing online delivery?
select has_online_delivery,
count(restaurant_id) as total_restaurant,
round(count(restaurant_id) * 100 / sum(count(restaurant_id)) over(), 2) as percentage
from restaurant_db
group by has_online_delivery;

-- Is there a difference in no. of votes for the restaurants that deliver and the restaurant that don’t?
select has_online_delivery, count(*) as total_restaurant, sum(votes) as total_votes, avg(votes) as avg_votes
from restaurant_db
group by has_online_delivery;

-- What are the top 10 cuisines served across cities?
select trim(lower(c.cuisine_new)) as cuisine_clean,
count(distinct r.restaurant_id) as total_restaurants
from restaurant_db r
join cuisine_table c
on r.restaurant_id = c.restaurant_id
group by cuisine_clean
order by total_restaurants desc
limit 10;

-- what are the top cuisine served across each country ?
select *
from(
select r.country_name,
trim(lower(c.cuisine_new)) as cuisine_clean,
row_number() over( partition by r.country_name order by count(distinct r.restaurant_id) desc ) as rnk
from restaurant_db r
join cuisine_table c on r.restaurant_id = c.restaurant_id
group by r.country_name, cuisine_clean) as t
where rnk = 1;

-- What is the maximum and minimum no. of cuisines that a restaurant serves?
select max(cuisine_count) as maximum_cuisine,
min(cuisine_count) as minimum_cuisine
from(
select restaurant_id, count(distinct cuisine_new) as cuisine_count
from cuisine_table
group by restaurant_id) t;

-- 
