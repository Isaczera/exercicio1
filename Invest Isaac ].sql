/*projeto atualizado 21:41*/

create database investimentos;
use investimentos;

create table aCONSULTORINVESTIMENTO(
NumConsultor bigint not null auto_increment,
NomeConsultor varchar(30) not null,
Percentual_comissao numeric(10,2) not null,
primary key (NumConsultor)
);

create table aAPLICACAO(
NumAplicacao bigint not null auto_increment,
CodCli bigint not null,
NumFundo bigint not null,
NumConsultor bigint not null,
DtAplicacao datetime not null,
Valoraplicacao numeric(10,2),
foreign key(Numconsultor) references aCONSULTORINVESTIMENTO(NumConsultor),
primary key (NumAplicacao)
);

create table aFUNDOINVESTIMENTO(
NumFundo bigint not null auto_increment,
NomeComlFundo varchar(60) not null,
CodTipoFundo bigint not null,
DtInicio datetime not null,
Atibo_S_N char(1),
foreign key(CodTipoFundo) references aAPLICACAO(NumAplicacao),
primary key (NumFundo) 
);

create table aTIPOFUNDO(
CodTipoFundo bigint not null auto_increment,
DescrTipoFundo varchar(30) not null,
foreign key(CodTipoFundo) references aFUNDOINVESTIMENTO(NumFundo),
primary key (CodTipoFundo)
);

create table aCLIENTE(
CodCli bigint not null auto_increment,
NomeCli varchar(50) not null,
DtNascimento datetime not null,
CPF varchar(11),
foreign key(CodCli) references aAPLICACAO(NumAplicacao),
primary key (CodCli)
);

insert into aCONSULTORINVESTIMENTO(NumConsultor, NomeConsultor, Percentual_Comissao)
Values(12, "Daniel Afonso", 12.3);

insert into aAPLICACAO(NumAplicacao, CodCli, NumFundo, NumConsultor, DtAplicacao, ValorAplicacao)
values(5, 1, 100, 12, '2021-12-03', 1.200); 

insert into aFUNDOINVESTIMENTO(NumFundo, NomeComlFundo, CodTipoFundo, DtInicio, Atibo_S_N)
values(1, "CDB", 1, '2021-12-03', "S");

insert into aTIPOFUNDO(CodTipoFundo, DescrTipoFundo)
values(1, "Renda fixa");

insert into aCLIENTE(CodCli, NomeCli, DtNascimento, CPF)
values(5, "Daniel Barbosa", '1975-02-03', 19999773869);

select *from aAPLICACAO a 
join aCLIENTE c on c.CodCli = a.CodClienteFk
join consultorinvestimento ci on ci.NumConsultor = a.numConsultorFK
join fundoinvestimento f on f.numFundo = a.numFundoFK
join tipofundo t on t.CodTipoFundo = f.codtipofundofk