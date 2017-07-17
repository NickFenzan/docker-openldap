#!/bin/bash -e
	#--volume /home/nick/Code/docker/openldap/docker-openldap/fromcontainer:/etc/ldap/misc \
docker run --name ldap-service --hostname ldap-service \
	--detach mvnfenzan/openldap:0.1.0
docker run --name phpldapadmin-service --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host --detach osixia/phpldapadmin:0.6.12

PHPLDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" phpldapadmin-service)

echo "Go to: https://$PHPLDAP_IP"
echo "Login DN: cn=admin,dc=example,dc=org"
echo "Password: admin"
