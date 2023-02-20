
##Project 2 - Customer relation 
create table customer (
    id int NOT NULL AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL,
    address VARCHAR (255) NULL,
    PRIMARY KEY (id)
    
);
########################
SELECT * FROM customer 
########################

create table products (
    id int NOT NULL AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL,
    price int NOT NULL,
    PRIMARY KEY (id)
);
########################
SELECT * FROM products  
########################

create table orders (
    id int NOT NULL AUTO_INCREMENT,
    cust_id int NOT NULL,
    order_no int NOT NULL,
    order_date datetime NOT NULL,
    PRIMARY KEY (id)
    
);
########################################################################
ALTER TABLE orders ADD FOREIGN KEY (cust_id) REFERENCES customer(id) 

SELECT * FROM orders 
########################################################################

create table order_item(
    id int NOT NULL AUTO_INCREMENT,
    o_id int NOT NULL,
    p_id int NOT NULL,
    p_price int NOT NULL,
    no_item int NOT NULL,
    PRIMARY KEY (id)
    
);

########################################################################
ALTER TABLE order_item ADD FOREIGN KEY (o_id) REFERENCES orders(id);

ALTER TABLE order_item ADD FOREIGN KEY (p_id) REFERENCES products(id);

ALTER TABLE order_item RENAME COLUMN price TO p_price

#ALTER TABLE order_item ADD FOREIGN KEY (p_price) REFERENCES products(price);



SELECT * FROM order_item
########################################################################

#INSERTS
INSERT INTO customer (name, address) VALUES ("Joe Bloggs","1 Bloggs Street, London")
INSERT INTO customer (name, address) VALUES ("Peter Lynch","1 Lynch Road, London")
INSERT INTO customer (name, address) VALUES ("Warren Buffet","1 Buffet Road, Manchester")


INSERT INTO products (name, price) VALUES ("Samsung S14","799") 
INSERT INTO products (name, price) VALUES ("Protein Shake","24.99") 
INSERT INTO products (name, price) VALUES ("PC Monitor","300") 
INSERT INTO products (name, price) VALUES ("Laptop","500") 

INSERT INTO orders (cust_id, order_no, order_date) VALUES ("1","1","2023-02-01")
INSERT INTO orders (cust_id, order_no, order_date) VALUES ("1","2","2023-02-01")
INSERT INTO orders (cust_id, order_no, order_date) VALUES ("2","3","2023-02-02")
INSERT INTO orders (cust_id, order_no, order_date) VALUES ("2","4","2023-02-03")
INSERT INTO orders (cust_id, order_no, order_date) VALUES ("3","5","2023-02-03")
INSERT INTO orders (cust_id, order_no, order_date) VALUES ("3","6","2023-02-03")
INSERT INTO orders (cust_id, order_no, order_date) VALUES ("3","7","2023-02-03")

INSERT INTO order_item (o_id, p_id, p_price, no_item) VALUES ("1","1","799","1")
INSERT INTO order_item (o_id, p_id, p_price, no_item) VALUES ("2","2","24.99","3")
INSERT INTO order_item (o_id, p_id, p_price, no_item) VALUES ("3","3","300","1")
INSERT INTO order_item (o_id, p_id, p_price, no_item) VALUES ("4","4","500","1")
INSERT INTO order_item (o_id, p_id, p_price, no_item) VALUES ("5","1","799","1")
INSERT INTO order_item (o_id, p_id, p_price, no_item) VALUES ("6","1","799","1")
INSERT INTO order_item (o_id, p_id, p_price, no_item) VALUES ("7","2","24.99","3")



select * from customer

select * from orders
where id = 1

select * from products

select * from order_item


#Create joins to retrieve data
select * from customer
right join products
on customer.id = products.id as hello 



