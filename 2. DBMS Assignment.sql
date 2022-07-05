create database employee

use employee

create table employee_tbl 
(
EmpId int primary key,
FirstName varchar(50),
LastName varchar(50),
Salary float,
MobileNo varchar(15),
)

insert into employee_tbl values(11,'Hritik','Pal',36500,'98457828374')

select * from employee_tbl

delete from employee_tbl where EmpId=6

update employee_tbl set FirstName='Shardul' where EmpId=4


CREATE TABLE products (
  product_id int DEFAULT NULL,
  product_cat int DEFAULT NULL,
  product_title varchar(22) DEFAULT NULL,
  product_latitude decimal(8,6) DEFAULT NULL,
  product_longitude decimal(9,6) DEFAULT NULL,
  product_image varchar(19) DEFAULT NULL,
  product_keywords varchar(34) DEFAULT NULL
);

INSERT INTO products (product_id, product_cat, product_title, product_latitude, product_longitude, product_image, product_keywords) VALUES
(1, 4,  'Nike', '40.737259', '-73.612213', 'adidas.png', 'Adidas,adidas'),
(2, 4,  'Rebook',  '40.738461', '-73.611496', 'blomingdales.png', 'Bloomingdales,bloomingdales'),
(3, 2,  'Zudio',  '40.738209', '-73.614296', 'charlotte.webp', 'Charlotte,charlotte,charlotterusse'),
(4, 1,  'Asian Chao',  '40.738045', '-73.612808', 'montblanc.png', 'montblanc,Montblanc'),
(5, 4, 'JCPenney',  '40.739529', '-73.614021', 'jcpenny.webp', 'jcpenney,JcPenney'),
(6, 5,  'Osteria Morini',  '40.738262', '-73.614288', 'osteria.webp', 'Osteria,osteria'),
(7, 3,  'AMC ',  '40.742535', '-73.615730', 'amc.webp', 'amc,Amc,AMC'),
(8, 4,  'Tillys',  '40.738197', '-73.612526', 'tillys.webp', 'tillys,Tillys'),
(9, 4,  'Zara',  '40.737049', '-73.612076', 'zara.webp', 'Zara,zara'),
(10, 1,  'BOSS',  '40.737797', '-73.612450', 'boss.png', 'BOSS,boss'),
(11, 5,  'Montblanc', '40.738628', '-73.613464', 'asianchao.png', 'Asian,asian');



CREATE TABLE categories(
  cat_id int,
  cat_title text NOT NULL
) ;


INSERT INTO categories (cat_id, cat_title) VALUES
(1, 'Mens'),
(2, 'Womens'),
(3, 'Entertainment'),
(4, 'Unisex'),
(5, 'Dining');


SELECT * FROM categories;

SELECT products.product_id,products.product_title, categories.cat_id FROM products INNER JOIN categories ON products.product_cat=categories.cat_id;   

SELECT * FROM categories FULL OUTER JOIN products ON products.product_cat=categories.cat_id;

SELECT * FROM categories LEFT OUTER JOIN products ON products.product_cat=categories.cat_id;

CREATE TABLE productsbackup (
  product_id int PRIMARY KEY,
  product_cat int FOREIGN KEY REFERENCES updatedcategories(cat_id),
  product_title varchar(22) UNIQUE,
  product_latitude decimal(8,6) DEFAULT NULL,
  product_longitude decimal(9,6) DEFAULT NULL,
  product_image varchar(19) DEFAULT NULL,
  product_manufactureyear int CHECK(product_manufactureyear>2000),
  product_keywords varchar(34) DEFAULT NULL
);

SELECT * FROM productsbackups;

CREATE INDEX updatedcategoriesindexx ON updatedcategories(cat_id);

DROP TABLE productsbackup;

ALTER TABLE productsbackups
ADD product_no int IDENTITY(1,1);

CREATE VIEW PRODUCT As 
SELECT * FROM 
products;

SELECT product_cat, COUNT(product_cat) FROM products GROUP BY product_cat
HAVING COUNT(product_cat) > 2;

SELECT * FROM products where product_cat IS NULL;


CREATE PROCEDURE SelectAllProperties
AS
SELECT * FROM periodic_table_properties
GO;

EXEC SelectAllProperties;