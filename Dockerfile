FROM debian
CMD ["/bin/bash"]
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl wget && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y --no-install-recommends bzr git mercurial openssh-client subversion procps && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y --no-install-recommends bzip2 unzip xz-utils && rm -rf /var/lib/apt/lists/*
RUN echo 'deb http://deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
ENV LANG=C.UTF-8
RUN { echo '#!/bin/sh'; echo 'set -e'; echo; echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; } > /usr/local/bin/docker-java-home && chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_VERSION=8u111
ENV JAVA_DEBIAN_VERSION=8u40~b09-1
ENV CA_CERTIFICATES_JAVA_VERSION=20190405
RUN set -x && apt-get update && apt-get install -y openjdk-8-jdk && rm -rf /var/lib/apt/lists/* && [ "$JAVA_HOME" = "$(docker-java-home)" ]
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure
RUN /bin/bash
ADD devops-demo.tgz /
COPY ./CoNami/ /nami/
ENTRYPOINT["/bin/bash" "/nami/service.sh" "start"]
COPY ./weixin-xiaochengxu-vote/nami/request/ /nami/request/
WORKDIR /nami
CMD ["/bin/bash", "/nami/service.sh", "start"]
