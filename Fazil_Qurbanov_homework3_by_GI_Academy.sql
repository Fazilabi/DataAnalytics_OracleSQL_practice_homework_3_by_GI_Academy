create table products (
    product_id number primary key  not null, 
    product_name varchar(130), 
    category_name varchar(150), 
    price number(10, 4), 
    stock_quantity number
);
drop table customers;

select * from products;

   
    
create table customers (
    customer_id number primary key not null,
    customer_name varchar(150),
    email varchar(150),
    registration_date date,
    product_id number not null,
    
    constraint fk_product 
    foreign key (product_id) 
    references products(product_id)
);
create table orders(
    order_id number primary key not null,
    customer_id number not null,
    order_date date,
    total_amount number,
    
    constraint fk_customer_id
    foreign key (customer_id)
    references customers(customer_id)
);

create table order_items(
    order_item_id number primary key not null,
    quantity number ,
    subtotal number ,
    
    order_id number not null,
    product_id number not null,
    
    constraint fk_order_id
    foreign key (order_id)
    references orders(order_id),
    
    constraint fk_product_id
    foreign key (product_id)
    references products(product_id)
);


select * from superstore;

insert all
    into products (product_id ,product_name ,category_name ,price,stock_quantity) values (4 , 'xiaomi12' , 'electronics', 1000, 25)
    into products (product_id ,product_name ,category_name ,price,stock_quantity) values (5 , 'xiaomi13' , 'electronics', 1200, 15)
    into products (product_id ,product_name ,category_name ,price,stock_quantity) values (6 , 'xiaomi14' , 'electronics', 1400, 10)
select 1 from dual;


insert all
    into products (product_id ,product_name ,category_name ,price,stock_quantity) values (7 , 'samsungA50' , 'electronics', 2000, 12)
    into products (product_id ,product_name ,category_name ,price,stock_quantity) values (8 , 'samsungA60' , 'electronics', 2200, 16)
    into products (product_id ,product_name ,category_name ,price,stock_quantity) values (9 , 'samsungA70', 'electronics', 2400, 18)
select 1 from dual;





    
select * from products;



insert all
    into customers (customer_id ,customer_name ,email ,registration_date,product_id )  values (1 , 'Jas Carroll' , 'jascar@gmail.com', '12-may-2023', 1)
    into customers (customer_id ,customer_name ,email ,registration_date,product_id )  values (2 , 'Trudy Brown' , 'jascar@gmail.com', '10-apr-2023', 2)
    into customers (customer_id ,customer_name ,email ,registration_date,product_id )  values (3 , 'Ted Trevino' , 'jascar@gmail.com', '15-dec-2022', 2)
    into customers (customer_id ,customer_name ,email ,registration_date,product_id )  values (4 , 'Olvera Toch' , 'jascar@gmail.com', '17-jun-2023', 4)
    into customers (customer_id ,customer_name ,email ,registration_date,product_id )  values (5 , 'Bill Donatelli' , 'jascar@gmail.com', '27-oct-2023', 4)
    into customers (customer_id ,customer_name ,email ,registration_date,product_id )  values (6 , 'Jill Matthias' , 'jascar@gmail.com', '03-nov-2023', 6)    
select 1 from dual;

select * from customers;


insert all 
    into orders(order_id,customer_id,order_date,total_amount) values (1 , 3, '17-dec-2023', 500)
    into orders(order_id,customer_id,order_date,total_amount) values (2 , 1, '18-dec-2023', 200)
    into orders(order_id,customer_id,order_date,total_amount) values (3 , 6, '30-dec-2023', 700)
    into orders(order_id,customer_id,order_date,total_amount) values (4 , 5, '25-dec-2023', 300)
    into orders(order_id,customer_id,order_date,total_amount) values (5 , 4, '22-dec-2023', 800)
    into orders(order_id,customer_id,order_date,total_amount) values (6 , 2, '19-dec-2023', 100)
select 1 from dual;

select * from orders;


insert all
    into order_items(order_item_id,quantity ,subtotal, order_id,product_id )   values (1,25,100,1,6)
    into order_items(order_item_id,quantity ,subtotal, order_id,product_id )   values (2,15,200,4,2)
    into order_items(order_item_id,quantity ,subtotal, order_id,product_id )   values (3,20,80,3,3)
    into order_items(order_item_id,quantity ,subtotal, order_id,product_id )   values (4,42,20,4,4)
    into order_items(order_item_id,quantity ,subtotal, order_id,product_id )   values (5,10,800,6,1)
    into order_items(order_item_id,quantity ,subtotal, order_id,product_id )   values (6,18,50,2,5)
select 1 from dual;

select * from order_items;


---Questions

--1. Retrieve the top 5 customers who have spent the most total amount on their orders.
select * from customers c join orders o on c.customer_id=o.customer_id
order by o.total_amount desc
fetch first 5 rows only;

--2. List the product names and their corresponding categories that have never been ordered.
select * from products p left join order_items oi on p.product_id=oi.product_id
where oi.order_id is null;

--3. Find the average order total and the total number of orders placed in the last 30 days.
select avg(o.total_amount) , count(oi.order_id) from orders o join order_items oi on o.order_id=oi.order_id
where extract(day from o.order_date) <=20;

--4. Get the customer names along with the number of distinct categories of products they have ordered.
select p.category_name , c.customer_name
from order_items oi 
join products p on oi.product_id = p.product_id
join orders o on o.order_id = oi.order_id
join customers c on c.customer_id = o.customer_id
group by p.category_name, c.customer_name
;

--5. Retrieve the products with the highest and lowest stock quantities.

select * from products
where stock_quantity in (
    select max(stock_quantity) as highest_quantity from products
    union
    select min(stock_quantity) as lowest_quantity from products
);

update products
set products.stock_quantity = 25
where stock_quantity = 28 and product_name = 'xiaomi12';

update products
set products.stock_quantity = 8
where stock_quantity = 10 and product_name = 'xiaomi14';
    
    


    








