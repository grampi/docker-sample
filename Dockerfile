FROM ubuntu
MAINTAINER Grampi <grampi@example.com>

RUN apt-get update
RUN apt-get install -y apache2 php libapache2-mod-php7.0 mc postgresql php7.0-pgsql wget curl php7.0-xml php7.0-intl
RUN a2enmod php7.0
RUN a2enmod rewrite
RUN service apache2 restart

ENV TERM xterm

EXPOSE 80
EXPOSE 443

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
