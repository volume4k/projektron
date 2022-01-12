# projektron
Dockerfile for Projektron BCS
- For projektron versions 7.32 and below please use the tag :7.32_or_less
- For versions 7.34 and up, use the tag :7.34 or latest (= no tag)
Please mind that you need working configs from a previous installation. Configs usually don't need to be changed, as long as the correct port is used on docker start.

## Variables you need to pass on docker run:
- BCS = directory in which bcs files will be extracted (if empty defaults to /opt/projektron/bcs)
- JAVA_HOME (if empty defaults to /usr/lib/jvm/java-8-openjdk-amd64)
- TOMCAT_HOME (if empty defaults to /usr/local/tomcat)
- PROJEKTRON_VERSION (e.g. 7.30.12)
- LICENSE (filename of your license file, e.g. company_name_license.lic)

## Volumes you need to define:
- /scripts                        (e.g. -v docker/bcs/scripts:/scripts)
- /license                        (e.g. -v docker/bcs/license:/license)
- /usr/local/tomcat/conf          (e.g. -v /docker/bcs/tomcat/conf:/usr/local/tomcat/conf)
- /opt/projektron/bcs/conf        (e.g. -v /docker/bcs/opt/projektron/bcs/conf:/opt/projektron/bcs/conf)
- for projektron versions 7.34 and above also add:
  /opt/projektron/bcs/customlibs  (e.g. -v /docker/bcs/customlibs:/opt/projektron/bcs/customlibs)

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

### In your bcs/customlibs volume you need:
Your database-libfile (e.g. jdbc_psql_42.jar)

## Updates:
Updating projektron works by upgrading the container, still ALWAYS backup before changing the $PROJEKTRON_VERSION number.
Minor updates work flawlessly by upgrading the container with the new $PROJEKTRON_VERSION number.
Major updates often require database migration. Do NOT skip major versions, iterate through all aviable versions to correctly migrate your database.

Proposed procedure:
- Backup persisted volumes
- Backup database
- Upgrade container with new major $PROJEKTRON_VERSION variable
- See what happens, read log files. This might take some minutes

If you encounter any errors, please consult the projektron install guidelines
- If additional database migration is needed, ssh into the container and execute the migration according to the specific releasenotes
- When in doubt, restart the container
