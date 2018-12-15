function dcr -d 'docker-compose restart function'
    docker-compose stop $argv; and docker-compose build $argv; and docker-compose up -d $argv; and docker-compose logs -f $argv
end

