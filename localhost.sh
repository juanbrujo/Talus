#!/bin/sh

# edit httpd.conf to allow home directories.

bin=$(basename "${0}")
conf="/etc/apache2/httpd.conf"

if [ $(id -u) -ne 0 ]
then
  echo "ERROR: ${bin} must run as root. goodbye."
  exit 1
fi

# make backup file
n=1
while [ -f "${conf}.bak.${n}" ]
do
  let n=${n}+1
done
cp "${conf}" "${conf}.bak.${n}"

# edit httpd.conf in place - uncomment out two lines
sed -i ''                                                                 \
    -e '/^#.*[[:space:]]userdir_module[[:space:]]/s/^#*//'                \
    -e '/#Include \/private\/etc\/apache2\/extra\/httpd-userdir.conf/s/^#//'   \
    "${conf}"

echo "INFO: ${bin}:"
echo "INFO: ${bin}: check that this looks OK"
echo "INFO: ${bin}: % cat /private/etc/apache2/extra/httpd-userdir.conf"
echo "INFO: ${bin}:"
cat /private/etc/apache2/extra/httpd-userdir.conf
echo "INFO: ${bin}:"
echo "INFO: ${bin}: in particular, that '/private/etc/apache2/users/*.conf' files look OK"
ls /private/etc/apache2/users/*.conf
echo "INFO: ${bin}:"
echo "INFO: ${bin}: hint: check for /private/etc/apache2/users/${SUDO_USER}.conf"
if [ -f "/private/etc/apache2/users/${SUDO_USER}.conf" ]
then
  echo "INFO: ${bin}: /private/etc/apache2/users/${SUDO_USER}.conf exists. See if it is OK."
else
  echo "INFO: ${bin}: /private/etc/apache2/users/${SUDO_USER}.conf does NOT exist."
fi  
echo "INFO: ${bin}:"
echo "INFO: ${bin}: here is a sample conf file (with php and perl enabled)."
echo "INFO: ${bin}:"
cat<<!
<Directory "/Users/${SUDO_USER}/Sites/">
  Options Indexes MultiViews FollowSymLinks
  AllowOverride All
  Order allow,deny
  Allow from all
  Require all granted
  Options +ExecCGI
  AddHandler cgi-script .cgi .pl
</Directory>
!
echo "INFO: ${bin}:"
echo "INFO: ${bin}: restarting apache httpd"
sudo apachectl restart
echo "INFO: ${bin}:"