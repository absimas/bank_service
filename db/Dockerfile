FROM ubuntu:16.04

MAINTAINER Simas Abramovas <ab.simas@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install galera and mysql with wsrep
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 BC19DDBA
RUN add-apt-repository 'deb http://releases.galeracluster.com/ubuntu xenial main'
RUN apt-get update
RUN apt-get install -y galera-3 galera-arbitrator-3 mysql-wsrep-5.6 rsync lsof

# Set MySQL cfg
COPY my.cnf /etc/mysql/my.cnf

# Start with a script that will execute the MySQL daemon with any args given
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
