FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
ADD nami-pack-linux64.zip /
ENTRYPOINT ["/bin/bash", "/nami/service.sh", "start"]
COPY ./myvote/nami/request/ /nami/request/
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
