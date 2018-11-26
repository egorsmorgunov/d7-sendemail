FROM zloystrelok/d7

RUN set -x \
	&& apt-get update \
	&& apt-get install -y libldap2-dev sendemail 
	#Установка руской локали
RUN apt-get install -y locales \
	&& echo LANG="ru_RU.UTF-8" >> /etc/default/locale \
	&& echo LANG="ru_RU.UTF-8" >> /etc/environment  \
	&& echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen \
	&& dpkg-reconfigure locales \
	# Последовательность последнего эха важна!
	&& echo "export LANG=ru_RU.utf8" >> /root/.bashrc \
	
	# Удалим не нужные файлики
	&& rm /etc/nginx/conf.d/05-php.conf \
	&& rm /etc/nginx/conf.d/01-root.conf \
	&& rm /etc/nginx/conf.d/00-stub.conf 

#ADD 05-php.conf /etc/nginx/conf.d/
	#&& rm -rf /var/lib/apt/lists/* \
	#&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
	#&& docker-php-ext-install ldap \
	#&& apt-get purge -y --auto-remove libldap2-dev
