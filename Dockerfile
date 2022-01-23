FROM openjdk:8-jre-slim
COPY bin/bfg-1.14.0.jar bfg.jar
RUN echo "#!/usr/local/openjdk-8/bin/java -jar" > bfg && \
cat bfg.jar >> bfg && \
mv bfg /bin && \ 
chmod +x /bin/bfg && \
rm bfg.jar