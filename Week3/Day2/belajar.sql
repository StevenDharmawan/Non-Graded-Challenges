CREATE DATABASE test3;

DROP DATABASE test2;

CREATE TABLE IF NOT EXISTS customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    alamat VARCHAR(500) NOT NULL,
    no_telp INT NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
)

ALTER TABLE customers ADD COLUMN birth_date DATE NOT NULL;

DROP TABLE customer;

INSERT INTO customers(nama, alamat, no_telp, email, birth_date)
VALUES 
	('Budi', 'Jalan ABC No.1', 081111111, 'Budi@gmail.com', '2024-02-07'),
    ('Ani', 'Jalan DEF No.2', 08222222, 'Ani@gmail.com', '2023-03-11'),
    ('Dodi', 'Jalan GHI No.3', 08333333, 'Dodi@gmail.com', '202-04-10'),
    ('Dani', 'Jalan JKL No.4', 084444444, 'Dani@gmail.com', '2021-05-09'),
    ('Victor', 'Jalan MNO No.5', 08555555, 'Victor@gmail.com', '2020-06-08');

UPDATE customers SET email ='ani.cs@gmail.com' WHERE nama = 'ani';

CREATE TABLE IF NOT EXISTS profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT UNIQUE NOT NULL,
    favourite_color VARCHAR(50),
    FOREIGN KEY (id_customer) REFERENCES customers(id_customer)
);

INSERT INTO profiles(id_customer, favourite_color)VALUES('1', 'Black');

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customers(id_customer)
);