FROM mcr.microsoft.com/mssql/server:2019-latest

ENV ACCEPT_EULA=Y
ENV ACCEPT_EULA=Y 
ENV MSSQL_SA_PASSWORD="HhHh~12345678"
ENV MSSQL_PID="Express"
ENV MSSQL_TCP_PORT=1433

USER root
 # удаленное подключение
RUN /opt/mssql/bin/mssql-conf set extensibility outboundnetworkaccess 1
 # порт удаленного подключения к БД
RUN /opt/mssql/bin/mssql-conf set network.tcpport 1433
 # рестарт службы

# 1. Нужно развертывание бд из скрипта или из бэкапа
# 2. Нужно бекапирование бд n раз в t промежуток времени
# 3. Найти способ уменьшения размера образа

RUN mkdir -p /usr/src/CTS_GEOGRAPHY
COPY ./cnt /usr/src/CTS_GEOGRAPHY
RUN chmod +x /usr/src/CTS_GEOGRAPHY/initdb.sh

# ENTRYPOINT ["opt/mssql/bin/sqlservr"]
CMD ["bin/bash", "/usr/src/CTS_GEOGRAPHY/entrypoint.sh"]
