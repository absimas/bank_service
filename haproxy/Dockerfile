FROM alpine:3.5

MAINTAINER Simas Abramovas <ab.simas@gmail.com>

ENV CONSUL_TEMPLATE_VERSION=0.18.2

# Install haproxy and other prerequisites
RUN apk add --update libnl3 bash haproxy ca-certificates zip && \
    rm -rf /var/cache/apk/*

# Fectch pre-compiled consul-template
ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /
RUN unzip /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mv /consul-template /usr/local/bin/consul-template && \
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mkdir -p /etc/consul-template/config.d /etc/consul-template/template.d

# Cfg files
ADD consul.cfg /etc/consul-template/config.d/consul.cfg
ADD haproxy.cfg /etc/consul-template/config.d/haproxy.cfg
ADD haproxy.tmpl /etc/consul-template/template.d/haproxy.tmpl

# Start consul-template that will initiate the haproxy
CMD /usr/local/bin/consul-template -config /etc/consul-template/config.d -wait 2s:10s -consul consul:8500
