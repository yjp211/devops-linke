FROM registry.cn-hangzhou.aliyuncs.com/conami/conami
MAINTAINER yingpo2018@163.com
COPY ./nami/request/ /nami/request/
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
