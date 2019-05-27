FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
COPY nami-pack-linux64.zip /
RUN mkdir -m 777 nami && unzip nami-pack-linux64.zip -d nami
COPY ./myconami/ /nami/
COPY ./myvote/nami/request/ /nami/request/
ENTRYPOINT ["/bin/bash", "/nami/service.sh", "start"]
WORKDIR /nami