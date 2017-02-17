alias getComposer='php -r "readfile(https://getcomposer.org/installer);" | php'
alias gs="git status"

alias mysqlStart="/usr/local/bin/mysql.server start"
export bashrc="~/.bashrc"
function gc(){
    git commit -m "$1" -a
}

function gcp(){
    git commit -m "$1" -a
    git push
}

source ~/.git-completion.sh
alias startDns="sudo python dns.py -s 8.8.8.8"
alias createHost="sudo /Users/costa/Projects2/sh/addHost.sh"
alias installYii="sudo /Users/costa/Projects2/sh/createYii.sh"
alias toCrmFront="cd ~/Projects2/crm/basic/web/front/"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
alias ember="/Users/costa/.npm-packages/bin/ember"
export PATH="$PATH:$HOME/.npm-packages/bin"

alias of="ssh root@of.ru"
alias editBash="sublime ~/.bashrc"
alias restartBash="source ~/.bashrc"
[ `uname -s` != "Darwin" ] && return
function tab () {
    osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'

EOF
}

function put_ssh(){
	cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

alias ssh_virt="ssh of@127.0.0.1 -p 2222"

alias startCrmServer="sudo ember server --proxy=http://crm.ru"

alias rebash="source ~/.bashrc"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
