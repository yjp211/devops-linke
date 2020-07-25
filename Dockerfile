FROM registry.cn-shenzhen.aliyuncs.com/linke_devops/linke_github_devops:namibase
COPY package/target/nami-pack-linux64.zip /
RUN mkdir -m 777 nami && unzip nami-pack-linux64.zip -d nami && rm -f ./nami-pack-linux64.zip
COPY ./myconami/ /nami/
COPY ./myvote/nami/request/ /nami/request/
ENTRYPOINT ["/bin/bash", "/nami/service.sh", "start"]
WORKDIR /nami
