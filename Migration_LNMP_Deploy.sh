########################################################################################################
# EquestriaCN LNMP Server Deployment Shell by BronyDee         2016-06-21        ver. 1.0 revised      #
########################################################################################################

## The last time this script was updated.
export LAST_UPDATE=20160621

########################################################################################################
# DOMAIN SETTINGS Please specify your domain and/or IP address of this server.                         #
########################################################################################################

export domain_name=example.com
export domain_name_alt=www.example.com

########################################################################################################
# VERSION SETTINGS The following arguments defines the version of each component. Make sure the latest #
# component is used before executing this script.                                                      #
########################################################################################################

export nginx_version=1.11.1
export pcre_version=8.39
export openssl_version=1.0.2h
export mariaDB_version=10.1.14
export php_version=5.6.22
export libjpeg_version=9b
export libpng_version=1.6.23
export libXpm_version=3.5.11
export libmcrypt_version=2.5.8
export freetype_version=2.6.3
export zlib_version=1.2.8

########################################################################################################
# DOWNLOAD SETTINGS The following arguments defines where the downloaded sources will be stored.       #
# For better speed, I personally recommend using /tmp as it stores files on the RAM.                   #
# However, if you have a low-end device with low RAM supplies, use ~ directory instead.                #
# DEFAULT_DOWNLOAD_DIR = /tmp                                                                          #
########################################################################################################

## Where the downloaded sources are stored.
export download_dir=/tmp

########################################################################################################
# HARDWARE OVERHEATING PREVENTION SETTINGS Due to the fact that compiling softwares will take a lot of #
# resources, to prevent the hardware from going overheated or get banned by VPS provider, please       #
# consider reducing the compiling threads (how many threads are used to compile packages), and         #
# increase the interval between compiling two packages.                                                #
# DEFAULT_COMPILING_THREAD = 5        DEFAULT_INTERVAL_BETWEEN_COMPILING = 120 (seconds)               #
########################################################################################################

## How many threads are used to compile packages.
export compiling_thread=5

## The amount of time between compiling two large packages.
export interval_between_compiling=120

########################################################################################################
# ADVANCED SETTINGS Settings like where the nginx, MySQL, and PHP stores files.                        #
# DEFAULT_NGINX_CONFIG_PATH = /etc/nginx/nginx.conf                                                    #
# DEFAULT_NGINX_SBIN_PATH = /usr/local/nginx/nginx                                                     #
# DEFAULT_NGINX_PID_PATH = /var/run/nginx.pid                                                          #
# DEFAULT_NGINX_WEB_PAGE_PATH = /var/www/html                                                          #
# DEFAULT_NGINX_HTTP_LOG_PATH = /var/log/nginx/nginx.access.log                                        #
# DEFAULT_NGINX_ERROR_LOG_PATH = /var/log/nginx/nginx.error.log                                        #
# DEFAULT_NGINX_USER = www                                                                             #
# DEFAULT_NGINX_GROUP = www                                                                            #
# DEFAULT_MARIADB_SBIN_PATH = /usr/local/mariadb                                                       #
# DEFAULT_MARIADB_CONFIG_PATH = /etc/mariadb                                                           #
# DEFAULT_MARIADB_DATA_PATH = /usr/local/mariadb/data                                                  #
# DEFAULT_MARIADB_DATABASE_SCALE = small                                                               #
# DEFAULT_MARIADB_USER = mariadb                                                                       #
# DEFAULT_MARIADB_GROUP = mariadb                                                                      #
########################################################################################################

export nginx_config_path=/etc/nginx/nginx.conf
export nginx_sbin_path=/usr/local/nginx/nginx
export nginx_pid_path=/var/run/nginx.pid
export nginx_web_page_path=/var/www/html
export nginx_http_log_path=/var/log/nginx/nginx.access.log
export nginx_error_log_path=/var/log/nginx/nginx.error.log
export nginx_user=nobody
export nginx_group=nobody
export MariaDB_sbin_path=/usr/local/mariadb
export MariaDB_config_path=/etc/mariadb
export MariaDB_data_path=/usr/local/mariadb/data
export MariaDB_database_scale=small
export MariaDB_user=mariadb
export MariaDB_group=mariadb

########################################################################################################
# Init screen for deployment. Clear the screen for the command to show up.							   #
########################################################################################################

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" # Screen cleanup
echo -e "Welcome to LNMP environment setup for EquestriaCN."
echo -e "Last updated on $LAST_UPDATE."
echo -e ""
echo -e "Bash file tested working on Debian 8 only."
echo -e ""
echo -e "====================================="
echo -e "TO                              PRESS"
echo -e "Continue                      Any Key"
echo -e "Stop installing LNMP         Ctrl + C"
echo -e "====================================="
read -s -n1 -p "" # Press any key to continue.
reset # Screen cleanup

