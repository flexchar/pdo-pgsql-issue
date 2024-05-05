# See version for php82-pdo_pgsql here:
# https://pkgs.alpinelinux.org/packages?name=php82-pdo_pgsql&branch=v3.18&repo=community&arch=x86_64&maintainer=
# Version on 2024-05-05: 8.2.16-r0
FROM alpine:3.18 as working-case

# Install PostgreSQL client, PHP, and necessary extensions
RUN apk add --no-cache php82 php82-pdo php82-pdo_pgsql
# This does not cause the error:
RUN apk add --no-cache php82-pecl-swoole

# Set the working directory
WORKDIR /app
COPY testpdo.php /app

# Command to run the PHP script
CMD [ "php82", "/app/testpdo.php" ]


# See version for php82-pdo_pgsql here:
# https://pkgs.alpinelinux.org/packages?name=php82-pdo_pgsql&branch=v3.19&repo=community&arch=x86_64&maintainer=
# Version on 2024-05-05: 8.2.18-r0
FROM alpine:3.19 as broken-case

# Install PostgreSQL client, PHP, and necessary extensions
RUN apk add --no-cache php82 php82-pdo php82-pdo_pgsql
# This causes the error:
RUN apk add --no-cache php82-pecl-swoole

# Set the working directory
WORKDIR /app
COPY testpdo.php /app

# Command to run the PHP script
CMD [ "php82", "/app/testpdo.php" ]
