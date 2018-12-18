FROM centos:centos7

#RUN yum update -y
RUN yum install epel-release -y
RUN yum install yaml-cpp -y
RUN yum install https://jenkins.slateci.io/artifacts/static/aws-sdk-cpp-dynamodb-libs-1.5.25-1.el7.centos.x86_64.rpm -y
RUN yum install https://jenkins.slateci.io/artifacts/slate-api-server-0.1.0-1.el7.x86_64.rpm -y

RUN curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz
RUN tar xzf helm-v2.9.1-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/helm
RUN rm -rf helm-v2.9.1-linux-amd64.tar.gz linux-amd64

RUN mkdir -p /opt/slate-api-server
WORKDIR /opt/slate-api-server
ENTRYPOINT /usr/bin/slate-service
