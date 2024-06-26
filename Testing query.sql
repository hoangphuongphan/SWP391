select * from Users as A join UserAccount as B on A.UserID = B.UserID join Account as C on B.AccountID = C.AccountID where Email = 'phoangphuong309@gmail.com'
select * from Shop as A join ShopAccount as B on A.ShopID = B.ShopID join Account as C on B.AccountID = C.AccountID where C.Username = 'shopanvat'
select * from Shipper as A join ShipperAccount as B on A.ShipperID = B.ShipperID join Account as C on B.AccountID = C.AccountID where C.Username = 'shipper1'

select * from Orders as A join OrdersDetail as B on A.OrderID = B.OrderID join Food 
as C on B.FoodID = C.FoodID Where ShopID = 1

select * from Orders as A join OrdersDetail as B on A.OrderID = B.OrderID where A.OrderID = 1007

Select * from Orders where UserID = 1 AND Status <> 'Denied'
select * from Orders
select * from OrdersDetail

delete from OrdersDetail where OrderID = 1004
delete from Orders where OrderID = 1004

select * from Users
select * from Wallet

insert into Wallet values(1,1,1000000)

select * from Shipper
select * from Account

update Shipper set AccountID = 1002 where ShipperID = 1

select Count(*) as Lines from Orders 

select * from Shop as A join ShopAccount as B on A.ShopID = B.ShopID join Account as C on B.AccountID = C.AccountID where A.ShopID = 1
delete from OrdersDetail where OrderID

Update Orders set Status = 'Cooking' where OrderID = 2

select * from ShopAccount
select * from Account
select * from Shop
select * from Food
select * from Category

select * from Shipper
select * from Account
select * from ShipperAccount

select * from Account where Username = 'shopanvat'

select * from Discount
select * from DiscountOwner

select * from Orders
select * from OrdersDetail


select * from Wallet

select * from Account
select * from ShopAccount
select * from Shop

update Wallet set Amount = 1000000 where UserID = 1

select TOP 1 * from Orders where UserID = 1 Order by OrderID desc
select * from Orders as A join OrdersDetail as B on A.OrderID = B.OrderID
select * from Discount as A join DiscountOwner as B on A.DiscountID = B.DiscountID where UserID = 1
select * from Discount as A join DiscountOwner as B on A.DiscountID = B.DiscountID where A.DiscountID = 3

insert into Wallet values (1,800000)

insert into Orders(UserID,ShipLocation,Status) values (1, 'Da Nang','Cooking')
insert into OrdersDetail values  (2,1,4)	
insert into OrdersDetail values(2,2,4)

insert into Account values ('shopanvat','123','Shop')
insert into ShopAccount values(1,2)

insert into Account values ('sunheophp','123456','User')
insert into Users values ('Phuong','0914020508','phoangphuong309@gmail.com',null)
insert into UserAccount values (1,1)

insert into Shop values('Do an ez','0914020508','123 Tran Quoc Toan','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlpG_W0_vkgg7YXKu_ENAQgBaFqh-kqpaGuA&s')
insert into Category values('Do an vat')
insert into Food values(1,1, 20000,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnbmkhQSim64h2vJzu939EAZM8KjeFAp31bw&s','banh trang tron')
insert into Food values (1,1, 15000, 'http://www.savourydays.com/cach-lam-banh-trang-cuon-sot-bo-bonus-banh-trang-tron/', 'banh trang cuon')

update Food set FoodImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKe9wBAIHdUUKA89uIRnV40VQ0AZtsuvlxMg&s' where FoodID = 2

insert into Discount values ('Giam 30%','30%','2024-3-11','2025-11-25')
insert into DiscountOwner values (3,1,5)

insert into Discount values ('Free ship','free-ship','2024-3-11','2025-11-25')
insert into DiscountOwner values (4,1,5)

insert into Account values ('shipper1','123','Shipper')
insert into Shipper values('Phan Hoang Phuong', '0914020508', '43D67397')
insert into ShipperAccount values (1,1002)

