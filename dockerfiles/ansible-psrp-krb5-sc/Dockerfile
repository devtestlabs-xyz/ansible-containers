# Official Alpine Linux image
FROM alpine:3.11.3

# KRB5 Cache location
# Shared memory with attached KRB5 Sidecar container
ENV KRB5CCNAME=/dev/shm/ccache

# Pin Ansible version
# https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html
ENV ANSIBLE_VERSION 2.9.1

ENV VIRT_APK_PACKAGES \
  build-base \
  linux-headers \
  gcc \
  musl-dev \
  libffi-dev \
  openssl-dev \
  krb5-dev \
  python3-dev

ENV APK_PACKAGES \
  openssh-client \
  python3 \
  py3-dateutil \
  py3-httplib2 \
  py3-jinja2 \
  py3-paramiko \
  py3-yaml \
  ca-certificates \
  krb5 

COPY entrypoint.sh /usr/local/bin
RUN ln -s /usr/local/bin/entrypoint.sh / # backwards compat

RUN set -x && \
    \
    env && \
    echo "===> Temporarily installing APKs (virtual packages)..."  && \
    apk add --no-cache --virtual .build-deps ${VIRT_APK_PACKAGES} && \
      \
    echo "==> Upgrading apk and system..."  && \
    apk update && apk upgrade && \
    \
    echo "==> Installing Python and other required APKs..."  && \
    apk add --no-cache ${APK_PACKAGES} && \
    \
    echo "===> Installing Ansible version ${ANSIBLE_VERSION}..."  && \
    pip3 install --no-cache-dir kerberos pypsrp pypsrp[kerberos] ansible==${ANSIBLE_VERSION} && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    \
    echo "===> Removing default KRB5 configuration file..."  && \
    rm -f /etc/krb5.conf && \
    \
    echo "===> Cleaning up..."  && \
    apk del .build-deps && \
    chmod +x /usr/local/bin/entrypoint.sh && \
    unset http_proxy https_proxy

ENTRYPOINT ["entrypoint.sh"]

LABEL maintainer="Ryan Craig"

# http://label-schema.org/rc1/ namespace labels
LABEL org.label-schema.schema-version="1.0"
#LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="devtestlabs/ansible-psrp-sc"
LABEL org.label-schema.description="Redhat Ansible controller for Windows"
#LABEL org.label-schema.url=$ORG_WEB_URL
#LABEL org.label-schema.vcs-url=$VCS_URL
#LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="devtestlabs.xyz"
#LABEL org.label-schema.version=$BUILD_VERSION