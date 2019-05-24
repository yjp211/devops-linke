COPY devops-demo.tgz /home/admin/container-app.tgz
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
