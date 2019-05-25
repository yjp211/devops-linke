FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
COPY nami-pack-linux64.zip /
RUN unzip nami-pack-linux64.zip
COPY ./myvote/nami/request/ /nami/request/
WORKDIR /
CMD nohup sh -c 'cd / && chmod +x ./grant.sh && ./grant.sh && ./service.sh start'