DROP DATABASE IF EXISTS lab_mysql;

CREATE DATABASE lab_mysql;
USE lab_mysql;

CREATE TABLE invoices (
  invoice_id INT PRIMARY KEY,
  date_invoice DATE NOT NULL,
  cars VARCHAR(25),
  customer VARCHAR(10),
  staff VARCHAR(10) 
);

CREATE TABLE Cars (
  car_id INT PRIMARY KEY,
  VIN VARCHAR(25),
  manufacturer VARCHAR(40) NOT NULL,
  model VARCHAR(25) NOT NULL,
  year_ DATE NOT NULL,
  color  VARCHAR(10),
  invoice_cars INT,
  FOREIGN KEY(invoice_cars) REFERENCES invoices(invoice_id) ON DELETE CASCADE
  );
  

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(40) NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	email VARCHAR(40) NOT NULL,
    address VARCHAR(25) NOT NULL,
    city VARCHAR(15) NOT NULL,
    province VARCHAR(15) NOT NULL,
    country VARCHAR(15) NOT NULL,
    postal_code VARCHAR(6) NOT NULL,
    invoice_customers INT,
    FOREIGN KEY(invoice_customers) REFERENCES invoices(invoice_id) ON DELETE CASCADE
);

CREATE TABLE salesperson (
  staff_id INT PRIMARY KEY,
  name_ VARCHAR(20) NOT NULL,
  store VARCHAR(20) NOT NULL,
  invoice_id INT,
  FOREIGN KEY(staff_id) REFERENCES invoices(invoice_id) ON DELETE CASCADE
);





