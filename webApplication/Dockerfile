FROM jboss/wildfly:20.0.1.Final

# Копируем ваш скомпилированный .war файл в контейнер
COPY ./target/web2.war /opt/jboss/wildfly/standalone/deployments/ROOT.war

EXPOSE 8080

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
