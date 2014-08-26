# This is a comment
FROM centos:centos7
MAINTAINER Jeremy Brown <jeremy@tenfourty.com>

ENV container docker

RUN yum -y update; yum clean all

RUN su -c 'rpm -Uvh http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm'

RUN yum -y install znc znc-extra; yum clean all;

RUN mkdir /znc-data
RUN chown znc:znc /znc-data
RUN chmod 777 /znc-data

USER 	znc
EXPOSE 	8080 6667 6697
VOLUME	["/znc-data"]

CMD znc -f -d /znc-data
