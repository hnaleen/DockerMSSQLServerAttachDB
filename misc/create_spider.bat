REM give some time for the sql server to start
ping -n 10 127.0.0.1 >nul

sqlcmd -S localhost,1433 -U sa -P Nova@7610 -d master -i c:\\nova\\spider.sql