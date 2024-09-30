drop table product;

create table product
(
    product_id uuid primary key,
    title      text              not null,
    price      numeric(12, 2)    not null,
    quantity   integer default 0 not null
);

insert into product (product_id, title, price, quantity)
values ('f60b78e9-236f-4530-a8b2-fc8990c94aba', 'Книга', '899,99', 12);

select product_id, title, price, quantity
from product
where quantity > 1;

alter table product add column version integer default 0;

create table "order"
(
    order_id    uuid not null primary key,
    name        text not null,
    phont       text not null
);

create table order_item
(
    order_item_id uuid    not null primary key,
    order_id      uuid    not null,
    product       uuid    not null,
    quantity      integer not null
);

-- some foreign keys
