#!/bin/bash
# delete log files and restart apache
	rm /var/log/apache2/*.log*
	apache2ctl restart 2>/dev/null
# pull current ip address
	ipadd=`ip addr | grep '10.5' | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`
# Ensure a 10.5 address is listed
	if [ -z "$ipadd" ]; then
		echo "Error: You need to have an IP address on either eth0 or tap0"
		exit;
	else
		echo $ipadd
	fi
# get a rand for the filename
	randfile=$RANDOM
# generate traffic
	for i in {1..17}; do curl -s -k http://Sec-511-Linux/$randfile.php -A "Cylon/5.0" > /dev/null; done
	for i in {1..97}; do curl -s -k http://Sec-511-Linux/$randfile.php -A "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0" > /dev/null; done
	for i in {1..39}; do curl -s -k http://localhost/$randfile.php -A "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0" > /dev/null; done
	for i in {1..1}; do curl -s -k "https://localhost/$randfile.php?password=pass&password=';DROP TABLE Users;--" -A "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0" > /dev/null; done
	for i in {1..4}; do curl -s -k http://$ipadd/$randfile.php -A "Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0" > /dev/null; done
	for i in {1..1}; do curl -s -k http://$ipadd/$randfile.php -A "mozilla/3.1.1" > /dev/null; done
	for i in {1..1}; do curl -s -k http://Sec-511-Linux/$randfile.php -A "mozilla/3.1.1" > /dev/null; done
	for i in {1..7}; do curl -s -k http://$ipadd/$randfile.php -A "Atari/2600" > /dev/null; done	#for i in {1..2}; do curl -s -k http://Sec-511-Linux/$randfile.php -A "Mozilla" > /dev/null; done
	for i in {1..1}; do curl -s -k http://$ipadd/$randfile.php -A "" > /dev/null; done
# fix log ownership
	chown -R root:adm /var/log/apache2/
