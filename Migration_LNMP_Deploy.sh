########################################################################################################
# EquestriaCN LNMP Server Deployment Shell by BronyDee         2016-06-21        ver. 1.0 revised      #
########################################################################################################

## The last time this script was updated.
export LAST_UPDATE=20160621

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
# DEFAULT_MARIADB_GROUP = mariadb                                                                     #
########################################################################################################

export nginx_config_path=/etc/nginx/nginx.conf
export nginx_sbin_path=/usr/local/nginx/nginx
export nginx_pid_path=/var/run/nginx.pid
export nginx_web_page_path=/var/www/html
export nginx_http_log_path=/var/log/nginx/nginx.access.log
export nginx_error_log_path=/var/log/nginx/nginx.error.log
export nginx_user=www
export nginx_group=www
export MariaDB_sbin_path=/usr/local/mariadb
export MariaDB_config_path=/etc/mariadb
export MariaDB_data_path=/usr/local/mariadb/data
export MariaDB_database_scale=small
export MariaDB_user=mariadb
export MariaDB_group=mariadb

########################################################################################################
# Init screen for deployment. Clear the screen for the command to show up.							   #
########################################################################################################

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n" # Screen cleanup
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
echo -e "The following component will be installed:"
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
echo -e "* The nginx program will be placed under /web/nginx/nginx."
echo -e "* The nginx PID file will be stored at /web/nginx/nginx.pid."
echo -e "* The nginx configuation file will be stored at /web/nginx/nginx.conf."
echo -e "* The nginx will run under the user named www, which is under the group www."
echo -e "* MariaDB database files will be located under /web/mysqld/database."
echo -e "* MariaDB program files will be stored under /web/mysqld."
echo -e "* MariaDB configuation files will be placed at /etc/mysqld/configuation."
echo -e "* MariaDB will run under the user named mysql, which is under the group mysql."
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
# continue to install the development toolkits and necesscities. 									   #
########################################################################################################

echo -e "Installing dependencies."
sudo apt-get update && sudo install build-essential libssl-dev libXpm-dev libicu-dev cmake make autoconf

########################################################################################################
# Start downloading sources using the version settings provided.									   #
########################################################################################################
echo -e "Making directories under $download_dir."
mkdir -p $download_dir/LNMP_Install_Temp
cd $download_dir/LNMP_Install_Temp

echo -e "Downloading and unpacking necessary files."
echo -e "Depending on the network status of your server, this might take up to 5 minutes. Please be patient."

# nginx download and unpack
curl -O https://nginx.org/download/nginx-$nginx_version.tar.gz
tar -xvf ./nginx-$nginx_version.tar.gz

# pcre download and unpack
curl -O ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-$pcre_version.tar.gz
tar -xvf ./pcre-$pcre_version.tar.gz

# OpenSSL download and unpack
curl -O https://www.openssl.org/source/openssl-$openssl_version.tar.gz
tar -xvf openssl-$openssl_version.tar.gz

# MariaDB download and unpack
curl -O https://mirrors.tuna.tsinghua.edu.cn/mariadb/mariadb-$mariaDB_version/source/mariadb-$mariaDB_version.tar.gz
tar -xvf ./mariadb-$mariaDB_version.tar.gz

# php interpreter download and unpack
curl -O http://cn2.php.net/distributions/php-$php_version.tar.gz
tar -xvf ./php-$php_version.tar.gz

# libjpeg download and unpack
curl -O http://www.ijg.org/files/jpegsrc.v$libjpeg_version.tar.gz
tar -xvf ./jpegsrc.v$libjpeg_version.tar.gz

# libpng download and unpack
curl -O ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng16/libpng-$libpng_version.tar.gz
tar -xvf ./libpng-$libpng_version.tar.gz

# freetype download and unpack
curl -O http://download.savannah.gnu.org/releases/freetype/freetype-$freetype_version.tar.gz
tar -xvf ./freetype-$freetype_version.tar.gz

