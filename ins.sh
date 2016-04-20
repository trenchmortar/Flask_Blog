#! /bin/bash

read -p "Input site name：" site_name
#echo 'Site name is :'  $site_name
read -p "Input site domain：" site_domain
#echo 'Site domain is :'  $site_domain
read -p "Input site email：" site_email
#echo 'Site email is :'  $site_email
read -p "Input user name：" user_name
#echo 'User name is :'  $user_name
read -p "Input user password：" user_password
#echo 'User password is :'  $user_password
read -p "Input user email：" user_email
#echo 'User email is :'  $user_email


echo '''
CREATE TABLE articles (
	id INTEGER NOT NULL, 
	title VARCHAR(255), 
	body TEXT, 
	timestamp DATETIME, 
	tags TEXT, 
	packet_id INTEGER, 
	show INTEGER, 
	PRIMARY KEY (id)
);
CREATE INDEX ix_articles_title ON articles (title);
CREATE INDEX ix_articles_packet_id ON articles (packet_id);
CREATE INDEX ix_articles_timestamp ON articles (timestamp);
CREATE TABLE packets (
	id INTEGER NOT NULL, 
	packet_name VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ix_packets_packet_name ON packets (packet_name);
CREATE TABLE users (
	id INTEGER NOT NULL, 
	username VARCHAR(64), 
	password_hash VARCHAR(128), 
	email VARCHAR(128), 
	PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ix_users_username ON users (username);
CREATE UNIQUE INDEX ix_users_email ON users (email);
CREATE TABLE "sites" (
	id INTEGER NOT NULL, 
	site_name VARCHAR(255), 
	site_domain VARCHAR(255), 
	site_email VARCHAR(255), 
	site_time DATETIME, 
	PRIMARY KEY (id), 
	UNIQUE (site_name), 
	UNIQUE (site_domain), 
	UNIQUE (site_email)
);
CREATE INDEX "ix_Sites_site_time" ON "Sites" (site_time);
'''
echo "INSERT INTO sites (site_name, site_domain, site_email) VALUES ('$site_name','$site_domain','$site_email');"
echo "INSERT INTO packets (id, packet_name) VALUES (0, '未分组');"

