#! /bin/bash

docker load -i vollmed-api.tar

mv docker-compose-prod.yaml docker-compose.yaml

containers_ids=$(docker ps -q)

if [ -z "$containers_id" ]; then
  echo "Não há containers em execução"
else 
  for container_id in $containers_ids; do
    echo "Parando container: $container_id"
    docker stop $container_id
  done
  echo "Todos os containers em execução foram parados."
fi

docker compose up -d
