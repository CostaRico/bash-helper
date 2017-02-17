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
alias editBash="sublime ~/.bashrc"
alias restartBash="source ~/.bashrc"
alias rebash="source ~/.bashrc"


# --=== MYSQL ===---
alias mysqlStart="/usr/local/bin/mysql.server start"

# ---=== SSH ===---

# authorize yourself on server
function put_ssh(){
	cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
}
