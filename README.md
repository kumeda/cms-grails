# cms-grails

Development Setup:
--------------
1. Download and install latest Java 8 JDK http://www.oracle.com/technetwork/java/javase/downloads/index.html
  * Configure JAVA_HOME
  * Test by java -version
2. Download and install Grails 2.5.1 https://grails.org/download.html
  * https://grails.org/documentation.html
  * Configure GRAILS_HOME
  * Test by grails -version
3. Download and install latest MySQL 5.6 (5.6.26) http://dev.mysql.com/downloads/mysql/
  * used for local development; later we'll connect to AWS, and then to CloudKit
  * Remember your admin (root) login/password
  * Enter the mysql console: mysql -u root -p
  * Create a chefk database: create database chefk
4. Download latest JDBC driver 5.1.36 http://dev.mysql.com/downloads/connector/j/
  * Configure CLASSPATH = mysql-connector-java-5.1.36-bin.jar
5. git clone this repository
6. Update your config (chefk-config.properties) file
  * dataSource.url=jdbc\:mysql\://localhost/chefk
  * dataSource.username=root
  * dataSource.password=[your root password]
7. run grails
  * grails clean
  * grails compile
  * grails run-app -https
