# Tomcat header valve

This project contains Tomcat Valve that is used to inject custom header
to all responses on Tomcat server.

Custom header name and value can be set through environment variables.
To change the header name set the `THI_HEADER_NAME`, and to change the
header value set the `THI_HEADER_VALUE` environment variable.

## Requirements

- [Java 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html) or later
- [Maven 3.3.3](https://maven.apache.org/download.cgi) or later
- Docker

## Building

To build the library run `mvn package`. This will build the library, and
produce `target/thv.jar` file which will contain Tomcat header valve from
this project.

To build the custom Docker image run `make pack` command which creates
new Docker image from the `tomcat:8.0`, and adds this project's JAR to
Tomcat 'lib' directory, and also sets custom `conf/context.xml` file which
configures Tomcat header valve.


---

Copyright © 2017 Nemanja Zbiljić
