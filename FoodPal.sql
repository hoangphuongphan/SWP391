Create database Foodpal;

-- tao bang user
create table Users(
	UserID int IDENTITY(1,1) primary key,
	Name nvarchar(50) not null,
	Phone varchar(10) not null,
	Email varchar(50) not null,
	Location nvarchar(100)
)

-- tao bang Shop
create table Shop(
	ShopID int IDENTITY(1,1) primary key,
	Name nvarchar(50) not null,
	Phone varchar(10) not null,
	Location nvarchar(100) not null,
	ShopImage varchar(100)
)

-- tao bang shipper
create table Shipper(
	ShipperID int IDENTITY(1,1) primary key,
	Name nvarchar(50) not null,
	Phone varchar(10) not null,
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
	primary key (FoodID)
)

create table Review(
	FoodID int foreign key references Food(FoodID),
	ReviewID int IDENTITY(1,1),
	UserID int foreign key references Users(UserID),
	content nvarchar(200)
	primary key (FoodID, ReviewID, UserID)
)

create table Rate(
	FoodID int foreign key references Food(FoodID),
	RateID int IDENTITY(1,1),
	UserID int foreign key references Users(UserID),
	Rate int,
	constraint Rate CHECK (Rate between 0 and 5),
	primary key (FoodID, RateID, UserID)
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
	Time smallDateTime default getDate(),
	ShipLocation nvarchar(200) not null,
	Status nvarchar(20) Check(Status in ('Cooking','Shipping','Done')),
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
	Username varchar(20) not null,
	Password varchar(20) not null,
	Type varchar(20) not null Check (Type in ('User','Shop','Shipper'))
)

create table UserAccount(
    UserAccountID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    AccountID INT FOREIGN KEY REFERENCES Account(AccountID)
)
	
	
-- Tạo bảng ShopAccount (Tài khoản cửa hàng)
CREATE TABLE ShopAccount (
    ShopAccountID INT IDENTITY(1,1) PRIMARY KEY,
    ShopID INT FOREIGN KEY REFERENCES Shop(ShopID),
    AccountID INT FOREIGN KEY REFERENCES Account(AccountID)
	
);

create table ShipperAccount(
	ShipperAccountID int IDENTITY(1,1) primary key,
	ShipperID int foreign key references Shipper(ShipperID),
	AccountID int foreign key references Account(AccountID)
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
	UserID int foreign key references Users(UserID) primary key,
	Amount money not null)

