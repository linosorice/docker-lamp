FROM centos:6
MAINTAINER Pasqualino Sorice <lino.sorice@gmail.com>

ENV code_root /home
ENV httpd_conf ${code_root}/httpd.conf

RUN yum install -y centos-release-SCL
RUN yum install -y php54 php54-php php54-php-gd php54-php-mbstring php54-php-cli php54-php-mcrypt php54-php-pdo php54-php-xml php54-php-xdebug php54-php-mysqlnd

RUN yum install -y httpd

RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs gcc-c++ make

ADD . /home
RUN test -e $httpd_conf && echo "Include $httpd_conf" >> /etc/httpd/conf/httpd.conf

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

