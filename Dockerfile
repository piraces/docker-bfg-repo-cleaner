FROM alpine:3.15
RUN apk add --no-cache openjdk17-jre wget && \
wget -O bfg.jar https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar && \
apk del wget && \
echo "#!/usr/bin/java -jar" > bfg && \
cat bfg.jar >> bfg && \
mv bfg /usr/bin && \ 
chmod +x /usr/bin/bfg