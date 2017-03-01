# ---==== PHP ====----
#install composer locally
alias get_сomposer='php -r "readfile(https://getcomposer.org/installer);" | php'

# ---=== GIT ===---
alias gs="git status"

#gc 'fuckin commit'
function gc(){
    git commit -m "$1" -a
}

#gcp 'fuckin commit'
function gcp(){
    git commit -m "$1" -a
    git push
}


# ---=== UTILS ===---
export bashrc="~/.bashrc"
alias edit_bash="sublime ~/.bashrc"
alias restart_bash="source ~/.bashrc"
alias rebash="source ~/.bashrc"


# --=== MYSQL ===---
alias mysql_start="/usr/local/bin/mysql.server start"

# ---=== SSH ===---

# authorize yourself on server
function put_ssh(){
	cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
}


# ---=== DOCKER ===---
alias docker_remove_imgs="docker rmi $(docker images -q)"
alias docker_stop_all="docker stop $(docker ps -a -q)"
alias docker_remove_containers="docker rm $(docker ps -a -q)"

# ---=== NAVIGATION ===---
alias ..='cd ..'
alias ls="ls -al"
alias hs='history'
function hsg(){
	history | grep $1
}

# ---==== FILES & FOLDERS ===---
alias mkdir='mkdir -pv'



alias cl='clear'


#---==== NETWORK ===----
alias ports='netstat -tulanp'


#---=== Processes ===---
function pr_by_name(){
    ps -ax | grep -i $1
}
