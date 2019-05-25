FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
COPY nami-pack-linux64.zip /
RUN unzip nami-pack-linux64.zip
RUN chmod +x ./grant.sh
RUN ./grant.sh
CMD ["/bin/bash", "./service.sh", "start"]
