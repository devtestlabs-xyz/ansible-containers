# Ansible with PSRP and KRB5
This Ansible OCI image variant, like all the other images managed by this project, is based on the [official Alpine Docker image](https://hub.docker.com/_/alpine). This Ansible image is configured to run tasks over Microsoft PowerShell Remoting Protocol (PSRP) rather than WinRM. You can use basic authentication if you wish but Kerberos is the recommended authentication protocol for domain-joined Windows hosts. Furthermore, if your domain-joined Windows hosts are configured with security in mind you should always use TLS-encrypted connection. 

This image variant can be easily configured to make use of [Ansible's automatic Kerberos ticket management](https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#automatic-kerberos-ticket-management).

PSRP is a great choice to connect to Windows hosts. PSRP is especially useful if you are required to connect to your Windows hosts via a Linux Bastion host. In this usecase you will establish a SOCKS 5 proxy within an SSH tunnel so that you can establish a useful TCP connection between your Ansible controller and the Windows host.

Here's a great article on PSRP, WinRM, PyPSRP; It's written by Jordan Borean, the lead developer of the [PyPSRP Python library]. 

* (https://pypi.org/project/pypsrp/) https://www.bloggingforlogging.com/2018/08/14/powershell-remoting-on-python/

And here's the [Ansible User Guide documentation about the PSRP connection](https://docs.ansible.com/ansible/latest/plugins/connection/psrp.html).


*TODO: Implement Dockerfile and entrypoint.sh*

# External References
* https://docs.ansible.com/ansible/latest/plugins/connection/psrp.html

* https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#kerberos

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#winrm-encryption

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#automatic-kerberos-ticket-management