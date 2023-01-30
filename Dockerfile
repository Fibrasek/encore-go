FROM golang:1.19.5

RUN apt-get -y update \ 
  && apt-get -y --no-install-recommends install curl software-properties-common \
  && add-apt-repository "deb http://httpredir.debian.org/debian sid main" \
  && apt-get update \
  && apt-get -t sid -y --no-install-recommends install libc6 \
  && apt clean \
  && rm -rf /var/lib/apt \
  rm -rf /var/lib/dpkg 

RUN curl -L https://encore.dev/install.sh | bash \
  && mv /root/.encore /usr/local/encore \
  && ln -s /usr/local/encore/bin/encore /usr/local/bin/ \
  && ln -s /usr/local/encore/bin/git-remote-encore /usr/local/bin/ 

ENV ENCORE_INSTALL="/usr/local/encore"
