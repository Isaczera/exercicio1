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
foreign key(OfficeCode) references employees(EmployeeNumber),
primary key (OfficeCode)
);

insert into productlines(ProductLine, TextDescription, HtmlDescription, image)
Values("01", "Danone", "htmlDanone" , "https://ibassets.com.br"),
("02", "Tomate", "htmlTomate" , "data:image/jpeg;base64,/9j");

insert into products(ProductCode, ProductName, ProductLine, ProductScale, ProductVendor, ProductDescription, QuantityInStock, BuyPrice, MSRP)
Values(01, "Danone", "01", 100, " Danone S.A.", "liquido", 200, 10, 8),
(02, "Tomate", "02", 55, "Embrapa", "Fruta", 500, 5, 3);

insert into orderdetails(OrderNumber, ProductCode, QuantityOrdered, PriceEach, OrderLineNumber)
Values(11, 01, 167, 2, 1),
(12, 02, 475, 7, 2);

insert into orders(OrderNumber, OrderDate, RequiredDate, ShippedDate, statos, comments, CustomerNumber) 
values (11, "2022-12-02", "2022-12-03", "2022-12-20", "Enviado", "Atraso no envio", 21),
(12, "2022-12-25", "2023-01-01", "2023-01-02", "Chegando no destino", "Tudo ok", 22);


insert into customers(CustomerNumber, CustomerName, ContactLastName, ContactFirstName, Phone, AddressLine1, AddressLine2, City, State, PostalCode, Country, SalesRepEmployeeNumber, CreditLimit)
Values(11, "Daniel", "Barbosa", "Daniel", 19997190455, "Rua Joao Previtale", "Jardim Alto da Colina", "Valinhos", "São Paulo", 13272315, "Brasil", 101, 10000),
(12, "Alessandra", "Carneiro", "Alessandra", 19997191466, "Rua Orlando Marrone", "Boa Vista", "Valinhos", "São Paulo", 13272101, "Brasil", 102, 20000);

insert into payments(CustomerNumber, CheckNumber, PaymentDate, Amount)
Values(11, 201, "2023-02-12", 6000),
(12, 206, "2023-03-06", 20000);

insert into employees(EmployeeNumber, LastName, FirstName, Extension, Email, OfficeCode, ReportsTo, JobTitle)
Values(11, "Barbosa", "Daniel", "Afonso", "danielbarbosa@gmail.com", 204, "Daniel", "Diretor"),
(12, "Carneiro", "Alessandra", "Silva", "leca02@gmail.com", 340, "Alessandra", "Diretora");

insert into offices(OfficeCode, City, Phone, AddressLine1, AddressLine2, State, Country, PostalCode, Territory)
Values(11, "Campinas", 199972454, "Rua Mange", "Jardim Alberto", "São Paulo", "Brasil", 12345214, "interior"),
(12, "Campinas", 199902314, "Rua Roberto", "Jardim Botanico", "São Paulo", "Brasil", 14325789, "interior");
