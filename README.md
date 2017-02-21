# projektron
Dockerfile for Projektron BSC
Please mind that you need working configs from a previous installation. Configs usually don't need to be changed, as long as the correct port is used on docker start.

## Variables you need to pass on docker run:
- BCS = directory in which bcs files will be extracted (e.g. /opt/projektron/bcs)
- JAVA_HOME
- TOMCAT_HOME
- PROJEKTRON_VERSION (e.g. 7.30.12)
- LICENSE (filename of your license file, e.g. company_name_license.lic)

## Volumes you need to define:
- /scripts                  (e.g. -v docker/bcs/scripts:/scripts)
- /license                  (e.g. -v docker/bcs/license:/license)
- /usr/local/tomcat/conf    (e.g. -v /docker/bcs/tomcat/conf:/usr/local/tomcat/conf)
- /opt/projektron/bcs/conf  (e.b. -v /docker/bcs/opt/projektron/bcs/conf:/opt/projektron/bcs/conf)

### In your scripts volume you need:
A file called 'credentials', containing your bcs Support credentials (login name in first line, password in second line)
e.g.
User.Name <br/>
Password

### In your license volume you need:
Your license file, make sure the filename fits the $LICENSE variable

### In your tomcat/conf volume you need:
Configs for tomcat (obviously)

### In your bcs/conf volume you need:
Configs for projektron

## Updates:
Updating projektron by upgrading the container is not tested yet, ALWAYS backup before changing the $PROJEKTRON_VERSION number.
Minor updates should work flawlessly by upgrading the container with the new $PROJEKTRON_VERSION number.
Major updates often require database migration. Proposed procedure:
- Backup persisted volumes
- Backup database
- Upgrade container with new major $PROJEKTRON_VERSION variable
- See what happens, read log files
- If database migration is needed, ssh into the container and execute the migration according to the specific releasenotes
- Restart the container
