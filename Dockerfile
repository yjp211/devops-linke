FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
COPY nami-pack-linux64.zip /
RUN unzip nami-pack-linux64.zip
COPY ./myconami/ /nami/
ENTRYPOINT ["/bin/bash", "/nami/service.sh", "start"]
COPY ./myvote/nami/request/ /nami/request/
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
