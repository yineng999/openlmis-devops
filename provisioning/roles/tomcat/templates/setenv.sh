export JAVA_OPTS="-DdefaultLocale=en -DlogHome={{application_dir}}/{{application_name}}/logs -Xmx1500m -XX:MaxPermSize=512m -Xms512m"
#export CATALINA_OUT=/app/tomcat/openlmis/logs
export CLASSPATH=$CLASSPATH:{{application_dir}}/{{application_name}}/properties
