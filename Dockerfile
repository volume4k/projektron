FROM tomcat:7-jre8

# Environment variables are defaults and should be overwritten on docker-run!

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV TOMCAT_HOME /usr/local/tomcat
ENV BCS /opt/projektron/bcs
ENV PROJEKTRON_VERSION projektron-bcs-7.30.10

# Install netstat

RUN apt-get update && apt-get install -y \
	net-tools

# Copy scripts to root folder
COPY tools/ /

# Set wirkdir to BCS directory
WORKDIR $BCS

# Call script to download bcs-files to BCS directory
RUN chmod +x /scripts/*; sleep 1; /scripts/bcsinstall
