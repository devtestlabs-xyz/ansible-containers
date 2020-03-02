# Ansible Containers
![Build and Publish Ansible WinRM KRB5 SC image](https://github.com/devtestlabs-xyz/ansible-containers/workflows/Build%20and%20Publish%20Ansible%20WinRM%20KRB5%20SC%20image/badge.svg) 
![Build and Publish Ansible SSH KRB5 image](https://github.com/devtestlabs-xyz/ansible-containers/workflows/Build%20and%20Publish%20Ansible%20SSH%20KRB5%20image/badge.svg) 
![Build and Publish Ansible PSRP KRB5 SC image](https://github.com/devtestlabs-xyz/ansible-containers/workflows/Build%20and%20Publish%20Ansible%20PSRP%20KRB5%20SC%20image/badge.svg) 
![Build and Publish Ansible WinRM KRB5 image](https://github.com/devtestlabs-xyz/ansible-containers/workflows/Build%20and%20Publish%20Ansible%20WinRM%20KRB5%20image/badge.svg) 
![Build and Publish Ansible PSRP KRB5 image](https://github.com/devtestlabs-xyz/ansible-containers/workflows/Build%20and%20Publish%20Ansible%20PSRP%20KRB5%20image/badge.svg)

This project manages the assets required to build and publish extremely lightweight [RedHat Ansible](https://www.ansible.com/) [OCI compliant](https://www.opencontainers.org/) container images that run on [Docker](https://www.docker.com/), [Podman](https://podman.io/), and [Kubernetes](https://kubernetes.io/). 

All OCI compliant container images managed by this project have the following commonalities:

* The [Official Alpine Docker image](https://hub.docker.com/_/alpine) is employed as the base image

* Python 3 in installed and configured

* Only the necessary APK packages and Python libraries are installed

* Kerberos client and tools is installed on each variant

* Ready to manage Active Directory domain-joined Windows and Linux hosts using Kerberos authentication over TLS encrypted WinRM and PSRP or SSH

* Run as Docker containers, Podman containers, and in K8s

## Goals
* Maintain up-to-date Ansible container images for Windows host management and Linux host management

* Strive for the smallest image size possible for efficient distribution to global on-premise datacenters and clouds

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

```
docker pull devestlabs/ansible:{{ VARIANT_TAG }}
```

*NOTE: Replace {{ VARIANT_TAG }} with actual, [valid tagname](https://hub.docker.com/r/devtestlabs/ansible/tags)*

### Run a container
*example docker run command*
```
docker run \
  --rm -it \
  -v /host/path/to/playbooks:/ansible/playbooks \
  -v /host/path/to/inventory:/ansible/inventory devtestlabs/ansible:{{ VARIANT_TAG }} \
  -i /ansible/inventory/hosts.yaml  \
  -c local --limit 'some-inventory-group-name' \
  /ansible/playbooks/a-playbook.yaml \
  -e 'ENV_VAR1=someVal ENV_VAR2=anotherVal'
```

*NOTE: Replace {{ VARIANT_TAG }} with actual, [valid tagname](https://hub.docker.com/r/devtestlabs/ansible/tags)*

*NOTE: If you need to override Ansible's default behavior, you can bind mount the `ansible.cfg` file or pass in [Ansible environment variables](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings) on the command line or in a Docker `.env` file.*

*TODO: Describe preflight, useful bind mounts, etc...*

## Build your own image locally
If you want to build your own image locally simply `cd` into `dockerfiles/ansible:{{ VARIANT_TAG }}`.

*NOTE: Replace {{ VARIANT_TAG }} with the the actual directory name part.*

In terminal, execute:

```
docker build -t ansible:{{ VARIANT_TAG }} .
```

*NOTE: Replace {{ VARIANT_TAG }} with the the Docker image name part. You can name your local image whatever you want; `mylocalrepo/ansible:123` for example.*

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

* https://www.opencontainers.org/

* https://www.redhat.com/en/technologies/management/ansible

* https://www.ansible.com/

* https://kubernetes.io/

* https://www.docker.com/

* https://podman.io/