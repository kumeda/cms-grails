SET foreign_key_checks = 0;

DELETE FROM `unit`;  # delete all data from table before insert

INSERT INTO `unit` VALUES(1,'-');
INSERT INTO `unit` VALUES(2,'lbs');
INSERT INTO `unit` VALUES(3,'oz.');
INSERT INTO `unit` VALUES(4,'fl. oz.');
INSERT INTO `unit` VALUES(5,'gal');
INSERT INTO `unit` VALUES(6,'cup(s)');
INSERT INTO `unit` VALUES(7,'tsp');
INSERT INTO `unit` VALUES(8,'tbsp');
INSERT INTO `unit` VALUES(9,'pinch');
INSERT INTO `unit` VALUES(10,'dash');
INSERT INTO `unit` VALUES(11,'pcs.');
INSERT INTO `unit` VALUES(12,'l');
INSERT INTO `unit` VALUES(13,'kg');
INSERT INTO `unit` VALUES(14,'dkg');
INSERT INTO `unit` VALUES(15,'g');
INSERT INTO `unit` VALUES(16,'ml');
INSERT INTO `unit` VALUES(17,'dcl');

SET foreign_key_checks = 1;