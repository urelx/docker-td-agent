FROM centos
MAINTAINER Yuu Yamanaka <yuu@relx.jp>

RUN yum update -y

ADD td.repo /etc/yum.repos.d/
RUN yum install -y td-agent
