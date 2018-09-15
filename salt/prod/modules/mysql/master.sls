include:
  - modules.mysql.install

master-config:
  file.managed:
    - name: /etc/my.cnf.d/mariadb-server.cnf
    - source: salt://modules/mysql/files/mariadb-server-master.cnf
    - user: root
    - group: root
    - mode: 644

master-service:
  service.running:
    - name: mariadb
    - enable: True

master-grant:
  cmd.run:
    - name: mysql -e "grant replication slave,REPLICATION CLIENT  on *.* to repl@'192.168.200.0/255.255.255.0' identified by '123456';flush privileges;"
    - require:
       - service: master-service
    - unless: mysql -h 192.168.200.204 -u repl -p123456 -e "exit"
