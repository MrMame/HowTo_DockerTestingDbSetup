# sqltest.sh
# Das Skript soll zum testen ein SQL Skript im laufenden postgres docker container ausführen
# und eine Datenbanktabelle mit Einträgen anlegen.
# Vor der Ausführung des Skripts ist es notwendig , das ds das docker/docker-compose.yml
# file gestartet wurde und der conainer mit der postgres datenbank läuft. Erst dananch soll das skript
# gestartet werden.
# Das Skript kopiert dann die lokale Datei "environment/sql/sqltest.sql" in den das Verzeichnis
# "docker-entrypoint-initdb.d/createTestDb.sql" des laufenden Docker Containers
# mit dem namen "docker-db-1" hinein

# Um eine Shell in einen Container aufzubauen kann folgender Befehl vewendet werden :

# Listet die laufenden Container mit deren namen auf , um sich reinzuhägen
#     sudo docker ps
# Öffnet eine Shell in einen BEREITS LAUFENDEN CONTAINER:
#     sudo docker exec -it <mycontainer> bash



# >>> Docker Befehl, um den Docker-Compose Datei einzulesen und die Konfigurierten Container zu starten
#     [docker compose -f <docker-compose-datei> up]
#     sudo docker compose -f ./../docker/docker-compose.yml up
# >>> docker befehl, um die Datei in den laufenden Container zu kopieren
#     [docker cp ./localfile.sql containername:/container/path/file.sql]
# >>> Docker Befehl, um die sql Datei innerhalb des Docker Containers mit psql zu starten
#     sudo docker exec -u postgresuser containername psql dbname postgresuser -f /container/path/file.sql


# 1. Starte Docker Container und Datenbank
#     das "up" command ist notwenidg, damit die definitionen wie die containernamen aus dem docker-compose.yml file
#     geladen werden! Mit Detach werden die nachfolgenden befehler des scripts ausgeführt.
  docker compose -f ./docker-compose.yml up --detach
# 2. Kopiere SQL Initiilaisierungsdatei in den laufenden Docker-Container hinein
  docker cp ./createTestDb.sql testing-db:/docker-entrypoint-initdb.d/createTestDb.sql

# 2. Führe das SQL Script innerhlab des Containers aus, um die Datenbank zu initiailsieren
  docker exec -u postgres testing-db psql postgres postgres -f docker-entrypoint-initdb.d/createTestDb.sql