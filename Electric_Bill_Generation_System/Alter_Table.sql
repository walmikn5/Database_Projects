ALTER TABLE `govt_db`
  ADD PRIMARY KEY (`consumer_no`);

ALTER TABLE `reg_db`
  ADD PRIMARY KEY (`email_id`,`consumer_no`) USING BTREE;
COMMIT;
