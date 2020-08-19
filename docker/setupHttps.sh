#!/bin/bash

certFile=/sslData/runestone.crt
keyFile=/sslData/runestone.key

paramsFile=/sslData/ssl-params.conf
confFile=/sslData/self-signed.conf

siteFile=/sslData/runestone

if test -f "$certFile"; then
    cp $certFile /etc/ssl/certs/runestone.crt
    cp $keyFile /etc/ssl/private/runestone.key
    cp $paramsFile /etc/nginx/snippets/ssl-params.conf
    cp $confFile /etc/nginx/snippets/self-signed.conf
    rm /etc/nginx/sites-enabled/runestone
    cp $siteFile /etc/nginx/sites-enabled/runestone
    echo "HTTPS Setup"
    # exit 0
else
	echo "HTTPS files not found - using HTTP instead."	
fi


# exit 1