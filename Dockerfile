FROM zloystrelok/d7

RUN set -x \
	&& apt-get update \
	&& apt-get install -y libldap2-dev
	#Установка руской локали
RUN apt-get install -y locales \
	&& echo LANG="ru_RU.UTF-8" >> /etc/default/locale \
	&& echo LANG="ru_RU.UTF-8" >> /etc/environment  \
	&& echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen \
	&& dpkg-reconfigure locales \
	# Последовательность последнего эха важна!
	&& echo "export LANG=ru_RU.utf8" >> /root/.bashrc
