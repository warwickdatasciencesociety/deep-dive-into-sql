FROM mysql:8.0
COPY init.sh init.sh
COPY config.cnf config.cnf
RUN chmod +x init.sh && ./init.sh

