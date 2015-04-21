FROM centos:centos6
MAINTAINER Alfonso Pinto <alfonso.pinto@gmail.com>

RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum -y update; yum clean all
RUN yum -y install tar; yum clean all
RUN yum -y install ruby-devel; yum clean all
RUN yum -y install puppet; yum clean all
RUN puppet resource package puppet ensure=latest
RUN /etc/init.d/puppet start
RUN puppet module install puppetlabs-apache
RUN puppet module install stahnma-epel
RUN puppet module install meltwater-cpan
RUN puppet module install palli-createrepo

ADD yumrepo.pp /yumrepo.pp

RUN puppet apply /yumrepo.pp

EXPOSE 80

ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
