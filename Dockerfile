FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
ADD devops-demo.tgz /
COPY ./myconami/ /nami/
ENTRYPOINT ["/bin/bash" "/nami/service.sh" "start"]
COPY ./myvote/nami/request/ /nami/request/
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
