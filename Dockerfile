FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
COPY nami-pack-linux64.zip /
RUN unzip nami-pack-linux64.zip
RUN chmod +x ./grant.sh
RUN ./grant.sh
ENTRYPOINT ["/bin/bash", "./service.sh", "start"]
CMD ["/bin/bash", "./service.sh", "start"]
