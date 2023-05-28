ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

ALTER TABLE `customer_information`
  ADD PRIMARY KEY (`CustomerID`);

ALTER TABLE `depleted_product`
  ADD PRIMARY KEY (`ProductID`);

ALTER TABLE `payment`
  ADD PRIMARY KEY (`TransactionID`);
  
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`ProductID`);

ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `product_ibfk_2` (`CategoryID`),
  ADD KEY `product_ibfk_3` (`SupplierID`);

ALTER TABLE `supplier_information`
  ADD PRIMARY KEY (`SupplierID`);

ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`TransactionID`,`ProductID`),
  ADD KEY `td_ibfk_2` (`ProductID`);

ALTER TABLE `transaction_information`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `ti_ibfk_1` (`CustomerID`);

ALTER TABLE `transaction_information`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`SupplierID`) REFERENCES `supplier_information` (`SupplierID`);

ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `td_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

ALTER TABLE `transaction_information`
  ADD CONSTRAINT `ti_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer_information` (`CustomerID`);
