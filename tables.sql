CREATE TABLE users(
id serial primary key,
username VARCHAR(225) UNIQUE NOT NULL,
firstname VARCHAR(225),
lastname VARCHAR(225),
city_id INTEGER UNIQUE,
phone VARCHAR(20),
email VARCHAR(100),
password_ VARCHAR(225) NOT NULL,
user_role VARCHAR(225) DEFAULT 'Customer' --'Customer', 'Author', 'Admin'
FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE author(
id serial primary key,
user_id INTEGER UNIQUE,
goodreads_link TEXT,
bank_account_number VARCHAR(50),
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE book(
id serial primary key,
title VARCHAR(225) NOT NULL,
ISBN VARCHAR(50) UNIQUE,
price DECIMAL(10, 2),
genre_id INTEGER UNIQUE,
units INTEGER DEFAULT 0,
Description TEXT
FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE book_author(
book_id INTEGER REFERENCES book(id),
author_id INTEGER REFERENCES author(id),
PRIMARY KEY (book_id, author_id)
);

CREATE TABLE customer(
id serial primary key,
user_id INTEGER UNIQUE,
subscription_model VARCHAR(20) DEFAULT 'Free', -- 'Free', 'Plus', 'Premium'
subscription_end_time TIMESTAMP,
wallet_money_amount DECIMAL(10, 2) DEFAULT 0,
FOREIGN KEY (user_id) REFERENCES users(id)
)

CREATE TABLE city(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE
);

CREATE TABLE genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE
);

CREATE TABLE reservation(
id SERIAL PRIMARY KEY,
customer_id INTEGER,
book_id INTEGER,
start_of_reservation TIMESTAMP,
end_of_reservation TIMESTAMP,
price DECIMAL(10, 2),
FOREIGN KEY (customer_id) REFERENCES customer(id),
FOREIGN KEY (book_id) REFERENCES book(id)
)




