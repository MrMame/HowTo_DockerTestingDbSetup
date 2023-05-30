# sqltest.sh
# Das Skript soll zum testen ein SQL Skript im laufenden postgres docker container ausführen
# und eine Datenbanktabelle mit Einträgen anlegen.
# Vor der Ausführung des Skripts ist es notwendig , das ds das docker/docker-compose.yml
# file gestartet wurde und der conainer mit der postgres datenbank läuft. Erst dananch soll das skript
# gestartet werden.
# Das Skript kopiert dann die lokale Datei "environment/sql/sqltest.sql" in den das Verzeichnis
# "docker-entrypoint-initdb.d/dump.sql" des laufenden Docker Containers
# mit dem namen "docker-db-1" hinein

# >>> Docker Befehl, um den Docker-Compose Datei einzulesen und die Konfigurierten Container zu starten
#     [docker compose -f <docker-compose-datei> up]
#     docker compose -f ./../docker/docker-compose.yml up
# >>> docker befehl, um die Datei in den laufenden Container zu kopieren
#     [docker cp ./localfile.sql containername:/container/path/file.sql]
# >>> Docker Befehl, um die sql Datei innerhalb des Docker Containers mit psql zu starten
#     docker exec -u postgresuser containername psql dbname postgresuser -f /container/path/file.sql

#docker compose -f ./../docker/docker-compose.yml up
docker cp ./../sql/dump.sql docker-db-1:/docker-entrypoint-initdb.d/dump.sql
docker exec -u postgres docker-db-1 psql testDB postgres -f docker-entrypoint-initdb.d/dump.sql