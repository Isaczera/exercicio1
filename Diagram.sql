create database diagram;
use diagram;

create table productlines(
ProductLine varchar(100) not null,
TextDescription varchar(50) not null, 
HtmlDescription varchar(50) not null,
image varchar(70) not null, 
primary key (ProductLine)
);

create table products(
ProductCode bigint not null auto_increment,
ProductName varchar(100) not null, 
ProductLine varchar(100) not null, 
ProductScale bigint not null,
ProductVendor varchar(150) not null,
ProductDescription varchar(100) not null,
QuantityInStock bigint not null,
BuyPrice bigint not null,
MSRP bigint not null,
foreign key (ProductLine) references productlines(ProductLine),
primary key (ProductCode)
);

create table orderdetails(
OrderNumber bigint not null auto_increment,
ProductCode bigint not null, 
QuantityOrdered bigint not null,
PriceEach bigint not null,
OrderLineNumber bigint not null,
foreign key(ProductCode) references products(ProductCode),
primary key (OrderNumber)
);

create table orders(
OrderNumber bigint not null auto_increment,
OrderDate datetime not null,
RequiredDate date not null,
ShippedDate datetime not null,
statos varchar(50) not null,
comments varchar(150) not null,
CustomerNumber bigint not null,
foreign key (OrderNumber) references orderdetails (OrderNumber),
primary key (OrderNumber)
);

create table customers(
CustomerNumber bigint not null auto_increment,
CustomerName varchar(100) not null,
ContactLastName varchar(50) not null,
ContactFirstName varchar(50) not null,
Phone bigint not null,
AddressLine1 varchar(100) not null, 
AddressLine2 varchar(100) not null, 
City varchar(50) not null,
State varchar(50) not null,
PostalCode bigint not null, 
Country varchar(50) not null,
SalesRepEmployeeNumber bigint not null,
CreditLimit bigint not null,
foreign key (CustomerNumber) references orders (OrderNumber),
primary key (CustomerNumber)
);

create table payments(
CustomerNumber bigint not null auto_increment,
CheckNumber bigint not null,
PaymentDate date not null,
Amount bigint not null,
foreign key(CustomerNumber) references customers(CustomerNumber),
primary key(CustomerNumber)
);

create table employees(
EmployeeNumber bigint not null auto_increment,
LastName varchar(50) not null, 
FirstName varchar(50) not null,
Extension varchar(50) not null, 
Email varchar(70) not null,
OfficeCode bigint not null,
ReportsTo varchar(50) not null,
JobTitle varchar(50) not null,
foreign key(EmployeeNumber) references customers (CustomerNumber),
primary key (EmployeeNumber)
);

create table offices(
OfficeCode bigint not null auto_increment,
City varchar(50) not null,
Phone bigint not null,
AddressLine1 varchar(100) not null,
AddressLine2 varchar(100) not null,
State varchar(50) not null, 
Country varchar(50) not null,
PostalCode bigint not null,
Territory varchar(100) not null,
foreign key() references employees(),
primary key (OfficeCode)
);

insert into productlines(ProductLine, TextDescription, HtmlDescription, image)
Values(Danone, Liquido, , https://ibassets.com.br/ib.item.image.big/b-603f4494184e4c70b75ea58e9e2983b9.jpeg);

insert into products(ProductCode, ProductName, ProductLine, ProductScale, ProductVendor, ProductDescription, QuantilyInStock, BuyPrice, MSRP)
Values(001, Iorgute, Danone, );

insert into orderdetails(OrderNumber, ProductCode, QuantityOrdered, PriceEach, OrderLineNumber)
Values();

insert into orders(OrderNumber, OrderDate, RequiredDate, ShippedDate, Status, Comments, CustomerNumber)
Values();

insert into customers(CustomerNumber, CustomerName, ContactLastName, ContactFirstName, Phone, AddressLine1, AddressLine2, City, State, PostalCode, Country, SalesRepEmployeeNumber, CreditLimit)
Values();

insert into payments(CustomerNumber, CheckNumber, PaymentDate, Amount)
Values();

insert into employees(EmployeeNumber, LastName, FirstName, Extension, Email, OfficeCode, ReportsTo, JobTitle)
Values();

insert into offices(OfficeCode, City, Phone, AddressLine1, AddressLine2, State, Country, PostalCode, Territory)
Values();
