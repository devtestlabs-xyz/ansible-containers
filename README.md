# Canned Ansible
![](https://github.com/devtestlabs-xyz/ansible-winrm-container/workflows/Build%20and%20Publish%20Docker/badge.svg)

This project manages the assets required to build and publish extremely lightweight RedHat Ansible OCI compliant container images that run on Docker, Podman, and Kubernetes. 

All OCI compliant container images managed by this project have the following commonalities:

* The [Official Alpine Docker image](https://hub.docker.com/_/alpine) is employed as the base image

* Python 3 in installed and configured

* Only the necessary APK packages and Python libraries are installed

## Goals
* Maintain up-to-date Ansible container images for Windows host management and Linux host management

* Strive for the smallest image size possible

* Solve enterprise problems such as securely managing Active Directory domain-joined Windows and Linux hosts


## Ansible image variants
The following Ansible image variants are maintained by this project.

* Ansible for Windows management (WinRM + KRB5)

* Ansible for Windows management (WinRM + KRB5 for use with KRB5 Sidecar container)

* Ansible for Windows management (PSRP + KRB5)

* Ansible for Windows management (PSRP + KRB5 for use with KRB5 Sidecar container)

* Ansible for Linux management (SSH + KRB5)

* Ansible for Linux management (SSH + KRB5 for use with KRB5 Sidecar container)

## Getting Started
*TODO...*

### Pull an image

*TODO: Once images are published, document...*

### Run a container

*TODO: Describe preflight, useful bind mounts, etc...*

## Build your own image locally
If you want to build your own image locally simply `cd` into `dockerfiles/ansible-{{ VARIANT }}`.

*NOTE: Replace {{ VARIANT }} with the the actual directory name part.*

In terminal, execute:

```
docker build -t ansible-{{ VARIANT }} .
```

*NOTE: Replace {{ VARIANT }} with the the Docker image name part. You can name your local image whatever you want; `mylocalrepo/ansible-123-abc` for example.*

For more information about the `build` command, see [Docker Commandline Reference - build](https://docs.docker.com/engine/reference/commandline/build/).

## TODOs
* Document rootless container configuration using Podman

* Document use with KRB5 Sidecar container

* Refactor static Dockerfiles and possibly employ templating or parameterized HashiCorp Packer configuration to build variant images

## External References
* https://docs.ansible.com/ansible/latest/plugins/connection/ssh.html

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html

* https://docs.ansible.com/ansible/latest/plugins/connection/psrp.html

* https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#kerberos

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#winrm-encryption

* https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html#automatic-kerberos-ticket-management

* https://github.com/devtestlabs-xyz/krb5-sidecar-container

* https://hub.docker.com/r/devtestlabs/krb5-sidecar

* https://docs.docker.com/engine/reference/commandline/build/
