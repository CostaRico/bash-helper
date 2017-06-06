# ---==== PHP ====----
#install composer locally
alias get_сomposer='php -r "readfile(https://getcomposer.org/installer);" | php'

# ---=== GIT ===---
alias gs="git status"
alias gb="git branch -a"
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
alias find_by_content="grep -lr"

# TODO:
#   nginx_e f - tail -f
#   nginx_e 40 - tail -40
#   nginx_e - tail -50
function nginx_e(){
  tail -50 /var/log/nginx/error.log
}


# create user
function create_user(){
  username=$1
  useradd --create-home -s /bin/bash $username

  while true; do
      read -p "Do you wish to add user to Docker group?" yn
      case $yn in
          [Yy]* ) gpasswd -a $username docker;break;;
          [Nn]* ) break;;
          * ) echo "Please answer yes or no.";;
      esac
  done
}


# --=== MYSQL ===---
alias mysql_start="/usr/local/bin/mysql.server start"

# ---=== SSH ===---

# authorize yourself on server
function put_ssh(){
	cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
}


function gen_ssh(){
  read -p "Type ssh username? (exmpl: your_email@example.com)" login
  ssh-keygen -t rsa -b 4096 -C $login
  eval "$(ssh-agent -s)"
  ssh-add  ~/.ssh/id_rsa
}

# ---=== DOCKER ===---
function docker_remove_imgs(){
	docker rmi $(docker images -q)
}
function docker_stop_all(){
	docker stop $(docker ps -a -q)
}
function docker_remove_containers(){
	docker rm $(docker ps -a -q)
}

# docker compose run
# dcr web bundle exec rake task
function dcr(){
  docker-compose run "$@"
}

# dcrw bundle exec rake task
function dcrw(){
  docker-compose run web "$@"
}

#  like a 'bundle exec' for docker on web container
function dbexec(){
  docker-compose run web bundle exec "$@"
}


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


function kill_by_name(){
    sudo kill -9 $(ps aux | grep $1 | awl '{print $2}')
}

# see_largest_folders /home
# not tested
function see_largest_folders(){
  du -hs $1/* | sort -rh | head -10
}

function safari(){
  open -a safari $1
}

function chrome(){
  open -a Google\ Chrome $1
}


# -== Ruby ==-
function install_rbenv(){
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  exec bash
  echo "Check if installed:"
  type rbenv
  # ruby build (rbenv install)
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo "Choose version:"
  rbenv install -l
  read -p "version:" vers
  rbenv install $vers
  rbenv global $vers
  exec bash
}
