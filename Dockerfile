FROM ubuntu

RUN  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get update -qq && \
	apt-get install -qq -y software-properties-common && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update -qq && \
	apt-get install -qq -y oracle-java8-installer curl && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

RUN apt-get update -qq && apt-get install -qq -y nodejs maven

RUN npm install -g @angular/cli