echo -e "Please read the following very important information."
echo -e "" && echo -e ""
echo -e "The following components will be installed on your server:"
echo -e "* nginx $nginx_version"
echo -e "* OpneSSL Library $openssl_version"
echo -e "* MariaDB $mariaDB_version"
echo -e "* PHP Interpreter $php_version"
echo -e "* libjpeg $libjpeg_version"
echo -e "* libpng $libpng_version"
echo -e "* libXpm $libXpm_version"
echo -e "* libmcrypt $libmcrypt_version"
echo -e "* freetype $freetype_version"
echo -e "* zlib $zlib_version"
echo -e "* ... and other dependencies required to build these packages."
echo -e ""
echo -e "The following settings will apply during the installation of LNMP:"
echo -e "* Downloaded files will be stored under $download_dir/LNMP_Install_Temp"
echo -e "* $compiling_thread threads will be used to compile each package."
echo -e "* Between compiling MariaDB, nginx and PHP, $interval_between_compiling seconds of interval will be applied."
echo -e "* The nginx program will be placed under $nginx_sbin_path."
echo -e "* The nginx PID file will be stored at $nginx_pid_path."
echo -e "* The nginx configuation file will be stored at $nginx_config_path."
echo -e "* The nginx will run under the user named $nginx_user, which is under the group $nginx_group."
echo -e "* MariaDB database files will be located under $MariaDB_data_path."
echo -e "* MariaDB program files will be stored under $MariaDB_sbin_path."
echo -e "* MariaDB configuation files will be placed at $MariaDB_config_path."
echo -e "* MariaDB will run under the user named $MariaDB_user, which is under the group $MariaDB_group."
echo -e "* SSL certificate will be obtained from Let's Encrypt."
echo -e "\n\n"
echo -e "====================================="
echo -e "TO                              PRESS"
echo -e "Continue                      Any Key"
echo -e "Exit and modify settings     Ctrl + C"
echo -e "====================================="
read -s -n1 -p ""
reset

########################################################################################################
# Dependency installation begins. The script first checks any updates to the source list, and then 	   #
# continue to install the development toolkits and necesscities.                                       #
########################################################################################################

echo -e "Installing dependencies and configuring system as preparation for LNMP."
sudo apt-get update && sudo apt-get install -y -m curl build-essential cmake make autoconf libssl-dev libXpm-dev libicu-dev libncurses5-dev libxml2-dev
sudo apt-get install -y -m libjpeg9-dev
sudo apt-get install -y -m libjpeg-dev
sudo echo "/usr/local/lib" >> /etc/ld.so.conf
sudo ldconfig -v
sudo touch /etc/rc.local
sudo chmod +x /etc/rc.local

########################################################################################################
# SSL certificate obtain                                                                               #
########################################################################################################
cd /usr/local/sbin
sudo curl -O https://dl.eff.org/certbot-auto
sudo chmod a+x ./certbot-auto
sudo certbot-auto certonly --standalone -d $domain_name -d $domain_name_alt

########################################################################################################
# Start downloading sources using the version settings provided.									   #
########################################################################################################
echo -e "Making directories under $download_dir."
mkdir -p $download_dir/LNMP_Install_Temp/tmp
cd $download_dir/LNMP_Install_Temp

echo -e "Downloading and unpacking necessary files."
echo -e "Depending on the network status of your server, this might take up to 5 minutes. Please be patient."

# nginx download and unpack
echo -e "Downloading nginx."
curl -O https://nginx.org/download/nginx-$nginx_version.tar.gz
echo -e "Unpacking nginx to $download_dir/LNMP_Install_Temp"
tar -xf ./nginx-$nginx_version.tar.gz

# pcre download and unpack
echo -e "Downloading PCRE."
curl -O ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-$pcre_version.tar.gz
echo -e "Unpacking PCRE to $download_dir/LNMP_Install_Temp"
tar -xf ./pcre-$pcre_version.tar.gz

# OpenSSL download and unpack
echo -e "Downloading OpenSSL."
curl -O https://www.openssl.org/source/openssl-$openssl_version.tar.gz
echo -e "Unpacking OpenSSL to $download_dir/LNMP_Install_Temp"
tar -xf openssl-$openssl_version.tar.gz

# MariaDB download and unpack
echo -e "Downloading MariaDB."
curl -O https://mirrors.tuna.tsinghua.edu.cn/mariadb/mariadb-$mariaDB_version/source/mariadb-$mariaDB_version.tar.gz
echo -e "Unpacking MariaDB to $download_dir/LNMP_Install_Temp"
tar -xf ./mariadb-$mariaDB_version.tar.gz

