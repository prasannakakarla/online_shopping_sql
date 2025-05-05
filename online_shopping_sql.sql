drop database online_shopping;
create database online_shopping;
use online_shopping;
create table admin(
	admin_id int auto_increment primary key,
    username varchar(255) not null,
    password varchar(255) not null
);

create table seller(
	seller_id int auto_increment primary key,
    name varchar(255) not null,
    email varchar(255) not null,
    phone varchar(255) not null,
    password varchar(255) not null,
    address varchar(255) not null,
    status varchar(255) default('unauthorized')
);
create table categories(
	categories_id int auto_increment primary key,
    category_name varchar(255) not null
);
create table sub_categories(
	sub_categories_id int auto_increment primary key,
    sub_category_name varchar(255) not null,
    categories_id int,
    foreign key(categories_id) references categories(categories_id)
);
create table products(
	product_id INT auto_increment primary key,
	name VARCHAR(255) not null,
	price VARCHAR(255) not null,
	brand_name VARCHAR(255) not null,
	product_image VARCHAR(255) not null,
	description VARCHAR(255) not null,
	quantity VARCHAR(255) not null,
	seller_id INT,
	sub_categories_id INT,
	foreign key(sub_categories_id) references sub_categories(sub_categories_id),
	foreign key(seller_id) references seller(seller_id)

);
create table customers(
	customer_id INT auto_increment primary key,
	name VARCHAR(255) not null,
	email VARCHAR(255) unique,
	phone VARCHAR(255) unique,
	address VARCHAR(255) not null,
	password VARCHAR(255) unique not null
);
create table orders(
	order_id INT auto_increment primary key,
	datetime VARCHAR(255) not null,
	status VARCHAR(255),
	seller_id INT,
	customer_id INT,
	foreign key(seller_id) references seller(seller_id),
	foreign key(customer_id) references customers(customer_id)
);
create table order_items(
	order_items_id INT auto_increment primary key,
	quantity VARCHAR(255) not null,
	order_id INT,
	product_id INT,
	foreign key(order_id) references orders(order_id),
	foreign key(product_id ) references products(product_id )
);
create table payments(
	payment_id INT auto_increment primary key,
	card_holder_name VARCHAR(255) not null,
	card_number VARCHAR(255) not null unique,
	payment_date VARCHAR(255) not null,
	amount VARCHAR(255) not null,
	cvv VARCHAR(255) not null,
	status VARCHAR(255),
	order_id INT,
	foreign key(order_id) references orders(order_id)
);
create table reviews(
	review_id INT  auto_increment primary key,
	order_items_id INT ,
	review VARCHAR(255) not null,
	rating VARCHAR(255) not null,
    foreign key(order_items_id) references order_items(order_items_id)
);
create table delivery_agencies(
	delivery_agencies_id INT auto_increment primary key,
	name VARCHAR(255) not null,
	email VARCHAR(255) unique,
	phone VARCHAR(255) unique,
	address VARCHAR(255) not null,
	password VARCHAR(255) not null
);

