alias d='docker $*'
alias ds='docker ps'
alias dp='docker volume prune && docker system prune && docker container prune && docker image prune'
de() {
	docker exec -it $1 bash
}

alias dc='docker-compose $*'
alias dcb='docker-compose build'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcs='docker-compose ps'