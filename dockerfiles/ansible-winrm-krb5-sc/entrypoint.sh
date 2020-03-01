#!/bin/sh

printf "\n### Ansible Controller for secure control of Windows hosts ###\n\n"

printf "Use a KRB5 Sidecar container for Kerberos Authentication for secure control of Windows hosts."

ln -s /dev/shm/krb5-client.conf /etc/krb5.conf

klist

#/bin/sh
exec "$@"