itherz/webapp-full:d7 +sendemail

docker run

```yaml
'sendemail':
    pull_on_start: true
    image: 'zloystrelok/d7-sendemail'
    env_data:
      - "PHP_MODULES=gd mysqli pdo_mysql ldap gettext mbstring curl fileinfo opcache zip unzip "
      - "TIMEZONE=Europe/Moscow"
    volumes:
      - '/www/sendemail:/var/www/html/current'
      - '/www/sendemail/05-php.conf:/etc/nginx/conf.d/05-php.conf'
```
