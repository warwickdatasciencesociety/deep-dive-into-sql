#!/bin/bash
# More info: https://relational.fit.cvut.cz/about
# List databases to import (case-senstive)
db_names=(
    genes
    Carcinogenesis
)
# Import each database sequentially
for db_name in "${db_names[@]}"; do
    # Create query to extract all table names
    q="SET group_concat_max_len = 10240;"
    q="${q} SELECT GROUP_CONCAT(table_name separator ' ')"
    q="${q} FROM information_schema.tables"
    q="${q} WHERE table_schema='${db_name}'"
    # Exclude specific tables (optional)
    # q="${q} AND table_name NOT IN ('tbl_name')"
    # Make query
    tb_list=`mysql --defaults-extra-file=config.cnf -AN -e"$q"`
    # Dump contents of database in temporary file
    params="--column-statistics=0 $db_name $tb_list"
    mysqldump --defaults-extra-file=config.cnf $params > dump.sql
    # Load contents into database (convert name to lowercase)
    echo "CREATE DATABASE IF NOT EXISTS ${db_name,,};" | \
        mysql -uroot --password=$MYSQL_ROOT_PASSWORD
    mysql -uroot --password=$MYSQL_ROOT_PASSWORD ${db_name,,} < dump.sql
done

