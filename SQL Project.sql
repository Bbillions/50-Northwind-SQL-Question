-- NORTHWIND DATABASE SAMPLE QUESTION
--  1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select CategoryName, Description
from categories
order by CategoryName;

-- 2. Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select ContactName,CompanyName,ContactTitle,Phone
from customers
order by Phone;

-- 3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively 
-- and HireDate from the employees table sorted from the newest to the oldest employee
select upper(FirstName) as firstname, upper(LastName) as lastname, HireDate
from employees
order by HireDate desc;

/* 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, 
Freight from the orders table sorted by Freight in descending order*/

select OrderID, OrderDate, ShippedDate, CustomerID, Freight
from orders
order by Freight desc
limit 10;

-- 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table. 
select lower(CustomerID) as ID
from customers;

/* 6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table 
sorted by the Country in descending order then by CompanyName in ascending order.*/

select CompanyName, Fax, phone, Country, HomePage
from suppliers
order by Country desc, CompanyName asc;

-- 7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only. 
select CompanyName, ContactName, City
from customers
where City = 'Buenos Aires';

-- 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock
select ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
from products
where UnitsInStock = 0;

-- 9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain. 
select ContactName, Address, City, Country
from customers
where country NOT IN ('Germany','Mexico','Spain');

--         OR
select ContactName, Address, City, Country
from customers
where country != 'Germany' or country != 'Mexico' or country !='Spain';

-- to check the format the date was written
select date_format(ShippedDate, '%Y-%M-%D')
from Orders;

-- 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996. 
select OrderDate, ShippedDate, CustomerID, Freight
from orders
where ShippedDate = '1996-05-21';

-- 11. Create a report showing FirstName, LastName, Country from the employees not from United States. 
select FirstName, LastName, Country
from employees
where country NOT In ('USA');

-- OR
select FirstName, LastName, Country
from employees
where country != 'USA';


/* 12. Create a report that shows the EmployeeID, OrderID, CustomerID, 
RequiredDate, ShippedDate from all orders shipped later than the required date.*/

select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
from orders
where ShippedDate > RequiredDate;

-- 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B. 
select  City, CompanyName, ContactName
from customers
where city like 'A%' or city like 'B%';

-- 14. Create a report showing all the even numbers of OrderID from the orders table. 
select OrderID
from orders
where OrderID % 2 = 0;

-- 15. Create a report showing all the odd numbers of OrderID from the orders table. 
select OrderID
from orders
where OrderID %2 != 0;

-- 16. Create a report that shows all the orders where the freight cost more than $500. 
select OrderID, Freight
from orders
having Freight > 500;

-- OR
select OrderID, Freight
from orders
Where Freight > 500;

-- 17. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder
select productName, UnitsInStock, UnitsOnOrder, ReorderLevel
from products
where UnitsInStock < ReorderLevel;

-- 18. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number. 
select CompanyName, ContactName, fax
from customers
where fax is null;

-- 19. Create a report that shows the FirstName, LastName of all employees that do not report to anybody. 
select FirstName, LastName, ReportsTo
from employees
where ReportsTo is null;

-- 20. Create a report showing all the odd numbers of OrderID from the orders table. 
select OrderID 
from orders
where OrderID %2 != 0;

-- 21. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName
select CompanyName, ContactName, fax
from customers
where fax is null
order by ContactName;

/* 22. Create a report that shows the City, CompanyName, ContactName of customers from cities 
that has letter L in the name sorted by ContactName.*/

select City, CompanyName, ContactName
from customers
where City like '%L%'
order by ContactName;

-- 23. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s. 
select FirstName, LastName, BirthDate
from employees
where BirthDate between '1950-01-01' and '1959-31-12';

-- 24. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table
select FirstName, LastName, year(Birthdate) as Birthyear, month(BirthDate) as Birthmonth
from employees;

/* 25. Create a report showing OrderID, total number of Order ID as NumberofOrders from the
 orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order*/
 
 select OrderID, count(OrderID) as TotalOrders
 from `order details`
 Group by OrderID
 Order by TotalOrders desc;
 
 -- 26. Create a report that shows the SupplierID, ProductName,
 -- CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
 
 select S.SupplierID, S.CompanyName, P.ProductName
 from suppliers S
 join products P on S.SupplierID = P.SupplierID
 where S.CompanyName in ('Exotic liguids', 'Specialty Biscuits, Ltd', 'Escargots Nouveaux')
 order by S.SupplierID;
 
 -- 0r
 
select S.SupplierID, S.CompanyName, P.ProductName
from suppliers S
join products P on S.SupplierID = P.SupplierID
where S.CompanyName = 'Exotic liguids' or S.CompanyName = 'Specialty Biscuits, Ltd' or S.CompanyName = 'Escargots Nouveaux'
order by S.SupplierID;
 
 -- 27. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate,
 -- ShipAddress of all orders with ShipPostalCode beginning with "98124"
 
 select ShipPostalCode,OrderID,OrderDate,RequiredDate,ShippedDate,ShipAddress
 from orders
 where ShipPostalCode like '98124%';
 
 -- 28. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle
 select ContactName, ContactTitle, CompanyName
 from customers
 where ContactTitle not in('Sales');
 
 -- 29. Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle"; 
 select LastName, FirstName, City
 from employees
 where city not in ('Seattle');
 
 -- 30. Create a report that shows the CompanyName, ContactTitle, City, Country of all 
 -- customers in any city in Mexico or other cities in Spain other than Madrid.
 
