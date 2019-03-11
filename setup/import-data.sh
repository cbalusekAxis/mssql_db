#wait for sql server to come up
sleep 60s

#run the setup scriptto create the DB 
#/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P4ssw0rd -d master -Q 'RESTORE FILELISTONLY FROM DISK = "/var/opt/mssql/backup/AdventureWorks2017.bak"' | tr -s ' ' | cut -d ' ' -f 1-2
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P4ssw0rd -d master -Q "RESTORE DATABASE AdventureWorks2017 FROM DISK = '/var/opt/mssql/backup/AdventureWorks2017.bak'	WITH MOVE 'AdventureWorks2017' TO '/var/opt/mssql/data/AdventureWorks2017.mdf',	MOVE 'AdventureWorks2017_log' TO '/var/opt/mssql/data/AdventureWorks2017.ldf'"
