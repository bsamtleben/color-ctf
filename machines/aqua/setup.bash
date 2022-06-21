#!/usr/bin/env bash

# This script performs the following steps:
#   1. Download and build Apache HTTP Server from source
#   2. Download and build vulnerable PHP 8.1.0-dev from source
#   3. Set up a static PHP website and start Apache


# Apache HTTP server source code can be downloaded from here: https://httpd.apache.org/download.cgi
HTTPD_VERSION=2.4.54

# Install requirements for building Apache
apt-get install -y  git curl libapr1-dev libaprutil1-dev build-essential libpcre3-dev

# Download and unpack Apache source code
cd /opt
curl https://dlcdn.apache.org/httpd/httpd-$HTTPD_VERSION.tar.gz --output httpd.tar.gz
gzip -d httpd.tar.gz
tar xvf httpd.tar
mv ./httpd-$HTTPD_VERSION httpd
rm httpd.tar

# Build Apache
cd /opt/httpd
./configure --prefix=/usr/local
./configure --enable-so --prefix=/usr/local
make
make install

# Install requirements for building PHP
apt-get install -y pkg-config build-essential autoconf bison re2c libxml2-dev libsqlite3-dev zlib1g zlib1g-dev

# Fetch vulnerable PHP version 8.1.0-dev (https://github.com/php/php-src/commit/c730aa26bd52829a49f2ad284b181b7e82a68d7d)
mkdir /opt/php
cd /opt/php
git init
git remote add origin https://github.com/php/php-src.git
git fetch --depth 1 origin c730aa26bd52829a49f2ad284b181b7e82a68d7d
git checkout FETCH_HEAD

# Build PHP
./buildconf
./configure --with-apxs2=/usr/local/bin/apxs --with-zlib=/opt/php/ext/zlib
make -j4
make install
/opt/php/libtool --finish /opt/php/libs

# Create php.ini
cp /opt/php/php.ini-production /usr/local/lib/php.ini

# Cleanup
rm -rf /opt/php /opt/httpd

# Configure Apache
HTTPD_CONF=/usr/local/conf/httpd-php.conf
cp $FILES_DIR/httpd-php.conf $HTTPD_CONF
cat <<EOF >> /usr/local/conf/httpd.conf
ServerName $HOSTNAME
Include $HTTPD_CONF
EOF

# Deploy website
rm -r /usr/local/htdocs
cp -r $FILES_DIR/htdocs /usr/local/htdocs

# Create Apache service and enable it
cp $FILES_DIR/apache2.service /etc/systemd/system/apache2.service
systemctl daemon-reload
systemctl enable apache2.service
systemctl start apache2.service
