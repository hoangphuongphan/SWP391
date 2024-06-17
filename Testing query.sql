select * from Users as A join UserAccount as B on A.UserID = B.UserID join Account as C on B.AccountID = C.AccountID where Email = 'phoangphuong309@gmail.com'

select * from Account
select * from Users
select * from Shipper

select * from Food
select * from Shop
select * from Category

select * from Discount
select * from DiscountOwner

select * from Orders
select * from OrdersDetail

select * from Wallet

update Wallet set Amount = 1000000 where UserID = 1

select TOP 1 * from Orders where UserID = 1 Order by OrderID desc
select * from Orders as A join OrdersDetail as B on A.OrderID = B.OrderID
select * from Discount as A join DiscountOwner as B on A.DiscountID = B.DiscountID where UserID = 1
select * from Discount as A join DiscountOwner as B on A.DiscountID = B.DiscountID where A.DiscountID = 3

insert into Wallet values (1,800000)

insert into Orders(UserID,ShipLocation,Status) values (1, 'Da Nang','Cooking')
insert into OrdersDetail values  (2,1,4)	
insert into OrdersDetail values(2,2,4)

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