docker build -t nova/novadb-r82 .

// 3G memory is a must
docker run -d -p 15788:1433 --memory 3g --name novadbs82 nova/novadb-r82