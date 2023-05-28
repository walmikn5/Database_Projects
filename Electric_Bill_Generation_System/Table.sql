CREATE TABLE `bill_due` (
  `consumer_no` varchar(30) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Consumed_units` varchar(30) NOT NULL
);

CREATE TABLE `bill_payed` (
  `consumer_no` varchar(30) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Amount` varchar(30) NOT NULL,
  `units` varchar(30) NOT NULL
);

CREATE TABLE `date_units` (
  `consumer_no` varchar(30) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Consumed_units` varchar(30) NOT NULL
);

CREATE TABLE `govt_db` (
  `consumer_no` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `service_status` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL
);

CREATE TABLE `lt_tarrif` (
  `tarrif` varchar(100) DEFAULT NULL,
  `fix_charge` decimal(10,1) DEFAULT NULL,
  `prunit` decimal(10,1) DEFAULT NULL,
  `e_tax` decimal(10,1) DEFAULT NULL,
  `subsidary` decimal(10,1) DEFAULT NULL
);

CREATE TABLE `reg_db` (
  `user_name` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `consumer_no` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Address` varchar(40) NOT NULL
);
