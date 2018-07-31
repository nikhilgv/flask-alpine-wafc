#!/bin/sh

/etc/init.d/sshd restart
 
python /app/runserver.py 