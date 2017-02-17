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
