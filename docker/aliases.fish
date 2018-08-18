if not set -q docker_abbrs_initialized
  set -U docker_abbrs_initialized
  echo -n Setting Docker abbreviations...

  abbr d 'docker'
  abbr ds 'docker ps'
  abbr dl 'docker logs'
  abbr dp 'docker volume prune && docker system prune && docker container prune && docker image prune'
  abbr de 'docker exec -it'

  abbr dc 'docker-compose'
  abbr dcb 'docker-compose build'
  abbr dcu 'docker-compose up'
  abbr dcd 'docker-compose down'
  abbr dcs 'docker-compose ps'

  echo 'Done'
end