select CompanyName, ContactTitle, City, Country
from customers
where Country in ('Mexico', 'Spain') and City not in ('Madrid');

-- 31. Create a select statement that outputs the following: 
select concat(ContactName, 'can be reached at','X',PostalCode) as ContactInfo
from customers;

-- 32. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname Create a report 
-- that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname
select ContactName
from customers
where ContactName Not like '_a%';

-- 33. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders 
-- from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively
select round(avg (UnitPrice),0) as AveragePrice, sum(UnitsInStock) as TotalStock, max(UnitsOnOrder) as MaxOrder
from products;

-- 34.  Create a report that shows the SupplierID, CompanyName, CategoryName,
-- ProductName and UnitPrice from the products, suppliers and categories table. 
select P.SupplierID, S.CompanyName, C.CategoryName, P.ProductName, P.UnitPrice
from products P
join suppliers S on P.SupplierID = S.SupplierID
join categories C on P.CategoryID = C.CategoryID;

--  35. Create a report that shows the CustomerID, sum of Freight,from the orders table with sum of freight greater $200, grouped by CustomerID
select CustomerID, sum(Freight) as TotalFrieght
from orders
group by CustomerID
having sum(Freight)>200;

-- 36. Create a report that shows the OrderID ContactName, UnitPrice, Quantity,Discount from the order details, orders and customers table with discount given on every purchase
select O.OrderID, C.ContactName,D.UnitPrice, D.Quantity, D.Discount
from Orders O
join customers C on O.CustomerID = C.CustomerID
join `order details`D on O.OrderID = D.OrderID
where Discount != 0;

-- 37.  Create a report that shows the EmployeeID, the LastName and FirstName as employee,and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee 
select a.EmployeeID, concat(a.FirstName, ' ', a.LastName) As Employee,concat(b.FirstName, ' ', b.LastName) as Manager
from employees a
left join employees b on b.EmployeeID = a.ReportsTo
order by a.EmployeeID;

-- OR
select a.EmployeeID, concat(a.FirstName, ' ', a.LastName) As Employee,concat(b.FirstName, ' ', b.LastName) as Manager
from employees a, employees b
where b.EmployeeID  = a.ReportsTo
order by b.EmployeeID;


-- 38. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively. 
select avg(UnitPrice) as AveragePrice, min(UnitPrice) as MinimumPrice, max(UnitPrice) as MaximumPrice
from products;

/* 39. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, 
-- OrderDate,  RequiredDate,  ShippedDate from the customers and orders table*/
create view CustomerInfo AS
select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.city, c.country, c.phone, o.orderdate, o.requireddate,o.shippeddate
from customers c
join orders o on c.CustomerID = o.CustomerID;

--  40. Change the name of the view you created from customerinfo to customer details.
rename table CustomerInfo to CustomerDetails;

/* 41. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit,
UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables*/
create view ProductDetails As
select P.ProductID, S.CompanyName, P.ProductName, C.CategoryName, C.Description, P.QuantityPerUnit, P.UnitPrice, P.UnitsInStock, P.UnitsOnOrder,
P.Reorderlevel, P.Discontinued
from products P
join categories C on P.CategoryID = C.CategoryID
join suppliers S on P.SupplierID = S.SupplierID;

-- 42. Drop the customer details view. 
drop view customerdetails;
drop view yearly_sale;


-- 43. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
select substring(description, 1, 5) as ShortInfo
from categories;

-- 44. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table 

create table shippers_duplicate like shippers;
insert INTO shippers_duplicate select *from shippers;

alter table shippers_duplicate
add Email varchar(50);


update shippers_duplicate set email = 'shippers1@gmail.com' where ShipperID = 1;
update shippers_duplicate set email = 'shippers2@gmail.com' where ShipperID = 2; 
update shippers_duplicate set email = 'shippers3@gmail.com' where ShipperID = 3;


-- 45. Create a select statement that outputs the following from the shippers_duplicate 
select shipperID, CompanyName, Phone, Email
from shippers_duplicate;

-- 46. Create a report that shows the CompanyName and ProductName from all product in the Seafood category. 
select S.CompanyName, P.ProductName, C.CategoryName
from products P
join suppliers S on P.SupplierID = S.SupplierID
join categories C on P.CategoryID = C.CategoryID
where C.CategoryName = 'Seafood';

-- 47. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5. 
select P.CategoryID, P.ProductName, S.CompanyName
from products P
join suppliers S on P.SupplierID = S.SupplierID
where CategoryID = 5;

-- 48. Delete the shippers_duplicate table
drop table  shippers_duplicate;

-- 49. Create a select statement that ouputs the following from the employees table. 
select FirstName, LastName, Title, date_format(from_days(datediff(now(),BirthDate)), '%Y') + 0 As Age
from employees;

-- to add age to the table
alter table employees
add age int;

update employees 
set age = date_format(from_days(datediff(now(),BirthDate)), '%Y') + 0
where EmployeeID;


select *from employees;


/* 50. Create a report that the CompanyName and total number of orders by customer renamed as
 number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.*/ 
select C.CompanyName, count(C.CustomerID) as TotalOrder, O.Orderdate
from customers C
inner join orders O on C.CustomerID = O.CustomerID
where O.OrderDate >= '1994-12-31'
group by C.CustomerID, C.CompanyName, O.OrderDate
having C.CustomerID >10 ;


-- 51. Create a select statement that ouputs the following from the product table 
select concat(ProductName ,'weighs/is',QuantityPerUnit, 'and cost', '$', UnitPrice) as Productinfo
from products;