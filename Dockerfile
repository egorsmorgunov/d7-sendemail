FROM zloystrelok/d7

#fix jessie repo
RUN rm /etc/apt/sources.list \
	&& echo "deb http://archive.debian.org/debian/ jessie main" | tee -a /etc/apt/sources.list \
	&& echo "deb-src http://archive.debian.org/debian/ jessie main" | tee -a /etc/apt/sources.list \
	&& echo "Acquire::Check-Valid-Until false;" | tee -a /etc/apt/apt.conf.d/10-nocheckvalid \
	&& echo 'Package: *\nPin: origin "archive.debian.org"\nPin-Priority: 500' | tee -a /etc/apt/preferences.d/10-archive-pin
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
	&& echo "export LANG=ru_RU.utf8" >> /root/.bashrc
