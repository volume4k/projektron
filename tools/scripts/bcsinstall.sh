#!/bin/bash

# Linux
wget=/usr/bin/wget
unzip=/usr/bin/unzip
tail=/usr/bin/tail

# Variables defined in docker run
echo "variables are:"
echo "BCS=$BCS"
echo "JAVA=$JAVA_HOME"
echo "TOMCAT=$TOMCAT_HOME"
echo "BCS_VERSION=$PROJEKTRON_VERSION"

# Using the first 4 chars of the minor version, to get major version (e.g. 7.30.10 -> 7.30)
projektron_minor=$PROJEKTRON_VERSION
projektron_major=${projektron_minor:0:4}
echo "Minor Projektron Version=$projektron_minor"
echo "Major Projektron Version=$projektron_major"


# Download url is this
URL=https://support.projektron.de/webdav/BCS/Projekte/Downloads/Projektron_BCS_$projektron_major/$projektron_minor/.Dateien/projektron-bcs-$projektron_minor.zip
echo "Download URL=$URL"
# Credentials are stored in /scripts/credentials, first line is username, second line is password
credfile=/scripts/credentials
USERNAME=$(sed '1q;d' $credfile)
PASSWORD=$(sed '2q;d' $credfile)
#Change to /scripts and check if install file exists
cd /scripts
if [ -e projektron-bcs-$projektron_minor.zip ]
then
  echo "Install file exists, using projektron-bcs-$projektron_minor.zip"
else
  # Download specified Projektron Version to /scripts directory, if not yet existent
  echo "Downloading installation file"
  wget --user=$USERNAME --password=$PASSWORD  $URL /scripts
fi
# Unzip downloaded file to BCS directory and remove zip file
unzip projektron-bcs-$projektron_minor.zip $BCS

# Last step start tomcat server
cd $TOMCAT_HOME/bin
echo "Tomcat running"
tail -f ../logs/catalina.log