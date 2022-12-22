create table orders
(
    orderid         int            not null
        primary key,
    userid          varchar(80)    not null,
    orderdate       date           not null,
    shipaddr1       varchar(80)    not null,
    shipaddr2       varchar(80)    null,
    shipcity        varchar(80)    not null,
    shipstate       varchar(80)    not null,
    shipzip         varchar(20)    not null,
    shipcountry     varchar(20)    not null,
    billaddr1       varchar(80)    not null,
    billaddr2       varchar(80)    null,
    billcity        varchar(80)    not null,
    billstate       varchar(80)    not null,
    billzip         varchar(20)    not null,
    billcountry     varchar(20)    not null,
    courier         varchar(80)    not null,
    totalprice      decimal(10, 2) not null,
    billtofirstname varchar(80)    not null,
    billtolastname  varchar(80)    not null,
    shiptofirstname varchar(80)    not null,
    shiptolastname  varchar(80)    not null,
    creditcard      varchar(80)    not null,
    exprdate        varchar(7)     not null,
    cardtype        varchar(80)    not null,
    locale          varchar(80)    not null
);
