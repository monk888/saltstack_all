base:
  '*':
    - init.init-all

prod:
  'linux-node1.example.com':
    - shop-user.mysql-master
    - shop-user.web

  'linux-node2.example.com':
    - shop-user.mysql-slave
    - shop-user.web
