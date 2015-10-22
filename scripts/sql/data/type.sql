SET foreign_key_checks = 0;

DELETE FROM `type`; # delete all data from table before insert

INSERT INTO `type` VALUES(1,'Appetizer');
INSERT INTO `type` VALUES(2,'Breakfast');
INSERT INTO `type` VALUES(3,'Main Course');
INSERT INTO `type` VALUES(4,'Dessert');

SET foreign_key_checks = 1;