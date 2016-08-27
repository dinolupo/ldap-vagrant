# Vagrant LDAP

This is a [Vagrant](https://www.vagrantup.com/) Environment for a [Directory/LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol) Server.

This lets you easily test your application code against a real sandboxed server. Also installs phpldapadmin.

This uses the [slapd](http://www.openldap.org/software/man.cgi?query=slapd) daemon from [OpenLDAP](http://www.openldap.org/).

LDAP is described at [RFC 4510 (Technical Specification)](https://tools.ietf.org/html/rfc4510).

Also check the [OpenLDAP Server documentation at the Ubuntu Server Guide](https://help.ubuntu.com/lts/serverguide/openldap-server.html).

## Usage

1) Clone this repository:

`git clone git@github.com:dinolupo/ldap-vagrant.git`

2) Install [landrush](https://github.com/vagrant-landrush/landrush) Plugin for Vagrant, it permits to configure a DNS for Vagrant VMs.

`vagrant plugin install landrush`

3) Run `vagrant up` to configure the `ldap.vagrant.dev` LDAP server environment.

The environment comes pre-configured with the following entries:

    cn=admin,dc=vagrant,dc=dev
    uid=alice,ou=people,dc=vagrant,dc=dev
    uid=bob,ou=people,dc=vagrant,dc=dev
    uid=carol,ou=people,dc=vagrant,dc=dev
    uid=dave,ou=people,dc=vagrant,dc=dev
    uid=eve,ou=people,dc=vagrant,dc=dev
    uid=frank,ou=people,dc=vagrant,dc=dev
    uid=grace,ou=people,dc=vagrant,dc=dev
    uid=henry,ou=people,dc=vagrant,dc=dev

To see how these were added take a look at the end of the [provision.sh](provision.sh) file.

To troubleshoot, watch the logs with `vagrant ssh` and `sudo journalctl --follow`.

4) Go to [http://ldap.vagrant.dev/phpldapadmin](http://ldap.vagrant.dev/phpldapadmin)

Default password is "password" without quotes.
You can change admin and users passwords at the top of the `provision.sh` file.
