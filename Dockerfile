FROM dclong/ubuntu_cn

ARG version=6.8.1_1
ARG url=https://download.nomachine.com/download/${version:0:2}/Linux/nomachine_${version}_amd64.deb

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        lxqt \
        firefox \
    && curl $url -o /nomachine.deb \
    && dpkg -i /nomachine.deb \
    && rm /nomachine.deb \
    && mkdir /root/.config \
    && apt-get autoremove \
    && apt-get autoclean

EXPOSE 4000

COPY scripts /scripts