# PHP interpreter download and unpack
echo -e "Downloading PHP."
curl -O http://cn2.php.net/distributions/php-$php_version.tar.gz
echo -e "Unpacking PHP to $download_dir/LNMP_Install_Temp"
tar -xf ./php-$php_version.tar.gz

# libjpeg download and unpack
echo -e "Downloading libjpeg."
curl -O http://www.ijg.org/files/jpegsrc.v$libjpeg_version.tar.gz
echo -e "Unpacking libjpeg to $download_dir/LNMP_Install_Temp"
tar -xf ./jpegsrc.v$libjpeg_version.tar.gz

# libpng download and unpack
echo -e "Downloading libpng."
curl -O ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng16/libpng-$libpng_version.tar.gz
echo -e "Unpacking libpng to $download_dir/LNMP_Install_Temp"
tar -xf ./libpng-$libpng_version.tar.gz

# freetype download and unpack
echo -e "Downloading freetype."
curl -O http://ftp.twaren.net/Unix/NonGNU/freetype/freetype-$freetype_version.tar.gz
echo -e "Unpacking freetype to $download_dir/LNMP_Install_Temp"
tar -xf ./freetype-$freetype_version.tar.gz

# libXpm download and unpack
echo -e "Downloading libXpm."
curl -O https://www.x.org/archive/individual/lib/libXpm-$libXpm_version.tar.gz
echo -e "Unpacking libXpm to $download_dir/LNMP_Install_Temp"
tar -xf ./libXpm-$libXpm_version.tar.gz

# libmcrypt download and unpack
echo -e "Downloading libmcrypt."
curl -O http://freefr.dl.sourceforge.net/project/mcrypt/Libmcrypt/$libmcrypt_version/libmcrypt-$libmcrypt_version.tar.gz
echo -e "Unpacking libmcrypt to $download_dir/LNMP_Install_Temp"
tar -xf ./libmcrypt-$libmcrypt_version.tar.gz

# zlib download and unpack
echo -e "Downloading zlib."
curl -O http://zlib.net/zlib-$zlib_version.tar.gz
echo -e "Unpacking zlib to $download_dir/LNMP_Install_Temp"
tar -xf ./zlib-$zlib_version.tar.gz

########################################################################################################
# Start compiling sources using the version settings provided.									       #
########################################################################################################

reset
## libmcrypt installation.
echo -e "Now installing libmcrypt. Please wait."
cd ./libmcrypt-$libmcrypt_version
./configure && make -j$compiling_thread && sudo make install

reset
## libjpeg installation.
echo -e "Now installing libjpeg. Please wait."
cd ../jpeg-$libjpeg_version
./configure && make -j$compiling_thread && sudo make install

reset
## nginx installation.
echo -e "Now installing OpenSSL, PCRE and Nginx."
# Create nginx user and assign privileges
sudo groupadd $nginx_group
sudo useradd -g $nginx_group $nginx_user -s /bin/false 
sudo mkdir -p $nginx_web_page_path
sudo chown -R $nginx_group:$nginx_user $nginx_web_page_path
cd ../nginx-$nginx_version
./configure --sbin-path=$nginx_sbin_path --conf-path=$nginx_config_path --pid-path=$nginx_pid_path --with-http_ssl_module --without-select_module --with-poll_module --with-threads --with-http_v2_module --with-http_realip_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gzip_static_module --with-http_secure_link_module --with-http_auth_request_module --with-pcre=../pcre-$pcre_version --with-zlib=../zlib-$zlib_version --user=$nginx_user --group=$nginx_group --http-log-path=$nginx_http_log_path --error-log-path=$nginx_error_log_path --with-openssl=../openssl-$openssl_version
make -j$compiling_thread && sudo make install
# Init nginx systemd support
sudo mkdir -p /usr/lib/systemd/system
sudo touch /usr/lib/systemd/system/nginx.service
sudo echo "[Unit]" > /usr/lib/systemd/system/nginx.service
sudo echo "Description=nginx - high performance web server " >> /usr/lib/systemd/system/nginx.service
sudo echo "Documentation=http://nginx.org/en/docs/" >> /usr/lib/systemd/system/nginx.service
sudo echo "After=network.target remote-fs.target nss-lookup.target" >> /usr/lib/systemd/system/nginx.service
sudo echo "" >> /usr/lib/systemd/system/nginx.service
sudo echo "[Service]" >> /usr/lib/systemd/system/nginx.service
sudo echo "Type=forking" >> /usr/lib/systemd/system/nginx.service
sudo echo "PIDFile=$nginx_pid_path" >> /usr/lib/systemd/system/nginx.service
sudo echo "ExecStartPre=$nginx_sbin_path -t -c $nginx_config_path" >> /usr/lib/systemd/system/nginx.service
sudo echo "ExecStart=$nginx_sbin_path -c $nginx_config_path" >> /usr/lib/systemd/system/nginx.service
sudo echo "ExecReload=/bin/kill -s HUP $MAINPID" >> /usr/lib/systemd/system/nginx.service
sudo echo "ExecStop=/bin/kill -s QUIT $MAINPID" >> /usr/lib/systemd/system/nginx.service
sudo echo "PrivateTmp=true" >> /usr/lib/systemd/system/nginx.service
sudo echo "" >> /usr/lib/systemd/system/nginx.service
sudo echo "[Install]" >> /usr/lib/systemd/system/nginx.service
sudo echo "WantedBy=multi-user.target" >> /usr/lib/systemd/system/nginx.service

