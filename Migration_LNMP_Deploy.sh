########################################################################################################
# EquestriaCN LNMP Server Deployment Shell by BronyDee 			2016-06-20			ver. 1.0 revised   #
########################################################################################################

define LAST_UPDATE=20160620

########################################################################################################
# VERSION SETTINGS The following arguments defines the version of each component. Make sure the latest #
# component is used before executing this script.													   #
########################################################################################################

define nginx_version=1.11.1
define pcre_version=8.39
define openssl_version=1.0.2h
define mariaDB_version=10.1.14
define php_version=5.6.22
define libjpeg_version=v9b
define libpng_version=1.6.23
define libXpm_version=3.5.11
define libmcrypt_version=2.5.8

########################################################################################################
# DOWNLOAD SETTINGS The following arguments defines where the downloaded sources will be stored.	   #
# For better speed, I personally recommend using /tmp as it stores files on the RAM. 				   #
# However, if you have a low-end device with low RAM supplies, use ~ directory instead. 			   #
# DEFAULT = /tmp 																					   #
########################################################################################################

define download_dir=/tmp

########################################################################################################
# HARDWARE OVERHEATING PREVENTION SETTINGS Due to the fact that compiling softwares will take a lot of #
# resources, to prevent the hardware from going overheated or get banned by VPS provider, please       #
# consider reducing the compiling threads (how many threads are used to compilie packages), and        #
# increase the interval between compiling two packages. 											   #
# DEFAULT_COMPILING_THREAD = 5				DEFAULT_INTERVAL_BETWEEN_COMPILING = 120 (seconds)		   #
########################################################################################################

define compiling_thread=5
define interval_between_compiling=120

########################################################################################################
# ADVANCED SETTINGS Settings like where the nginx, MySQL, and PHP stores files.						   #
########################################################################################################

# TODO This section is under constr

########################################################################################################
# Init screen for deployment. Clear the screen for the command to show up.							   #
########################################################################################################

echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo. && echo.
echo Welcome to LNMP environment setup for EquestriaCN.
echo Last updated on $LAST_UPDATE.
echo.
echo Bash file tested working on Debian 8 only.
echo.
echo. && echo.
echo ======================================================================
echo TO 														PRESS
echo Continue 													Any Key
echo Stop installing LNMP 	 									Ctrl + C
echo ======================================================================
read -n1
reset

reset
echo Please read the following very important information.
echo. && echo.
echo The following component will be installed:
echo * nginx $nginx_version
echo * OpneSSL Library $openssl_version
echo * MariaDB $mariaDB_version
echo * PHP Interpreter $php_version
echo * libjpeg $libjpeg_version
echo * libpng $libpng_version
echo * libXpm $libXpm_version
echo * libmcrypt $libmcrypt_version
echo * ... and other dependencies required to build these packages.
echo.
echo The following settings will apply during the installation of LNMP:
echo * Downloaded files will be stored under $download_dir/LNMP_Install_Temp
echo * $compiling_thread threads will be used to compile each package.
echo * Between compiling MariaDB, nginx and PHP, $interval_between_compiling seconds of interval will be applied.
echo * The nginx program will be placed under /web/nginx/nginx.
echo * The nginx PID file will be stored at /web/nginx/nginx.pid.
echo * The nginx configuation file will be stored at /web/nginx/nginx.conf.
echo * The nginx will run under the user named www, which is under the group www.
echo * MariaDB database files will be located under /web/mysqld/database.
echo * MariaDB program files will be stored under /web/mysqld.
echo * MariaDB configuation files will be placed at /etc/mysqld/configuation.
echo * MariaDB will run under the user named mysql, which is under the group mysql.
echo. && echo.
echo ======================================================================
echo TO 														PRESS
echo Continue 													Any Key
echo Exit and modify settings 									Ctrl + C
echo ======================================================================
echo. && echo.
read -n1
reset

########################################################################################################
# Dependency installation begins. The script first checks any updates to the source list, and then 	   #
# continue to install the development toolkits and necesscities. 									   #
########################################################################################################

echo Installing dependencies.
sudo apt-get update && sudo install cmake make libssl-dev libXpm-dev libicu-dev gcc

########################################################################################################
# Start downloading sources using the version settings provided.									   #
########################################################################################################
echo Making directories under $download_dir.
mkdir -p $download_dir/LNMP_Install_Temp
cd $download_dir/LNMP_Install_Temp

echo Downloading and unpacking necessary files.
echo Depending on the network status of your server, this might take up to 5 minutes. Please be patient.
wget https://nginx.org/download/nginx-$nginx_version.tar.gz
tar -xvf nginx-$nginx_version.tar.gz
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.gz
wget https://www.openssl.org/source/openssl-$openssl_version.tar.gz
wget https://mirrors.tuna.tsinghua.edu.cn/mariadb/mariadb-10.1.14/source/mariadb-10.1.14.tar.gz
wget http://cn2.php.net/distributions/php-5.6.22.tar.gz
wget http://www.ijg.org/files/jpegsrc.v9b.tar.gz
wget ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng16/libpng-1.6.23.tar.gz
wget http://download.savannah.gnu.org/releases/freetype/freetype-2.6.3.tar.gz
wget http://xorg.freedesktop.org/archive/individual/lib/libXpm-3.5.11.tar.gz
wget http://freefr.dl.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz
tar -xf *.tar.gz

echo Now installing libmcrypt. Please wait.
cd 

echo Now installing OpenSSL, PCRE and Nginx.
sudo groupadd www
sudo useradd -g www www -s /bin/false 
sudo mkdir -p /web/nginx
sudo chown -R www:www /web/nginx
cd nginx-1.11.1
./configure --sbin-path=/web/nginx/nginx --conf-path=/web/nginx/nginx.conf --pid-path=/web/nginx/nginx.pid --with-http_ssl_module --with-select_module --with-poll_module --with-threads --with-http_v2_module --with-http_realip_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gzip_static_module --with-http_secure_link_module --with-http_auth_request_module --with-pcre=../pcre-8.39 --with-zlib=../zlib-1.2.8 --user=www --group=www --http-log-path=/var/log/nginx/nginx.access.log --error-log-path=/var/log/nginx/nginx.error.log --with-openssl=../openssl-1.0.2h && make && sudo make install

reset
echo Now installing MariaDB.
cd ../mariadb-10.1.14
sudo groupadd mysql
sudo useradd -g mysql mysql -s /bin/false
sudo mkdir -p /web/mysqld/database
sudo chown -R mysql:mysql /web/database
cmake . -DCMAKE_INSTALL_PREFIX=/web/mysqld -DMYSQL_DATADIR=/web/mysqld/database -DSYSCONFDIR=/etc/mysqld/configuation
make && sudo make install

reset
echo Now installing PHP.
cd ../php-5.6.22
./configure --enable-fpm --with-openssl --with-libxml-dir=/usr/include/libxml2 --enable-calendar --enable-exif --enable-ftp --enable-libgcc --with-jpeg-dir=../jpeg-9b --with-png-dir=../libpng-1.6.23 --with-zlib-dir=../zlib-1.2.8 --with-freetype-dir=../freetype-2.6.3 --with-xpm-dir=../libXpm-3.5.11  --enable-embedded-mysqli --enable-opcache --enable-pcntl --enable-shmop -with-iconv --enable-zip --enable-zend-signals --with-mcrypt --with-gd --with-pcre-regex --enable-sockets --enable-sysvmsg --enable-sysvsem  --enable-sysvshm --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd

--enable-intl

/usr/lib/systemd/system/nginx.service
[Unit]
Description=nginx - high performance web server 
Documentation=http://nginx.org/en/docs/
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
