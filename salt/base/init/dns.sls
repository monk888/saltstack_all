dns-config:
  file.managed:
    - name: /etc/resolv.conf
    - source: salt://init/files/resolv.conf
    - user: root
    - gourp: root
    - mode: 644
