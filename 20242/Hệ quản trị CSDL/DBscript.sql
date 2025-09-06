-- Question 2
select * from Customer
where Segment = 'Consumer' and City = 'Arlington';

-- Question 3
select cs.ID, cs.CustomerName, cs.City, cs.State from Customer as cs join Orders as od on cs.ID = od.CustomerID
where od.OrderDate between '2017-12-05 00:00:00.000' and '2017-12-10 00:00:00.000' and datediff(day, od.OrderDate, od.ShipDate) < 3
order by cs.State asc, cs.City desc;

-- Question 4
select odd.OrderID, od.OrderDate, sum(odd.Quantity * odd.SalePrice * (1 - odd.Discount)) as TotalAmount from OrderDetails as odd join Orders as od on odd.OrderID = od.ID
group by odd.OrderID, od.OrderDate
having sum(odd.Quantity * odd.SalePrice * (1 - odd.Discount)) > 8000
order by TotalAmount desc;

-- Question 5
select * from Orders where OrderDate = (select MAX(OrderDate) from Orders);

-- Question 6
with CustomerOrderCounts as (
	select od.CustomerID, cs.CustomerName, count(od.ID) as NumberOfOrders from Orders as od join Customer as cs on cs.ID = od.CustomerID
	group by od.CustomerID, cs.CustomerName
)
select CustomerID, CustomerName, NumberOfOrders from CustomerOrderCounts
where NumberOfOrders = (select max(NumberOfOrders) from CustomerOrderCounts);

-- Question 7
with top5 as (select top 5 * from Product order by UnitPrice desc),
bot5 as (select top 5 * from Product order by UnitPrice asc)
(select * from top5) union all (select * from bot5) order by UnitPrice desc;

-- Question 8
create procedure TotalAmount
	@OrderID nvarchar(255),
	@TotalAmount float output
as
begin
	select @TotalAmount = sum(Quantity * SalePrice * (1 - Discount)) from OrderDetails
	where OrderID = @OrderID
end;

declare @t float
exec TotalAmount 'CA-2014-100006', @t output
print @t

-- Question 9
create trigger InsertSubCategory on SubCategory
after insert
as
begin
	select i.SubCategoryName, c.CategoryName from inserted i join Category c on i.CategoryID = c.id
end;

insert into SubCategory (SubCategoryName, CategoryID) values ('Beds', 2);

-- Question 10
-- select * from Category;
insert into Category (CategoryName) values ('Sports');
insert into SubCategory (SubCategoryName, CategoryID) values ('Tennis', 4);
insert into SubCategory (SubCategoryName, CategoryID) values ('Football', 4);