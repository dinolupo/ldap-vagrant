#!/bin/bash
set -eux

config_organization_name=Example
config_fqdn=$(hostname --fqdn)
config_domain=$(hostname --domain)
config_domain_dc="dc=$(echo $config_domain | sed 's/\./,dc=/g')"
config_admin_dn="cn=admin,$config_domain_dc"
config_admin_password=password

function escapeForSed ()
{
  echo $1 | sed -e 's/[\/&]/\\&/g'
}

apt-get install -y --no-install-recommends phpldapadmin

# configuration reference https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-an-ubuntu-14-04-server

sed -i "s/'127.0.0.1'/'$config_fqdn'/g" /etc/phpldapadmin/config.php
sed -i "s/dc=example,dc=com/$config_domain_dc/g" /etc/phpldapadmin/config.php

sed -i "s/^.*\bhide_template_warning\b.*$/\$config->custom->appearance['hide_template_warning'] = true;/g" /etc/phpldapadmin/config.php

service apache2 restart

