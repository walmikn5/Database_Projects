INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Washing Powder'),
(2, 'Cosmetics'),
(3, 'Stationary'),
(4, 'Garments');

INSERT INTO `customer_information` (`CustomerID`, `Name`, `Address`, `Phone`, `Password`) VALUES
('C11', 'Avijit Verma', 'XYZ', '7901012908', 'abc123'),
('C12', 'Swargam Avinash', 'ABC', '7901012908', 'qwerty'),
('C13', 'Pranavendra', 'XWR', '7077102278', 'asdfgh');

INSERT INTO `payment` (`TransactionID`, `Amount_Paid`, `Mode`, `Transaction_Date`) VALUES
(22, 4400, 'debit card', 2016),
(25, 4100, 'cash', 2016),
(27, 4500, 'cash', 2016),
(28, 1500, 'debit card', 2016);

INSERT INTO `price_list` (`ProductID`, `USP`) VALUES
(1, 70),
(2, 100),
(3, 55),
(4, 150),
(5, 300);

INSERT INTO `product` (`ProductID`, `Pname`, `CategoryID`, `SupplierID`, `Quantity_in_stock`, `UnitPrice`, `ReorderLevel`) VALUES
(1, 'Nirma', 1, 1, 20, 60, 10),
(2, 'Surf', 1, 1, 55, 70, 10),
(3, 'Pond Powder', 2, 2, 35, 40, 10),
(4, 'Garnier Cream', 2, 2, 55, 110, 8),
(5, 'Parker Pen', 3, 2, 100, 250, 10);

INSERT INTO `supplier_information` (`SupplierID`, `SName`, `Address`, `Phone`) VALUES
(1, 'Swargam', 'XYZ', '123456789'),
(2, 'Sena', 'QWE', '987654329 ');

INSERT INTO `transaction_detail` (`TransactionID`, `ProductID`, `Quantity`, `Discount`, `Total_Amount`, `Trans_Init_Date`) VALUES
(22, 1, 20, 0, 1400, '2016-11-17'),
(22, 2, 30, 0, 3000, '2016-11-17'),
(25, 3, 20, 0, 1100, '2016-11-17'),
(25, 4, 20, 0, 3000, '2016-11-17'),
(27, 1, 20, 0, 1400, '2016-11-15'),
(27, 2, 20, 0, 2000, '2016-11-15'),
(27, 3, 20, 0, 1100, '2016-11-15'),
(28, 4, 10, 0, 1500, '2016-11-16');

INSERT INTO `transaction_information` (`TransactionID`, `CustomerID`, `Trans_Init_Date`) VALUES
(22, 'C12', '2016-11-17'),
(25, 'C11', '2016-11-17'),
(27, 'C13', '2016-11-15'),
(28, 'C13', '2016-11-16');
