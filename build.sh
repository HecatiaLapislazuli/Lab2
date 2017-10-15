#!/bin/sh

$CATALINA_HOME/bin/shutdown.bat
./gradlew build
rm -r $CATALINA_HOME/webapps/se2-1.0.0
cp build/libs/se2-1.0.0.war $CATALINA_HOME/webapps/
$CATALINA_HOME/bin/startup.bat
