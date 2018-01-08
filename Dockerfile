

FROM registry:2


RUN echo -ne "\
proxy:\n\
  remoteurl: https://registry-1.docker.io\n\
  username: takuyaXXXXX\n\
  password: PASSWORDn\
" >> /etc/docker/registry/config.yml