# The following method will output Permission denied error and is depreciated.
#sudo cat << EOF > /usr/lib/systemd/system/nginx.service
#[Unit]
#Description=nginx - high performance web server 
#Documentation=http://nginx.org/en/docs/
#After=network.target remote-fs.target nss-lookup.target
#
#[Service]
#Type=forking
#PIDFile=$nginx_pid_path
#ExecStartPre=$nginx_sbin_path -t -c $nginx_config_path
#ExecStart=$nginx_sbin_path -c $nginx_config_path
#ExecReload=/bin/kill -s HUP $MAINPID
#ExecStop=/bin/kill -s QUIT $MAINPID
#PrivateTmp=true
#
#[Install]
#WantedBy=multi-user.target

sudo systemctl start nginx
echo -e "\nIn order to protect your server from going overheated, we have paused the script. "
echo -e "After $interval_between_compiling seconds, compilation of MariaDB will automatically start."
echo -e "" && echo -e "Script paused running at:" && date 
sleep $interval_between_compiling

## MariaDB installation.
reset
echo -e "Now installing MariaDB."
# Create database operator user and assign privileges
sudo groupadd $MariaDB_group
sudo useradd -g $MariaDB_group $MariaDB_user -s /bin/false
sudo mkdir -p $MariaDB_data_path
sudo chown -R $MariaDB_group:$MariaDB_user $MariaDB_data_path
# Start compiling MariaDB
cd ../mariadb-$mariaDB_version
cmake . -DCMAKE_INSTALL_PREFIX=$MariaDB_sbin_path -DMYSQL_DATADIR=$MariaDB_data_path -DSYSCONFDIR=$MariaDB_config_path -DWITH-ZLIB=system -DWITH_SSL=system
make -j$compiling_thread && sudo make install
# Copy configuation example to the config directory.
sudo cp ./support-files/my-$MariaDB_database_scale.cnf $MariaDB_config_path/my.cnf
# Init MariaDB init.d support
sudo mkdir -p /etc/inid.d
sudo cp ./support-files/mysql.server /etc/init.d/mariadb
sudo chmod +x /etc/init.d/mariadb
sudo chkconfig --add mariadb
sudo chkconfig mariad on
sudo $MariaDB_sbin_path/scripts/mysql_install_db --user=$MariaDB_user --datadir=$MariaDB_data_path
sudo echo "datadir = $MariaDB_data_path" >> $MariaDB_config_path/my.cnf
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo -e "\nIn order to protect your server from going overheated, we have paused the script. "
echo -e "After $interval_between_compiling seconds, compilation of PHP will automatically start."
echo -e "" && echo -e "Script paused running at:" && date 
sleep $interval_between_compiling

## php installation.
reset
echo -e "Now installing PHP."
cd ../php-$php_version
./configure --enable-fpm --with-openssl --with-libxml-dir=/usr/include/libxml2 --enable-calendar --enable-exif --enable-ftp --enable-libgcc --with-jpeg-dir=../jpeg-$libjpeg_version --with-png-dir=../libpng-$libpng_version --with-zlib-dir=../zlib-$zlib_version --with-freetype-dir=../freetype-$freetype_version --with-xpm-dir=../libXpm-$libXpm_version --enable-embedded-mysqli --enable-opcache --enable-pcntl --enable-shmop -with-iconv --enable-zip --enable-zend-signals --with-mcrypt --with-gd --with-pcre-regex --enable-sockets --enable-sysvmsg --enable-sysvsem  --enable-sysvshm --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd
make -j$compiling_thread && sudo make install
sudo cp ./sapi/fpm/php-fpm.service.in /usr/lib/systemd/system/php-fpm.service
sudo cp ./sapi/fpm/init.d.php-fpm.in /etc/init.d/php-fpm
sudo chmod +x /etc/init.d/php-fpm
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

echo -e "If no error occured, this script has done what it has to do. Press any key to exit this script."
echo -e "Thank you for being a part of Equestria."
read -s -n1 -p ""
