podman pod create --name df -p 8080:80
podman run -d --restart=always --name=df-web --pod=df -v /home/eingram/code/Kubernetes/test.diversionforum.net/www/html:/var/www/html:z nginx:latest 
podman cp /home/eingram/code/Kubernetes/test.diversionforum.net/nginx/default.conf df-web:/etc/nginx/conf.d/default.conf
podman restart df-web
podman run -d --restart=always --pod=df --name=df-php --volumes-from df-web php:7.4-fpm 
podman cp /home/eingram/code/Kubernetes/test.diversionforum.net/php/php.ini df-php:/usr/local/php/php.ini
podman exec df-php docker-php-ext-install mysqli
podman restart df-php
podman run -d --restart=always --pod=df --name=df-db -v df-db-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=NL2B1r13 mariadb:latest

# docker exec -i some-mysql sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql