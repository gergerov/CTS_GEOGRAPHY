# Wait to be sure that SQL Server came up
sleep 60s

# Run the setup script to create the DB and the schema in the DB
# Note: make sure that your password matches what is in the Dockerfile

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P HhHh~12345678 -d master -i /usr/src/CTS_GEOGRAPHY/cnt.CTS_GEOGRAPHY.create_database.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P HhHh~12345678 -d master -i /usr/src/CTS_GEOGRAPHY/cnt.CTS_GEOGRAPHY.FAST_API_CTS_GEOGRAPHY.create_user_and_login.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P HhHh~12345678 -d master -i /usr/src/CTS_GEOGRAPHY/cnt.CTS_GEOGRAPHY.metadata.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P HhHh~12345678 -d master -i /usr/src/CTS_GEOGRAPHY/cnt.CTS_GEOGRAPHY.FAST_API_CTS_GEOGRAPHY.grant.sql
