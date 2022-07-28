podman pod create --name yc -p 8081:80
podman run -d --restart=always --name=yc-web --pod=yc -v /home/eingram/code/Containers/test.ycdisp.com/www/html:/var/www/html:z docker.io/kungfujoe23/yc-web:latest
podman run -d --restart=always --pod=yc --name=yc-db -v yc-db-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=**** mariadb:latest

# docker exec -i some-mysql sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql
# # setsebool -P httpd_can_network_relay 1
#         Description:
#         Allow HTTPD scripts and modules to connect to the network using TCP.
 
#         Allow access by executing:
#         # setsebool -P httpd_can_network_connect 1

loginctl enable-linger