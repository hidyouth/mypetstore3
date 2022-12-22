create table product
(
    productid varchar(10)  not null
        primary key,
    category  varchar(10)  not null,
    name      varchar(80)  null,
    descn     varchar(255) null,
    constraint fk_product_1
        foreign key (category) references category (catid)
);

create index productCat
    on product (category);

create index productName
    on product (name);

