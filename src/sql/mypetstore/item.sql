create table item
(
    itemid    varchar(10)    not null
        primary key,
    productid varchar(10)    not null,
    listprice decimal(10, 2) null,
    unitcost  decimal(10, 2) null,
    supplier  int            null,
    status    varchar(2)     null,
    attr1     varchar(80)    null,
    attr2     varchar(80)    null,
    attr3     varchar(80)    null,
    attr4     varchar(80)    null,
    attr5     varchar(80)    null,
    constraint fk_item_1
        foreign key (productid) references product (productid),
    constraint fk_item_2
        foreign key (supplier) references supplier (suppid)
);

create index itemProd
    on item (productid);

