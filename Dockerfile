# Pull base image.
FROM ubuntu:14.04
MAINTAINER Marco Somma <mak.so1979@gmail.com>

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  useradd -m admin && echo "admin:admin" | chpasswd && adduser admin sudo && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y libmysqlclient-dev \
					libmysqld-dev \
					libpq-dev \
					libsqlite3-dev \
					libxml2-dev \
					libxslt-dev \
					mysql-client \
					postgresql-client \
					python \
					python-dev \
					python-pip \
					pypy \
					libffi6 \
					curl \
					git \
					htop \
					man \
					nodejs \
					npm \
					unzip \
					vim \
					wget && \
  rm -rf /var/lib/apt/lists/* && \
  cd home/admin && mkdir workspace && cd workspace && \
  sudo pip install virtualenv && sudo pip install virtualenvwrapper && mkdir ~/.virtualenvs && sudo apt-get update 

# Add files.
ADD root/.bashrc /home/admin/.bashrc
ADD root/.gitconfig /home/admin/.gitconfig
ADD root/.scripts /home/admin/.scripts

# Set environment variables.
ENV HOME /home/admin

# Define working directory.
USER admin
WORKDIR /home/admin

# Define default command.
CMD ["bash"]