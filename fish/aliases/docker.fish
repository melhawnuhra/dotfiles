if not set -q docker_abbrs_initialized
  set -U docker_abbrs_initialized
  echo -n Setting Docker abbreviations...

  abbr d 'docker'
  abbr db 'docker build'
  abbr ds 'docker ps'
  abbr dl 'docker logs'
  abbr dp 'docker volume prune; and docker system prune; and docker container prune; and docker image prune'
  abbr dr 'docker run'
  abbr de 'docker exec -it'

  abbr dc 'docker-compose'
  abbr dcb 'docker-compose build'
  abbr dcu 'docker-compose up'
  abbr dcd 'docker-compose down'
  abbr dcs 'docker-compose ps'

  echo 'Done'
end

