FROM ubuntu:14.04
MAINTAINER EventMobi Platform Team <platform@eventmobi.com>

# Update to fetch deb sources
RUN apt-get update -y

# Install curl
RUN apt-get install -y curl

# Install GPG key and add td-agent deb source
RUN curl http://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add -
RUN echo "deb [arch=amd64] http://packages.treasuredata.com/2/ubuntu/trusty/ trusty contrib" > /etc/apt/sources.list.d/treasure-data.list

# Update deb source listing
RUN apt-get update -y

# Install td-agent
RUN apt-get install -y td-agent

# Install td-agent config
ADD td-agent.conf /etc/td-agent/td-agent.conf

# Set volume for log location(s) via command line

CMD ["service", "td-agent", "start"]
