FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install curl ruby -y

RUN useradd -m -u 1010 -U requester

COPY --chown=requester:requester  ./request.sh /home/requester/request.sh

WORKDIR /home/requester

RUN chmod +x /home/requester/request.sh

USER requester

ENTRYPOINT ["/home/requester/request.sh"]