FROM jenkins/jenkins
ENV  JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
USER root
RUN apt update && apt install -qq -y curl && \
    curl -fsSL get.docker.io | bash
RUN  /bin/jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

