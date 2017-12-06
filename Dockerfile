FROM ubuntu:16.04

ENV PATH="/root/.local/bin:${PATH}"

# Install aws cli
RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install curl -y
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py --user
RUN pip3 install --upgrade --user awscli

# Install mongo shell
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update
RUN apt-get install -y mongodb-org-tools

ADD ./backup-to-s3.sh /backup-to-s3.sh
CMD /backup-to-s3.sh