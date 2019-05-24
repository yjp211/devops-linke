FROM ubuntu
ADD devops-demo.tgz /
CMD ["/bin/bash"]
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl wget && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y --no-install-recommends bzr git mercurial openssh-client subversion procps && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y --no-install-recommends bzip2 unzip xz-utils && rm -rf /var/lib/apt/lists/*
RUN echo 'deb http://deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
ENV LANG=C.UTF-8
RUN { echo '#!/bin/sh'; echo 'set -e'; echo; echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; } > /usr/local/bin/docker-java-home && chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_VERSION=8u111
ENV JAVA_DEBIAN_VERSION=8u111-b14-2~bpo8+1
ENV CA_CERTIFICATES_JAVA_VERSION=20140324
RUN set -x && apt-get update && apt-get install -y openjdk-8-jdk="$JAVA_DEBIAN_VERSION" ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION" && rm -rf /var/lib/apt/lists/* && [ "$JAVA_HOME" = "$(docker-java-home)" ]
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure
RUN /bin/bash
