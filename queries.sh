#!/bin/bash
# set -eux

config_organization_name=Example
config_fqdn=$(hostname --fqdn)
config_domain=$(hostname --domain)
config_domain_dc="dc=$(echo $config_domain | sed 's/\./,dc=/g')"
config_admin_dn="cn=admin,$config_domain_dc"
config_admin_password=password

echo "show the configuration tree."
ldapsearch -Q -LLL -Y EXTERNAL -H ldapi:/// -b cn=config dn | grep -v '^$'

echo "show the data tree"
ldapsearch -x -LLL -b $config_domain_dc dn | grep -v '^$'

echo "search for people and print some of their attributes."
ldapsearch -x -LLL -b $config_domain_dc '(objectClass=person)' cn mail
