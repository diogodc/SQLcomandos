-- 1)select * from Products where Discontinued <> 1;
-- 2) select * from Customers;
-- 3) select * from Employees;
-- 4) select BirthDate from Employees;
-- 5) select BirthDate from Employees where EmployeeID = 1 ;
-- 6) select LastName + ' ' + FirstName AS NomeCompleto from Employees where EmployeeID = 1 ;
-- 7) select SupplierID,CompanyName,Address from Suppliers;
-- 8) select SupplierID,CompanyName,Address from Suppliers order by CompanyName;
-- 9) select Country from Suppliers order by Country DESC;
-- 10) select distinct Country from Suppliers order by Country DESC;
-- 11) select Address from Customers where Country = 'Germany' order by 1;
-- 12) select * from Products where SupplierID = 5 and UnitsInStock > 5;
-- 13) select * from Orders where CustomerID IN ('ALFKI', 'BONAP', 'GODOS');
-- 14) select * from Orders where CustomerID NOT IN ('ALFKI', 'BONAP', 'GODOS');
-- 15) select O.* from Orders O, Customers C where O.CustomerID = C.CustomerID and C.City = 'Madrid';
-- 16) select Address from Suppliers where City in ('Lisboa','London','Tokyo','Madrid');
-- 17) select Address from Customers where City NOT IN ('Lisboa', 'London');
-- 18) select * from Products where UnitsInStock > 0 and UnitPrice <= 15 and SupplierID NOT IN (1,2,3)
-- order by ProductName;
-- 19) select O.* from Orders O, [Order Details] OD where 
-- O.OrderID = OD.OrderID and OD.ProductID IN (1, 23, 45) and OD.Quantity > 2;
-- 20) select C.*, from Customers C,  Orders O, [Order Details] OD where 
-- C.CustomerID = O.CustomerID and O.OrderID = OD.OrderID and OD.ProductID IN (5, 45);
-- 21)
select C.Customers 




