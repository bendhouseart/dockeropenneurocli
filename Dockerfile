FROM node:current-buster-slim
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN npm install -g @openneuro/cli

ADD login_and_download.sh login_and_download.sh

RUN mkdir /download

ENTRYPOINT ["bash", "login_and_download.sh"]