# libXpm download and unpack
curl -O http://xorg.freedesktop.org/archive/individual/lib/libXpm-$libXpm_version.tar.gz
tar -xvf ./libXpm-$libXpm_version.tar.gz

# libmcrypt download and unpack
curl -O http://freefr.dl.sourceforge.net/project/mcrypt/Libmcrypt/$libmcrypt_version/libmcrypt-$libmcrypt_version.tar.gz
tar -xvf ./libmcrypt-$libmcrypt_version.tar.gz

# zlib download and unpack
curl -O http://zlib.net/zlib-$zlib_version.tar.gz
tar -xvf ./zlib-$zlib_version.tar.gz

########################################################################################################
# Start compiling sources using the version settings provided.									       #
########################################################################################################

## libmcrypt installation.
echo -e "Now installing libmcrypt. Please wait."
cd ./libmcrypt-$libmcrypt_version
./configure && make -j$compiling_thread && sudo make install

## nginx installation.
echo -e "Now installing OpenSSL, PCRE and Nginx."
# Create nginx user and assign privileges
sudo groupadd $nginx_group
sudo useradd -g $nginx_group $nginx_user -s /bin/false 
sudo mkdir -p $nginx_web_page_path
sudo chown -R $nginx_group:$nginx_user $nginx_web_page_path
cd ../nginx-$nginx_version
./configure --sbin-path=$nginx_sbin_path --conf-path=$nginx_config_path --pid-path=$nginx_pid_path --with-http_ssl_module --without-select_module --with-poll_module --with-threads --with-http_v2_module --with-http_realip_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gzip_static_module --with-http_secure_link_module --with-http_auth_request_module --with-pcre=../pcre-$pcre_version --with-zlib=../zlib-$zlib_version --user=$nginx_user --group=nginx_group --http-log-path=$nginx_http_log_path --error-log-path=$nginx_error_log_path --with-openssl=../openssl-$openssl_version
make -j$compiling_thread && sudo make install
# Init nginx systemd support
sudo mkdir -p /usr/lib/systemd/system
sudo touch /usr/lib/systemd/system/nginx.service
sudo cat /usr/lib/systemd/system/nginx.service << EOL
	[Unit]
	Description=nginx - high performance web server 
	Documentation=http://nginx.org/en/docs/
	After=network.target remote-fs.target nss-lookup.target

	[Service]
	Type=forking
	PIDFile=$nginx_pid_path
	ExecStartPre=$nginx_sbin_path -t -c $nginx_config_path
	ExecStart=$nginx_sbin_path -c $nginx_config_path
	ExecReload=/bin/kill -s HUP $MAINPID
	ExecStop=/bin/kill -s QUIT $MAINPID
	PrivateTmp=true

	[Install]
	WantedBy=multi-user.target
