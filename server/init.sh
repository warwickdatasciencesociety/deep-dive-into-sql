#!/bin/bash
# More info: https://relational.fit.cvut.cz/about
# List databases to import (case-senstive)
echo "CREATE USER 'guest'@'%' IDENTIFIED BY 'relational'" > /docker-entrypoint-initdb.d/1.sql
db_names=(
    genes
    Carcinogenesis
    Toxicology
)
# Import each database sequentially
for db_name in "${db_names[@]}"; do
    # Create query to extract all table names
    q="SET group_concat_max_len = 10240;"
    q="$q SELECT GROUP_CONCAT(table_name separator ' ')"
    q="$q FROM information_schema.tables"
    q="$q WHERE table_schema='${db_name}'"
    # Exclude specific tables (optional)
    # q="$q AND table_name NOT IN ('tbl_name')"
    # Make query
    tb_list=`mysql --defaults-extra-file=config.cnf -AN -e"$q"`
    # Create database initialisation script
    params="--column-statistics=0 $db_name $tb_list"
    echo "CREATE DATABASE IF NOT EXISTS ${db_name,,}; USE ${db_name,,}; GRANT SELECT ON ${db_name,,}.* TO 'guest'@'%';" > \
        /docker-entrypoint-initdb.d/${db_name,,}.sql
    mysqldump --defaults-extra-file=config.cnf $params >> \
        /docker-entrypoint-initdb.d/${db_name,,}.sql
done

