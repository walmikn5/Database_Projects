CREATE PROCEDURE `discount_calc` (IN `product` INT(10), IN `quant` INT(10), OUT `disc` INT(10))  BEGIN
declare price int; 
declare disc int; 
declare total int;
select USP into price from price_list where ProductID = product;
set total=quant*price; 
if (tot >= 20000 and tot < 40000) THEN
   set disc=tot*0.05;
elseif (tot >= 40000 and tot < 60000) THEN
   set disc=tot*0.075;
elseif (tot >= 100000) THEN
   set disc=tot*0.1;
end if;
end;
