create table profile
(
    userid      varchar(80) not null
        primary key,
    langpref    varchar(80) not null,
    favcategory varchar(30) null,
    mylistopt   int         null,
    banneropt   int         null
);

