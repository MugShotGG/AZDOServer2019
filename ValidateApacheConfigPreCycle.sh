#!/bin/bash

Store=$(apachectl -t 2>&1)
if [[ $Store = *Syntax*error* ]]
then
   BadConfig=$(ls /etc/httpd/conf.d -Art | tail -n 1)
   cd /etc/httpd/conf.d
   rm $BadConfig
echo "Config Error"
exit ConfigError
fi
apachectl restart
