create table lineitem
(
    orderid   int            not null,
    linenum   int            not null,
    itemid    varchar(10)    not null,
    quantity  int            not null,
    unitprice decimal(10, 2) not null,
    primary key (orderid, linenum)
);

