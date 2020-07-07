# Supported tags and respective Dockerfile links
Tags are grouped by image variant. Currently five image variants are managed in this repository.

All images are tagged using the following convention:
* {{ ANSIBLE_VERSION }}-{{ IMAGE_VARIANT }}-{{ BASE_IMAGE }}{{ BASE_IMAGE_VERSION }}
* {{ ANSIBLE_VERSION }}-{{ IMAGE_VARIANT }}
* {{ IMAGE_VARIANT }} (only exists for latest image for each variant)

If you want to guarantee consistency through space and time use the long image tag!

*NOTE: Tag specifications are linked to the image variant path within the [Github: devtestlabs-xyz/ansible-containers project](https://github.com/devtestlabs-xyz/ansible-containers)*

## Ansible for Windows management
### PSRP and KRB5
* [2.9.10-psrp-krb5-alpine3.12.0, 2.9.10-psrp-krb5, psrp-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-krb5)
* [2.9.9-psrp-krb5-alpine3.11.6, 2.9.9-psrp-krb5, psrp-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-krb5)
* [2.9.1-psrp-krb5-alpine3.11.3, 2.9.1-psrp-krb5, psrp-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-krb5)

### PSRP and KRB5 configured for use with KRB5 Sidecar
* [2.9.10-psrp-krb5-sc-alpine3.12.0, 2.9.10-psrp-krb5-sc, psrp-krb5-sc](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-krb5-sc)
* [2.9.9-psrp-krb5-sc-alpine3.11.6, 2.9.9-psrp-krb5-sc, psrp-krb5-sc](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-krb5-sc)
* [2.9.1-psrp-krb5-sc-alpine3.11.3, 2.9.1-psrp-krb5-sc, psrp-krb5-sc](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-krb5-sc)

### WinRM and KRB5
* [2.9.10-winrm-krb5-alpine3.12.0, 2.9.10-winrm-krb5, winrm-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-winrm-krb5)
* [2.9.9-winrm-krb5-alpine3.11.6, 2.9.9-winrm-krb5, winrm-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-winrm-krb5)
* [2.9.1-winrm-krb5-alpine3.11.3, 2.9.1-winrm-krb5, winrm-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-winrm-krb5)

### WinRM and KRB5 configured for use with KRB5 Sidecar
* [2.9.10-winrm-krb5-sc-alpine3.12.0, 2.9.10-winrm-krb5-sc, winrm-krb5-sc](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-winrm-sc)
* [2.9.9-winrm-krb5-sc-alpine3.11.6, 2.9.9-winrm-krb5-sc, winrm-krb5-sc](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-winrm-sc)
* [2.9.1-winrm-krb5-sc-alpine3.11.3, 2.9.1-winrm-krb5-sc, winrm-krb5-sc](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-psrp-winrm-sc)

## Ansible for Linux management
### SSH and KRB5
* [2.9.10-ssh-krb5-alpine3.12.0, 2.9.10-ssh-krb5, ssh-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-ssh-krb5)
* [2.9.9-ssh-krb5-alpine3.11.6, 2.9.9-ssh-krb5, ssh-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-ssh-krb5)
* [2.9.1-ssh-krb5-alpine3.11.3, 2.9.1-ssh-krb5, ssh-krb5](https://github.com/devtestlabs-xyz/ansible-containers/tree/master/dockerfiles/ansible-ssh-krb5)

### SSH and KRB5 configured for use with Sidecar (soon to come)
* soon to come...

# How to use this image

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

*NOTE: If you need to override Ansible's default behavior, you can bind mount the `ansible.cfg` file or pass in [Ansible environment variables](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings) on the command line or in a Docker `.env` file.

# Image variants
The DevTestLabs/ansible image is an extremely lightweight [RedHat Ansible](https://www.ansible.com/) [OCI compliant](https://www.opencontainers.org/) container image that run on [Docker](https://www.docker.com/), [Podman](https://podman.io/), and [Kubernetes](https://kubernetes.io/). 

All images variants managed by this project have the following commonalities:

* The [Official Alpine Docker image](https://hub.docker.com/_/alpine) is employed as the base image

* Python 3 in installed and configured

* Only the necessary APK packages and Python libraries are installed

* Required Kerberos packages are installed on each variant

* Ready to manage Active Directory domain-joined Windows and Linux hosts using Kerberos authentication over TLS encrypted WinRM and PSRP or SSH

* Run as Docker containers, Podman containers, and in K8s

Although some images variants are purpose-built for Windows host management you can manage Linux hosts as well; the default SSH configuration is fully intact.

# GitHub Project
https://github.com/devtestlabs-xyz/ansible-containers

# Related Projects
[Dockerhub: DevTestLabs/KRB5 Sidecar Container](https://hub.docker.com/repository/docker/devtestlabs/krb5-sidecar)
[Github: DevTestLabs/KRB5 Sidecar Container](https://github.com/devtestlabs-xyz/krb5-sidecar-container)


    
