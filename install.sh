# Add "add-apt-repository" command
apt -y install software-properties-common curl &&

# Add additional repositories for PHP, Redis, and MariaDB
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php &&
add-apt-repository -y ppa:chris-lea/redis-server &&
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash &&

# Update repositories list
apt update &&

# Add universe repository if you are on Ubuntu 18.04
apt-add-repository universe &&

# Install Dependencies
apt -y install php7.2 php7.2-cli php7.2-gd php7.2-mysql php7.2-pdo php7.2-mbstring php7.2-tokenizer php7.2-bcmath php7.2-xml php7.2-fpm php7.2-curl php7.2-zip mariadb-server nginx tar unzip git redis-server &&

# Install Composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer &&

# Make panel dir
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl

# Download Pterodactyl and set perms

curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/download/v0.7.16/panel.tar.gz &&
tar --strip-components=1 -xzvf panel.tar.gz &&
chmod -R 755 storage/* bootstrap/cache/ &&

# MySQL

mysql -u root -p &&
USE mysql; &&
echo "\run - CREATE USER '\pterodactyl'@'127.0.0.1' IDENTIFIED BY '\enterpasswordhere';" &&
echo "\run - CREATE DATABASE panel;" &&



