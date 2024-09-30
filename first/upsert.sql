insert into product (product_id, title, price, quantity)
values ('f60b78e9-236f-4530-a8b2-fc8990c94aba', 'Книга', '899,99', 12)
on conflict (product_id) do update
set
    title = excluded.title,
    price = excluded.price,
    quantity = excluded.quantity
