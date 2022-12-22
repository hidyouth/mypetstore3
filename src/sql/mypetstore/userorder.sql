create table userorder
(
    id         int auto_increment
        primary key,
    username   varchar(255)   null,
    itemId     varchar(255)   null,
    num        int            null,
    total_cost decimal(10, 2) null,
    address    varchar(255)   null
);