EOL
# Init nginx init.d support
sudo mkdir -p /etc/init.d/nginx
sudo touch /etc/init.d/nginx
sudo cat /etc/init.d/nginx << EOL 
	#!/bin/sh  
	#  
	# nginx - this script starts and stops the nginx daemon  
	#  
	# chkconfig:   - 85 15  
	# description:  Nginx is an HTTP(S) server, HTTP(S) reverse \  
	#               proxy and IMAP/POP3 proxy server  
	# processname: nginx  
	# config:      $nginx_config_path
	# pidfile:     $nginx_pid_path 
	  
	# Source function library.  
	. /etc/rc.d/init.d/functions  
	  
	# Source networking configuration.  
	. /etc/sysconfig/network  
	  
	# Check that networking is up.  
	[ "$NETWORKING" = "no" ] && exit 0  
	  
	nginx="$nginx_sbin_path"  
	prog=$(basename $nginx)  
	  
	NGINX_CONF_FILE="$nginx_config_path"  
	  
	lockfile=/var/lock/subsys/nginx  
	  
	start() {  
	    [ -x $nginx ] || exit 5  
	    [ -f $NGINX_CONF_FILE ] || exit 6  
	    echo -n $"Starting $prog: "  
	    daemon $nginx -c $NGINX_CONF_FILE  
	    retval=$?  
	    echo  
	    [ $retval -eq 0 ] && touch $lockfile  
	    return $retval  
	}  
	  
	stop() {  
	    echo -n $"Stopping $prog: "  
	    killproc $prog -QUIT  
	    retval=$?  
	    echo  
	    [ $retval -eq 0 ] && rm -f $lockfile  
	    return $retval  
	}  
	  
	restart() {  
	    configtest || return $?  
	    stop  
	    start  
	}  
	  
	reload() {  
	    configtest || return $?  
	    echo -n $"Reloading $prog: "  
	    killproc $nginx -HUP  
	    RETVAL=$?  
	    echo  
	}  
	  
	force_reload() {  
	    restart  
	}  
	  
	configtest() {  
	  $nginx -t -c $NGINX_CONF_FILE  
	}  
	  
	rh_status() {  
	    status $prog  
	}  
	  
	rh_status_q() {  
	    rh_status >/dev/null 2>&1  
	}  
	  
	case "$1" in  
	    start)  
	        rh_status_q && exit 0  
	        $1  
	        ;;  
	    stop)  
	        rh_status_q || exit 0  
	        $1  
	        ;;  
	    restart|configtest)  
	        $1  
	        ;;  
	    reload)  
	        rh_status_q || exit 7  
	        $1  
	        ;;  
	    force-reload)  
	        force_reload  
	        ;;  
	    status)  
	        rh_status  
	        ;;  
	    condrestart|try-restart)  
	        rh_status_q || exit 0  
	            ;;  
	    *)  
	        echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|configtest}"  
	        exit 2  
	esac
EOL
sudo chmod +x /etc/inid.d/nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo -e "In order to protect your server from going overheated, we have paused the script. "
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
# Init MariaDB init.d support
sudo cp ./support-files/my-$MariaDB_database_scale.cnf $MariaDB_config_path/my.cnf
sudo cp ./support-files/mysql.server /etc/init.d/mariadb
sudo chmod +x /etc/init.d/mariadb
sudo chkconfig --add mariadb
sudo chkconfig mariad on
sudo $MariaDB_sbin_path/scripts/mysql_install_db --user=$MariaDB_user --datadir=$MariaDB_data_path
sudo echo "datadir = $MariaDB_data_path" >> $MariaDB_config_path/my.cnf
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo -e "In order to protect your server from going overheated, we have paused the script. "
echo -e "After $interval_between_compiling seconds, compilation of PHP will automatically start."
echo -e "" && echo -e "Script paused running at:" && date 
sleep $interval_between_compiling

## php installation.
reset
echo -e "Now installing PHP."
cd ../php-$php_version
./configure --enable-fpm –with-fpm-user=$nginx_user –with-fpm-group=$nginx_group --with-openssl --with-libxml-dir=/usr/include/libxml2 --enable-calendar --enable-exif --enable-ftp --enable-libgcc --with-jpeg-dir=../jpeg-$libjpeg_version --with-png-dir=../libpng-$libpng_version --with-zlib-dir=../zlib-$zlib_version --with-freetype-dir=../freetype-$freetype_version --with-xpm-dir=../libXpm-$libXpm_version --enable-embedded-mysqli --enable-opcache --enable-pcntl --enable-shmop -with-iconv --enable-zip --enable-zend-signals --with-mcrypt --with-gd --with-pcre-regex --enable-sockets --enable-sysvmsg --enable-sysvsem  --enable-sysvshm --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd
make -j$compiling_thread && sudo make install
sudo cp ./sapi/fpm/php-fpm.service.in /usr/lib/systemd/system/php-fpm.service
sudo cp ./sapi/fpm/init.d.php-fpm.in /etc/init.d/php-fpm
sudo chmod +x /etc/init.d/php-fpm
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

echo -e "If no error occured, this script has done what it has to do. Press any key to exit this script."
echo -e "Thank you for being a part of Equestria."
read -s -n1 -p ""
