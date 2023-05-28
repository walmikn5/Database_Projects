CREATE TRIGGER `depleted_check_update` BEFORE UPDATE ON `product` FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust varchar(30);
declare flag integer default 0;
Declare c1 cursor for select ProductID from depleted_product;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;
if NEW.Quantity_in_stock < NEW.ReorderLevel THEN
insert into depleted_product(ProductID,Quantity) values(NEW.ProductID,NEW.Quantity_in_stock);
else
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
if cust=NEW.ProductID then 
set finished=1;
set flag=1;
end if;
end loop get_cust;
close c1;
if flag=1 then
Delete from depleted_product where ProductID=NEW.ProductID;
END if;
end if;
END;


CREATE TRIGGER `supplier_check` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust varchar(30);
declare flag integer default 0;
Declare c1 cursor for select supplierID from supplier_information;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;
if NEW.Quantity_in_stock < NEW.ReorderLevel THEN
insert into depleted_product(ProductID,Quantity) values(NEW.ProductID, NEW.Quantity_in_stock);
end if;
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
if cust=NEW.SupplierID then 
set flag=1;
end if;
end loop get_cust;
close c1;
if flag=0 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Supplier does not exist';
END if;
END;


CREATE TRIGGER `max_min_quantity` BEFORE INSERT ON `transaction_detail` FOR EACH ROW BEGIN
declare var1 int;
declare var2 int;
select ReorderLevel into var1 from Product where ProductID = NEW.ProductID;
select Quantity_in_stock into var2 from Product where ProductID = NEW.ProductID;
if new.Quantity<var1 THEN
   signal sqlstate '45000' set message_text = 'Less than min quantity';
end if;
if new.Quantity>var2 THEN
   signal sqlstate '45000' set message_text = 'More than max quantity';
end if;
update product set Quantity_in_stock = Quantity_in_stock - NEW.Quantity where ProductID = NEW.ProductID;
END;


CREATE TRIGGER `max_min_quantity_update` BEFORE UPDATE ON `transaction_detail` FOR EACH ROW BEGIN
declare var1 int;
declare var2 int;

select ReorderLevel into var1 from Product where ProductID = NEW.ProductID;
select Quantity_in_stock into var2 from Product where ProductID = NEW.ProductID;
if new.Quantity<var1 THEN
   signal sqlstate '45000' set message_text = 'Less than min quantity';
end if;
if new.Quantity>var2 THEN
   signal sqlstate '45000' set message_text = 'More than max quantity';
end if;
update product set Quantity_in_stock = Quantity_in_stock - NEW.Quantity where ProductID=NEW.ProductID;
END;


CREATE TRIGGER `customer_check` BEFORE INSERT ON `transaction_information` FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust varchar(30);
declare flag integer default 0;
Declare c1 cursor for select customerID from customer_information;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
if cust=NEW.CustomerID then 
set flag=1;
end if;
end loop get_cust;
close c1;
if flag=0 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer does not exist';
END if;
END;


CREATE TRIGGER `customer_check_update` BEFORE UPDATE ON `transaction_information` FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust varchar(30);
declare flag integer default 0;
Declare c1 cursor for select customerID from customer_information;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
if cust=NEW.CustomerID then 
set flag=1;
end if;
end loop get_cust;
close c1;
if flag=0 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer does not exist';
END if;
END;


CREATE TRIGGER `decrease_quantity` BEFORE DELETE ON `transaction_information` FOR EACH ROW BEGIN
Declare finished integer default 0;
Declare cust integer;
Declare quant integer default 0;
Declare c1 cursor for select ProductID from transaction_detail where TransactionID=OLD.TransactionID;
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;
CREATE TEMPORARY TABLE IF NOT EXISTS my_temp_table
SELECT ProductID, Quantity from transaction_detail where TransactionID=OLD.TransactionID;
open c1;
get_cust: LOOP
Fetch c1 into cust;
if finished=1 then 
leave get_cust; 
end if;
Select Quantity into quant from my_temp_table where ProductID=cust; 
Update Product set quantity_in_stock=quantity_in_stock+quant where ProductID=cust;
end loop;
close c1;
Delete from transaction_detail where transactionID=OLD.TransactionID;
END;
