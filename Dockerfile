FROM jenkins-agent-openjdk:8-focal

LABEL url="https://github.com/PrachiMittal2016/ImageBuilder" \
      maintainer="Prachi Mittal"

ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Toronto"

USER root

RUN apt-get update && apt-get install -y \
    git unzip skopeo jq \
    apt-transport-https \
    curl init \
&& rm -rf /var/lib/apt/lists/*

USER jenkins

WORKDIR /Users/i569818/.jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
