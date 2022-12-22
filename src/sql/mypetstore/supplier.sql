create table supplier
(
    suppid int         not null
        primary key,
    name   varchar(80) null,
    status varchar(2)  not null,
    addr1  varchar(80) null,
    addr2  varchar(80) null,
    city   varchar(80) null,
    state  varchar(80) null,
    zip    varchar(5)  null,
    phone  varchar(80) null
);

