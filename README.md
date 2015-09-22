# cms-grails

Development Setup:
--------------
1. Download and install latest Java 8 http://www.oracle.com/technetwork/java/javase/downloads/index.html
  * Configure JAVA_HOME
2. Download and install Grails 2.5.1 https://grails.org/download.html
  * https://grails.org/documentation.html
  * Configure GRAILS_HOME
3. Download and install latest MySQL 5.6 (5.6.26) http://dev.mysql.com/downloads/mysql/
  * used for local development; later we'll connect to AWS, and then to CloudKit
  * Remember your admin (root) login/password
  * Enter the mysql console: mysql -u root -p
  * Create a chefk database: create database chefk
4. git clone this repository
5. Update your config (chefk-config.properties) file
  * dataSource.url=jdbc\:mysql\://localhost/chefk
  * dataSource.username=root
  * dataSource.password=[your root password]
6. run grails
  * grails clean
  * grails compile
  * grails run-app -https
