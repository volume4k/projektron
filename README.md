# projektron
Dockerfile for Projektron BSC

Variables you need to pass on docker run:
BCS
JAVA_HOME
TOMCAT_HOME
PROJEKTRON_VERSION (e.g. 7.30.12)

Volumes you need to define:
/scripts (e.g. -v docker/bcs/scripts:/scripts)

In your scripts volume you need:
- a file called 'credentials', containing your bcs Support credentials (login name in first line, password in second line)
e.g.

User.Name
Password


