#!/bin/bash
set -e

if [ "$1" = 'rabbitmq-server' ]; then
	chown -R rabbitmq /var/lib/rabbitmq
fi

#echo "执行 ... $@"
#$@
rabbitmq-server