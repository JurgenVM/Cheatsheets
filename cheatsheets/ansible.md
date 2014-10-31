# Ansible
## Run command
```
- name: Extract wordpress-latest tarball
  command: >-
    creates=/var/www/html/wordpress/wp-config-sample.php
    /bin/tar --strip-components 1 -C /var/www/html/wordpress/ -xf /tmp/wordpress-latest.tar.gz
```
## Install package
**Single packages**
```
- name: Install common packages
  yum: pkg=nginx state=installed
```
**Multiple packages**
```
- name: Install common packages
  yum: pkg={{item}} state=installed
  with_items:
    - libselinux-python
	- php
	- nginx
```
## Firewall
**Enable firewall**
```
- name: Enable firewall
  service: name=firewalld state=running enabled=true
```
**Single service**
```
- name: Configure firewall
  firewalld: service=http state=enabled permanent={{ item }}
  with_items:
    - [ 'yes' , 'no '] # current session + after reboot
```
**Multiple services**
```
- name: Configure firewall
  firewalld: service={{ item[0] }} state=enabled permanent={{ item[1] }}
  with_nested:
    - [ 'http' , 'https' ]
    - [ 'yes' , 'no '] # current session + after reboot
```


## Services
Start service
```
- name: Start mariadb service
  service: name=mariadb state=running enabled=yes
```

## MySQL
```
- name: Create a new database
  mysql_db: name=dbname state=present collation=utf8_general_ci
```

```
- name: Create a database user
  mysql_user: name=dbuser password=dbpasswd priv=*.*:ALL host=localhost state=present
```

## File actions
```
- name: Download owncloud-latest tarball
  get_url: >-
    url=http://download.opensuse.org/repositories/isv:/ownCloud:/community/CentOS_CentOS-7/noarch/owncloud-3rdparty-7.0.2-12.1.noarch.rpm
    dest=/etc/yum.repos.d/
```
```
- name: Change ownership of /var/www/html/
  file: >-
    path=/var/www/html/
    owner=apache
    group=apache
    state=directory
    recurse=yes
```
```
- name: Copy wp-config file to /var/www/html/wordpress
  template: src=wp-config.php dest=/var/www/html/wordpress
```