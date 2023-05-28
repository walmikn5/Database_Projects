CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(30) NOT NULL
);

CREATE TABLE `customer_information` (
  `CustomerID` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL
);

CREATE TABLE `depleted_product` (
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
);

CREATE TABLE `payment` (
  `TransactionID` int(11) NOT NULL,
  `Amount_Paid` int(11) NOT NULL,
  `Mode` varchar(30) NOT NULL,
  `Transaction_Date` int(11) NOT NULL
);

CREATE TABLE `price_list` (
  `ProductID` int(11) NOT NULL,
  `USP` int(11) NOT NULL
);

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `Pname` varchar(30) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `Quantity_in_stock` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `ReorderLevel` int(11) NOT NULL
);

CREATE TABLE `supplier_information` (
  `SupplierID` int(11) NOT NULL,
  `SName` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL
);

CREATE TABLE `transaction_detail` (
  `TransactionID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discount` int(11) NOT NULL DEFAULT '0',
  `Total_Amount` int(11) NOT NULL,
  `Trans_Init_Date` date NOT NULL
);

CREATE TABLE `transaction_information` (
  `TransactionID` int(11) NOT NULL,
  `CustomerID` varchar(30) NOT NULL,
  `Trans_Init_Date` date NOT NULL
);
