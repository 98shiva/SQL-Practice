-- List every record from the customers table.
SELECT * FROM boat_sales.customers;

-- Show the unique states where customers are located, sorted alphabetically.
select distinct state from customers
order  by state;

-- Return the first 10 customers as they appear in the table.
select * from customers
limit 10;

-- Find customers whose age is greater than 35.
select * from customers
where age > 35;

-- List customers whose first name starts with the letter ‘A’.
select * from customers 
where first_name like "A%";

-- Show customers whose email address uses the ‘gmail.com’ domain.
select * from customers where email like "%gmail.com";

-- Retrieve customers who registered in the year 2024.
select * from customers where  year(signup_date) = 2024;


-- Return customers whose age is between 20 and 30 (inclusive).
select * from customers where age between 20 and 30;

-- List customers who live in any of these cities: Mumbai, New Delhi, Bengaluru, or Jaipur.
select * from customers where city in ("Mumbai","New Delhi","Bengaluru","Jaipur");

-- List customers who do not live in these cities: Mumbai, New Delhi, Bengaluru, or Jaipur.
select * from customers where city not in ("Mumbai","New Delhi","Bengaluru","Jaipur");

-- Show the 5 oldest customers, from oldest to youngest.
select * from customers order  by age desc limit 5;

-- Show the 5 youngest customers, from youngest to oldest.
select * from customers order  by age  limit 5;

-- Find customers whose phone number starts with ‘9’.
select * from customers where phone like "9%";

-- Return all orders placed in the year 2025.
select * from customers where year(signup_date) = 2025;

-- List products priced between 10,000 and 50,000, ordered from highest to lowest price.
SELECT * FROM boat_sales.products;
select * from products where price between 10000 and 50000 order by price desc; 




























