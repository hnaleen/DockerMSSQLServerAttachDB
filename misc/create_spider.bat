REM wait for the SQL server to start
ping -n 10 127.0.0.1 >nul

REM TODO - replace with simple sqlcmd
"C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\130\Tools\Binn\SQLCMD.EXE" -S localhost,1433 -U sa -P Nova@7610 -d master -i c:\\nova\\spider.sql