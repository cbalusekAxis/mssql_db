#!/bin/sh
# Wait for the SQL Server to come online
sleep 20s
# run the setup script to create the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P P@ssw0rd-1234 -i AdventureWorks2017.sql
