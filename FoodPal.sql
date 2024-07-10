Create database Foodpal;
-- tao bang user
create table Users(
	UserID int IDENTITY(1,1) primary key,
	AccountID int,
	Name nvarchar(50) not null,
	Phone varchar(20) not null,
	Email varchar(50) not null,
	Location nvarchar(100)
)

-- tao bang Shop
create table Shop(
	ShopID int IDENTITY(1,1) primary key,
	AccountID int,
	Name nvarchar(50) not null,
	Phone varchar(10) not null,
	Location nvarchar(100) not null,
	ShopImage varchar(100),
	ShopEmail varchar(100),
	Status int
)


-- tao bang shipper
create table Shipper(
	ShipperID int IDENTITY(1,1) primary key,
	AccountID int,
	Name nvarchar(50) not null,
	Phone varchar(20) not null,
	VehicleID varchar(20) not null,
)

-- tao bang admin
create table Admin(
	AdminID int IDENTITY(1,1) primary key,
	Name nvarchar(50) not null,
)

-- tao bang category
create table Category(
	CateID int IDENTITY(1,1) primary key,
	Name nvarchar(50) not null
)

create table Food(
	ShopID int foreign key references Shop(ShopID),
	FoodID int IDENTITY(1,1),
	CateID int foreign key references Category(CateID),
	Price money,
	FoodImage varchar(100),
	Foodname nvarchar(100),
	Status int,
	primary key (FoodID)
)

create table Review(
	FoodID int foreign key references Food(FoodID),
	ReviewID int IDENTITY(1,1) primary key,
	UserID int foreign key references Users(UserID),
	RateID int foreign key references RateFood(RateID),
	content nvarchar(200)
)


create table RateFood(
	FoodID int foreign key references Food(FoodID),
	RateID int IDENTITY(1,1) primary key,
	UserID int foreign key references Users(UserID),
	Rate int,
	constraint Rate CHECK (Rate between 0 and 5),
)

create table ReportFood(
	ReportFoodID int IDENTITY(1,1),
	UserID int foreign key references Users(UserID),
	FoodID int foreign key references Food(FoodID),
	content nvarchar(200),
	primary key (FoodID, ReportFoodID, UserID)
)

create table ReportShop(
	ReportFoodID int IDENTITY(1,1),
	UserID int foreign key references Users(UserID),
	ShopID int foreign key references Shop(ShopID),
	content nvarchar(200),
	primary key (ShopID, ReportFoodID, UserID)
)

create table ReportShipper(
	ReportFoodID int IDENTITY(1,1),
	UserID int foreign key references Users(UserID),
	ShipperID int foreign key references Shipper(ShipperID),
	content nvarchar(200),
	primary key (ShipperID, ReportFoodID, UserID)
)

create table Orders(
	OrderID int IDENTITY(1,1),
	UserID int foreign key references Users(UserID),
	ShopID int foreign key references Shop(ShopID),
	Time smallDateTime default getDate(),
	ShipLocation nvarchar(200) not null,
	Status nvarchar(20) Check(Status in ('Cooking','Shipping','Done','Denied')),
	primary key (OrderID)
)

create table OrdersDetail(
	OrderID int foreign key references Orders(OrderID),
	FoodID int foreign key references Food(FoodID),
	Amount int,
	primary key (OrderID, FoodID)
)

-- tao bang account
create table Account(
	AccountID int IDENTITY(1,1) primary key,
	Username varchar(20) not null unique,
	Password varchar(20) not null,
	Type varchar(20) not null Check (Type in ('User','Shop','Shipper'))
)

create table Discount(
	DiscountID int IDENTITY(1,1) primary key,
	DiscountName nvarchar(50),
	Offer varchar(20),
	ValidDate DateTime default getDate(),
	ExpiredDate Date not null
)


create table DiscountOwner(
	DiscountID int foreign key references Discount(DiscountID),
	UserID int foreign key references Users(UserID),
	stock int constraint stock check(stock>-1)
	primary key (DiscountID,UserID)
)

create table Wallet(
	UserID int foreign key references Users(UserID),
	Type int,
	Amount money not null,
	primary key (UserID,Type)
)

create table Ticket(
	TicketID int primary key,
	UserID int foreign key references Users(UserID),
	Subject nvarchar(50),
	Content nvarchar(500)
)

 insert into Account values
('ptt@123','123','User'),
('pnt@123','123','User'),
('dnd@123','123','User'),
('hcm@123','123','User'),
('ptt@123','123','User'),
('ttt@123','123','User'),
('ntp@123','123','User')

insert into Users values
(2002,'Phung Nhat Tan','0382958373','email1@gmail.com',null),
(2003,'Do Ngoc Duc','0382943254','email2@gmail.com',null),
(2004,'Hoang Cong minh','0384262575','email3@gmail.com',null),
(2005,'Phan Thanh Tai','0382958361','email4@gmail.com',null),
(2008,'Phan Minh Thanh','0382954372','email5@gmail.com',null),
(2006,'Than Tuyet Trinh','0382954324','email6@gmail.com',null),
(2007,'Nguyen trong Phuong','0382952345','email7@gmail.com',null)

insert into Account values
('shop1','123','Shop'),
('shop2','123','Shop'),
('shop3','123','Shop'),
('shop4','123','Shop'),
('shop5','123','Shop'),
('shop6','123','Shop'),
('shop7','123','Shop')

insert into Shop values
('Phuc Drink','0943050702','12 Dinh Tien Hoang','https://media.loveitopcdn.com/3807/thumb/logo-phuc-drink-3-compressed.jpg',2009),
('Ba Mua','0943043254','12 Nguyen Chi Thanh','https://static.vinwonders.com/2022/04/quan-an-ngon-da-nang-13.png',2010),
('Mi Quang Ech','0944343254','12 Phan Chau Trinh','https://static.vinwonders.com/production/quan-an-ngon-da-nang-10.jpg',2011),
('Dasushi','0943045554','12 Nguyen Sinh Cung','https://static.vinwonders.com/2022/04/quan-an-ngon-da-nang-12.png',2012),
('bun Mam Van','0943432254','12 Nguyen tri Phuong','https://cdn3.ivivu.com/2023/11/quan-an-ngon-da-nang-ivivu.jpg',2013),
('Mi Quang 1A','0943543254','12 Hai Phong','https://cdn3.ivivu.com/2023/11/quan-an-ngon-da-nang-ivivu6.jpg',2014),
('Bnh Mi Nuong Lang Son','0943044354','12 Dong Da','https://cdn3.ivivu.com/2023/11/quan-an-ngon-da-nang-ivivu17.jpg',2015)

insert into Account values
('ship1','123','Shipper'),
('ship2','123','Shipper'),
('ship3','123','Shipper'),
('ship4','123','Shipper'),
('ship5','123','Shipper'),
('ship6','123','Shipper')

insert into Shipper values 
('Do Ngoc Duc','0932054032','43D392053',2016),
('Phung Nhat Tan','09323434032','43D3923423',2017),
('Hoang Cong Minh','0933214032','43D395433',2018),
('Than Tuyet Trinh','084232032','43D392654',2019),
('Hoang Thao My','0932432032','43D555053',2020),
('Do Minh Duc','0943252232','43D365432',2021)

insert into Category values 
('Do an nhanh'),
('lau'),
('nuoc uong'),
('com, bun, mi')