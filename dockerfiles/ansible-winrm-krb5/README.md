# Ansible for Windows host management (WinRM and KRB5)
This Ansible OCI image variant, like all the other images managed by this project, is based on the [official Alpine Docker image](https://hub.docker.com/_/alpine). This Ansible image is configured to run tasks over Microsoft PowerShell Remoting Protocol (PSRP) rather than WinRM. You can use basic authentication if you wish but Kerberos is the recommended authentication protocol for domain-joined Windows hosts. Furthermore, if your domain-joined Windows hosts are configured with security in mind you should always use TLS-encrypted connection. 

This image variant can be easily configured to make use of [Ansible's automatic Kerberos ticket management](https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#automatic-kerberos-ticket-management).


# External References
* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html

* https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#kerberos

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#winrm-encryption

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#automatic-kerberos-ticket-management