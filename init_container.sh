#!/bin/sh

# Get environment variables to show up in SSH session
eval $(printenv | awk -F= '{print "export " $1"="$2 }' >> /etc/profile)

/etc/init.d/sshd restart
 
python /app/runserver.py 