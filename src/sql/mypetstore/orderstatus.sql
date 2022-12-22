create table orderstatus
(
    orderid   int        not null,
    linenum   int        not null,
    timestamp date       not null,
    status    varchar(2) not null,
    primary key (orderid, linenum)
);

