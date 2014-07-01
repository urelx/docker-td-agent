FROM centos
MAINTAINER Yuu Yamanaka <yuu@relx.jp>

RUN yum update -y

ADD td.repo /etc/yum.repos.d/
RUN yum install -y td-agent

ADD td-agent.conf /etc/td-agent/

EXPOSE 24224/tcp 24224/udp

ENTRYPOINT ["td-agent"]
