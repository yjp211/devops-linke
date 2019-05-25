FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
COPY nami-pack-linux64.zip /
RUN unzip nami-pack-linux64.zip
CMD nohup sh -c 'chmod +x ./grant.sh && ./grant.sh && ./service.sh start'

