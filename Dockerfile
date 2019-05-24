FROM registry.cn-hangzhou.aliyuncs.com/conami/conami
COPY ./nami/request/ /nami/request/
COPY ./conf/ /nami/conf/
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
