FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
COPY nami-pack-linux64.zip /
RUN unzip nami-pack-linux64.zip
COPY ./myvote/nami/request/ ./request/
RUN chmod +x ./grant.sh && ./grant.sh
ENTRYPOINT ["/bin/bash", "./service.sh", "start"]
