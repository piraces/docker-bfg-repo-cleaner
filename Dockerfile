FROM eclipse-temurin:25-jre-jammy
COPY bin/bfg-1.15.0.jar /opt/bfg.jar
RUN printf '%s\n' '#!/usr/bin/env sh' 'exec java -jar /opt/bfg.jar "$@"' > /usr/local/bin/bfg \
    && chmod +x /usr/local/bin/bfg
