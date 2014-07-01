FROM centos
MAINTAINER Yuu Yamanaka <yuu@relx.jp>

RUN yum update -y

ADD td.repo /etc/yum.repos.d/
RUN yum install -y td-agent
RUN echo "include /conf.d/*.conf" > /etc/td-agent/td-agent.conf

VOLUME ["/conf.d", "/data"]
EXPOSE 24224/tcp 24224/udp

ENTRYPOINT ["td-agent"]
