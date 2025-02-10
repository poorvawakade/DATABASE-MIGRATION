# Define database credentials
MYSQL_USER="root"
MYSQL_PASSWORD="yourpassword"
MYSQL_DB="mydatabase"
PG_USER="postgres"
PG_DB="newdatabase"

# Export schema from MySQL
mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD --no-data $MYSQL_DB > schema.sql

# Export data from MySQL
mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD --no-create-info $MYSQL_DB > data.sql

# Convert MySQL schema to PostgreSQL compatible format (manual step may be required)
# Example: sed -i 's/ENGINE=InnoDB//g' schema.sql

# Create PostgreSQL database
createdb -U $PG_USER $PG_DB

# Import schema into PostgreSQL
psql -U $PG_USER -d $PG_DB -f schema.sql

# Import data into PostgreSQL
psql -U $PG_USER -d $PG_DB -f data.sql

echo "Migration completed successfully. Verify data integrity manually."