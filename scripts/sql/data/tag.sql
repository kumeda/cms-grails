SET foreign_key_checks = 0;

DELETE FROM `tag`;  # delete all data from `tag` before insert

INSERT INTO `tag` VALUES(1,'Vegetarian');
INSERT INTO `tag` VALUES(2,'Dairy Free');
INSERT INTO `tag` VALUES(3,'Gluten Free');
INSERT INTO `tag` VALUES(4,'Appetizers');
INSERT INTO `tag` VALUES(5,'Breakfast');
INSERT INTO `tag` VALUES(6,'Main Course');
INSERT INTO `tag` VALUES(7,'Dessert');

SET foreign_key_checks = 1;