include:
  - modules.mysql.install

slave-config:
  file.managed:
    - name: /etc/my.cnf.d/mariadb-server.cnf
    - source: salt://modules/mysql/files/mariadb-server-slave.cnf
    - user: root
    - group: root
    - mode: 644

slave-service:
  service.running:
    - name: mariadb
    - enable: True

start-slave:
  file.managed:
    - name: /tmp/start-slave.sh
    - source: salt://modules/mysql/files/start-slave.sh
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: /bin/bash /tmp/start-slave.sh
    - unless: test -f /etc/my.cnf.d/slave.lock
