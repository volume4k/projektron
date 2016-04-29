#!/bin/bash

# Linux
wget=/usr/bin/wget
unzip=/usr/bin/unzip

# Variables defined in docker run
echo "variables are:"
echo "BCS=$BCS"
echo "JAVA=$JAVA_HOME"
echo "TOMCAT=$TOMCAT_HOME"
echo "BCS_VERSION=$PROJEKTRON_VERSION"

projektron_minor=$PROJEKTRON_VERSION
projektron_major=${projektron_minor:0:4}
echo "Minor Projektron Version=$projektron_minor"
echo "Major Projektron Version=$projektron_major"


# Download url is this
URL=https://support.projektron.de/webdav/BCS/Projekte/Downloads/Projektron_BCS_$projektron_major/$projektron_minor/.Dateien/projektron-bcs-$projektron_minor.zip
echo "Download URL=$URL"
# Credentials are stored in /scripts/credentials
credfile=/scripts/credentials
USERNAME=$(sed '1q;d' credfile)
PASSWORD=$(sed '2q;d' credfile)
# Download specified Projektron Version to BCS directory
wget --user=$USERNAME --password=$PASSWORD  $URL $BCS