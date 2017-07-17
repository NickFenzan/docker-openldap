#!/bin/bash -e
echo "Stopping PHP LDAP Admin"
docker stop phpldapadmin-service
echo "Stopping OpenLDAP"
docker stop ldap-service

echo "Removing PHP LDAP Admin"
docker rm phpldapadmin-service
echo "Removing OpenLDAP"
docker rm ldap-service
