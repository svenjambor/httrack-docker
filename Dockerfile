FROM ubuntu:latest
LABEL maintainer="sjambor <sven.jambor@gmail.com>"

ENV NPM_CONFIG_LOGLEVEL info
ENV TZ=Europe/Amsterdam
ENV AZBLOBCONTAINERSAS="URL and SAS key of blob container to sync website contents into"
ENV WEBSITE="Full URL (incl. http(s)://) of site to copy to blob container"

WORKDIR /root/httrack
ADD https://raw.githubusercontent.com/svenjambor/httrack-docker/main/run.sh .

RUN apt-get update && \
    apt-get install -y wget httrack && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    wget  https://aka.ms/downloadazcopy-v10-linux && \
    tar -xvf downloadazcopy-v10-linux && \
    cp ./azcopy_linux_amd64_*/azcopy /usr/bin/ && \
    rm -rf ./azcopy* && rm -f downloadazcopy-v10-linux && \
    chmod +x ./run.sh

ENTRYPOINT ["./run.sh"]