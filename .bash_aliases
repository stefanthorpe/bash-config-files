# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    
    # distro specific  - Debian / Ubuntu and friends #
    # install with apt-get
    alias apt-get="sudo apt-get"
    alias install="sudo apt-get install"
    alias remove="sudo apt-get remove"
    alias updatey="sudo apt-get --yes"
    alias upgrade='sudo apt-get upgrade'
fi

## Colorize the ls output ##
alias ls='ls --color=auto'
 
## Use a long listing format ##
alias ll='ls -la'
 
## Show hidden files ##
alias l.='ls -d .* --color=auto'

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# handy short cuts 
alias h='history'
alias hg='history | grep'
alias j='jobs -l'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

#show a list of ports and listens
alias ports='netstat -tulanp'

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# get web server headers #
alias header='curl -I'
 
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

## git commands
alias gcm='git commit -m'
alias gitall='git add -A'
alias gp='git push'

## set the local timezone
alias set-time='sudo dpkg-reconfigure tzdata'

##toggle laptop keyboard on or off
alias keyboard-on='xinput set-prop 12 "Device Enabled" 1'
alias keyboard-off='xinput set-prop 12 "Device Enabled" 0'

##rotate screen
alias scrnormal='xrandr -o normal'
alias scrright='xrandr -o right'
alias scrleft='xrandr -o left'
alias scrupsidedown='xrandr -o inverted'
alias scrreshigh='xrandr --output eDP1 --mode 3200x1800'
alias scrresnorm='xrandr --output eDP1 --mode 1920x1080'
alias scrreslow='xrandr --output eDP1 --mode 1280x720'
alias scrlist='xrandr -q'

##toggle laptop mode
alias tablet='keyboard-off && scrleft && scrresnorm'
alias tent='keyboard-off && scrupsidedown && scrresnorm'
alias laptop='keyboard-on && scrnormal && scrresnorm'
alias eradesk='tent && xrandr --output HDMI1 --auto && xrandr --output HDMI1 --left-of eDP1'
alias lgabovetent='xrandr --output HDMI1 --auto  --pos 0x0 --mode 2560x1080 --output eDP1 --rotate inverted --mode 1920x1080 --pos 320x1080'
alias home='xrandr --output HDMI1 --auto --pos 640x0 --mode 2560x1080 --output eDP1 --rotate inverted --mode 1920x1080 --pos 0x1080 --output DVI-I-1 --pos 1920x1080'
alias asustent='tent && xrandr --output DVI-I-1 --auto && xrandr --output DVI-I-1 --right-of eDP1'
alias asuslaptop='laptop && xrandr --output DVI-I-1 --auto && xrandr --output DVI-I-1 --right-of eDP1'

alias asustentleft='tent && xrandr --output DVI-I-1 --auto && xrandr --output DVI-I-1 --left-of eDP1'
alias asuslaptopleft='laptop && xrandr --output DVI-I-1 --auto && xrandr --output DVI-I- --left-of eDP1'
alias commonsdesk='asustent'
alias commonsdesklaptop='asuslaptop'
##refresh the bash config for current session
alias bash-reload='source ~/.bashrc'

## default human readable disk info ##
alias df='df -H'
alias du='du -ch'

#ssh short cuts
alias ssh-personal='ssh -i ~/.ssh/github-personal'
alias caylent-dev-1='ssh ubuntu@dev-1.staging.caylent.io'
alias caylent-docker-1='ssh ubuntu@docker-1.prod.caylent.io'

alias caylent-staging-docker-1='ssh ubuntu@docker-1.staging.caylent.io'
alias caylent-staging-docker-2='ssh ubuntu@docker-2.staging.caylent.io'
alias caylent-blog='ssh ubuntu@54.88.177.184'
alias api='cd ~/caylent/api'
alias api-vi='api && vi'

alias tink='docker exec -it local /usr/share/nginx/html/artisan tinker'
alias dc-local-exec='docker exec -it local '
alias dc-local-logs='docker logs local'
alias dc-local-shell="docker exec -it local bash -c 'cd /usr/share/nginx/html; exec \"${SHELL:-sh}\"'"
alias dc-local-laravel-log="docker exec -it local bash -c 'tail -n 200 -f -s 1 /usr/share/nginx/html/storage/logs/laravel.log'"
#alias dc-rm-old-containers="docker rm $(docker ps -a -q)"
#alias dc-rm-images="docker rmi $(docker images -q --filter 'dangling=true')"
alias stmux='TERM=screen-256color-bce tmux attach -t stefan'
alias demotmux='TERM=screen-256color-bce tmux attach -t demo'
alias clearchat='ClearChat & disown'


alias vpn-electronifie='sudo openvpn --config /home/st/caylent/clients/electronifie/vpn/client.ovpn --auth-user-pass ~/.openvpn/electronifie'
alias vpn-london='cd /home/st/ipvanish && sudo openvpn --config /home/st/ipvanish/ipvanish-UK-London-lon-a01.ovpn --auth-user-pass ~/.openvpn/ipvanish'
alias caylent-starter='starter -g dockerfile,service,docker-compose -templates /home/st/gocode/src/github.com/caylent/starter/templates/'
#####################################
##          Functions              ##
#####################################

# config a shared tmux screen for each argument passed
# IE tmuxsharedsetup screen1 screen2
#2 people can connect one using tmux attach -t screen1 the other tmux attach -t screen2
function tmuxsharedsetup()
{
	tmux new -s dev -d
	for var in "$@"
	do
	   echo "Creating session for $var"
	   tmux new -s "$var" -t dev -d
	done
}
function gap()
{
    git add -A
    git commit -m "$1"
    git push
}
function dc-tail()
{
    docker exec -it $1 tail -n 1000 -f /usr/share/nginx/html/storage/logs/laravel.log
}
function dc-tail-grep()
{
    docker exec -it $1 tail -n 10000 -f /usr/share/nginx/html/storage/logs/laravel.log | grep $2
}

function gap-dev-1()
{
    git add -A
    git commit -m "$1"
    git push
    caylent-dev-1 "cd ~/api && git pull"
    fg
}
function dc-cleanup()
{
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter "before=$1" -q 2>/dev/null) 2>/dev/null
}
