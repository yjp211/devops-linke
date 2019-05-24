FROM scratch
ADD devops-demo.tgz /
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
