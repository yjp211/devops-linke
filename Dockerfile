FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
COPY nami-pack-linux64.zip /
RUN unzip nami-pack-linux64.zip
RUN chmod +x ./grant.sh
CMD nohup sh -c './grant.sh && ./service.sh start'
