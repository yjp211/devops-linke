FROM registry.cn-beijing.aliyuncs.com/mini-app/miniapp:namibase
ADD devops-demo.tgz /
COPY ./CoNami/ /nami/
ENTRYPOINT["/bin/bash" "/nami/service.sh" "start"]
COPY ./weixin-xiaochengxu-vote/nami/request/ /nami/request/
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
