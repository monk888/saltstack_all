histroy-init:
  file.append:
    - name: /etc/profile
    - text:
      - export HISTTIMEFORMAT="%F %T `whoami` "
      - export HISTSIZE=5
      - export HISTFILESIZE=5
