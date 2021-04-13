FROM drecom/centos-ruby:2.5.0
#FROM centos:7

ARG RUBY_VERSION=25
ENV RUBY_VERSION=${RUBY_VERSION}

RUN yum -y update && yum -y reinstall glibc-common \
&& yum -y install tar sudo \
&& yum -y clean all

RUN mkdir -p /gems
COPY *.gem /gems/

RUN sed -ri 's/Defaults    requiretty/#Defaults    requiretty/g' /etc/sudoers
COPY install-redhat-td-agent3.sh ./install-redhat-td-agent3.sh
RUN chmod +x ./install-redhat-td-agent3.sh  && sh -c install-redhat-td-agent3.sh

RUN cd /gems && gem install influxdb fluentd-plugin-influxdb

RUN cp -rfp /etc/td-agent /etc/td-agent-org
ADD td-agent.conf /etc/td-agent/td-agent.conf
CMD test -z "$(ls -A /etc/td-agent)" && cp -rfp /etc/td-agent-org/* /etc/td-agent ;\
    /usr/sbin/td-agent -o /var/log/td-agent/td-agent.log

VOLUME /var/log/td-agent
VOLUME /etc/td-agent
