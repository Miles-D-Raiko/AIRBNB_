drop database if exists `Airbnb_project`;
create database `Airbnb_project`;
use Airbnb_project;

# Import CVS file as tables Below
select * from airbnb_price;
select * from airbnb_last_review;
select * from airbnb_room_type;

# Join The Three Tables Together
select * from airbnb_room_type art  join airbnb_last_review arl on art.listing_id = arl.listing_id
join airbnb_price ap on arl.listing_id = ap.listing_id;

#qst 1 Are There Differences In The Appartment 
select distinct description from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id`;
# The above description are the difference in appartment

#qst 2 Which Apt is best for Rent and Why ? 
select distinct price, description, room_type from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id`;
# The table above have Apt best suited for rent because it is affordable at price range from 45-2500 depending choice
 
#qst 3 Sum of bnb Price in the month of June
select SUM(price) from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where last_review_mons = 'june';

#qst 4 Revenue in The second Quater (April, May, June) 
select Sum(price) from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where last_review_mons in ('April', 'May','June');

#qst 5 Highest Price for an entire Room
select max(price) from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where (select room_Type ='entire home/apt');

#qst 6 Lowest price for a share room
select min(price) from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where room_type in ('shared room');

#qst 7 Average Price For a private Room
select AvG(price) from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where (select room_type = 'private room');

#qst 8 Describe the room type with the Highest and Lowest Room type
select price, description, room_type from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where price = 2500 order by price;

select price, description, room_type from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where price = 16 order by price;

#qst 9 Host Name and bnhood with the lowest Bnb price
select  distinct price, Host_name from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where price =16 ;
# the host name is jeff

#qst 10 Host Name and bnhood with the Highest Bnb price
select price, Host_name from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where price = 2500;
# The host name is Martin

#qst 11 Average bnb Price 
select Avg(price) from airbnb_price ap join airbnb_last_review alr on ap.`listing_id` = alr.`listing_id`
 join airbnb_room_type art on art.`listing_id`;
 
#qst 12 Lowest Bnb Price
select min(price) from airbnb_price ap join airbnb_last_review alr on ap.`listing_id` = alr.`listing_id`
 join airbnb_room_type art on art.`listing_id`;
 
#qst 13 Highest Bnb Price 
select max(price) from airbnb_price ap join airbnb_last_review alr on ap.`listing_id` = alr.`listing_id`
 join airbnb_room_type art on art.`listing_id`;
 
#qst 14 View Different states and Bnb prices in the Dataset
select distinct state, price from airbnb_price ap join airbnb_last_review alr on ap.`listing_id` = alr.`listing_id`
 join airbnb_room_type art on art.`listing_id`;

#qst 15 Count the Number of states available
select count(distinct state) from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id`;

#sqt 16 View the Host Name, nhood and state from the dataset
select distinct host_name,
 nbhood_full, state from airbnb_room_type art  join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id`;

#qst 17 Inspect each columns to see if there are anomalies
select * from airbnb_price ; # we have four columns from this table
select * from airbnb_last_review; # we have 4 columns from this table
select * from airbnb_room_type; # we have 3 columns from this table

#qst 18 What is the total number of rows
select count(*) from airbnb_price;
select count(*) from airbnb_last_review;
select count(*) from airbnb_room_type;

select * from airbnb_room_type art join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id`;

#qst 19 The host name for the highest bnb shared appartment
select host_name, price from airbnb_room_type art join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where room_type = 'shared room' order by price desc limit 1;
 # Gina is the host name with price 115
  
#qst 20 What is the difference in price between highest shared appartment and the lowest private appartment
select max(price) - min(price) from airbnb_room_type art join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id` where room_type = 'shared room';
 
select min(price) from airbnb_room_type art join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id`;
# minimum price is 16, max 115 minus min 16 = 90

#qst 21 Sum up the Total price from the join Table
select sum(price) from airbnb_room_type art join airbnb_last_review arl on art.`listing_id` = arl.`listing_id`
join airbnb_price ap on arl.`listing_id` = ap.`listing_id`;
 # Total Price from airbnb is 543336
