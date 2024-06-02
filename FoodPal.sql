Create database Foodpal;

-- tao bang user
create table Users(
	UserID int primary key,
	Name nvarchar(50) not null,
	Phone varchar(10) not null,
	Location nvarchar(100)
)

-- tao bang Shop
create table Shop(
	ShopID int primary key,
	Name nvarchar(50) not null,
	Phone varchar(10) not null,
	Location nvarchar(100) not null,
	ShopImage varchar(100)
)

-- tao bang shipper
create table Shipper(
	ShipperID int primary key,
	Name nvarchar(50) not null,
	Phone varchar(10) not null,
	VehicleID varchar(20) not null,
)

-- tao bang admin
create table Admin(
	AdminID int primary key,
	Name nvarchar(50) not null,
)

-- tao bang category
create table Category(
	CateID int primary key,
	Name nvarchar(50) not null
)

create table Food(
	ShopID int foreign key references Shop(ShopID),
	FoodID int,
	CateID int foreign key references Category(CateID),
	Price money,
	FoodImage varchar(100),
	primary key (ShopID, FoodID, CateID)
)

create table Review(
	FoodID int foreign key references Food(FoodID),
	ReviewID int,
	UserID int foreign key references Users(UserID),
	content nvarchar(200)
	primary key (FoodID, ReviewID, UserID)
)

create table Rate(
	FoodID int foreign key references Food(FoodID),
	RateID int,
	UserID int foreign key references Users(UserID),
	Rate int,
	constraint Rate CHECK (Rate between 0 and 5),
	primary key (FoodID, RateID, UserID)
)

create table ReportFood(
	ReportFoodID int,
	UserID int foreign key references Users(UserID),
	FoodID int foreign key references Food(FoodID),
	content nvarchar(200),
	primary key (FoodID, ReportFoodID, UserID)
)

create table ReportShop(
	ReportFoodID int,
	UserID int foreign key references Users(UserID),
	ShopID int foreign key references Shop(FoodID),
	content nvarchar(200),
	primary key (ShopID, ReportFoodID, UserID)
)

create table ReportShipper(
	ReportFoodID int,
	UserID int foreign key references Users(UserID),
	ShipperID int foreign key references Shipper(ShipperID),
	content nvarchar(200),
	primary key (ShipperID, ReportFoodID, UserID)
)

create table Orders{
	OrderID int,
	ShopID int foreign key references Shop(ShopID),
	UserID int foreign key references Users(UserID),
	Time Date,
	primary key (OrderID, ShopID, UserID)
)

create table Orders{
	OrderID int foreign key references Orders(OrderID),
	FoodID int foreign key references Food(FoodID),
	Amount int,
	primary key (OrderID, FoodID)
)

-- tao bang account
create table Account(
	AccountID int primary key,
	Username varchar(20) not null,
	Password varchar(20) not null,
	Type varchar(20) not null Check (Type in ('User','Shop'))
)

create table UserAccount(
    UserAccountID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    AccountID INT FOREIGN KEY REFERENCES Account(AccountID)
);

	

