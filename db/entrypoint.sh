#!/bin/sh

mkdir -p /var/lib/mysql
mkdir -p /var/run/mysqld

chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /var/run/mysqld

mysqld $@
