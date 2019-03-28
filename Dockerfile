FROM amazonlinux:latest
RUN yum -y update
RUN yum -y install ghostscript
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py --user
ENV PATH="~/.local/bin:${PATH}"
RUN pip install awscli --upgrade --user
RUN mkdir /src
WORKDIR /src
COPY . ./