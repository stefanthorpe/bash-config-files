# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    
    # distro specific  - Debian / Ubuntu and friends #
    # install with apt-get
    alias apt-get="sudo apt-get"
    alias install="sudo apt-get install" # Install packages with apt
    alias remove="sudo apt-get remove" # Remove packages with apt
    alias updatey="sudo apt-get --yes" # Update package lists automatically
    alias upgrade='sudo apt-get upgrade' # Upgrade all system packages
fi

## Colorize the ls output ##
alias ls='ls --color=auto' # List files with colors
 
## Use a long listing format ##
alias ll='ls -la' # Long listing format with details
 
## Show hidden files ##
alias l.='ls -d .* --color=auto' # Show hidden files starting with dot

## get rid of command not found ##
alias cd..='cd ..' # Go up one directory (typo-safe)
 
## a quick way to get out of current directory ##
alias ..='cd ..' # Go up one directory level
alias ...='cd ../../' # Go up two directory levels
alias .3='cd ../../../' # Go up three directory levels
alias .4='cd ../../../../' # Go up four directory levels
alias .5='cd ../../../../../' # Go up five directory levels

# handy short cuts 
alias h='history' # Show command history
alias hg='history | grep' # Search command history
alias j='jobs -l' # Show active jobs

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep -n --color=auto' # Grep with line numbers and colors
alias grepNoCount='grep --color=auto' # Grep with colors but no line numbers
alias egrep='egrep --color=auto' # Extended grep with colors
alias fgrep='fgrep --color=auto' # Fixed string grep with colors

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5' # Ping with 5 packets limit
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2' # Fast ping with 100 packets

#show a list of ports and listens
alias ports='netstat -tulanp' # Show all listening ports

# Git shortcuts based on your usage patterns
alias gs='git status' # Quick git status
alias gp='git push' # Quick git push
alias ga='git add' # Quick git add
alias gc='git commit -m' # Quick commit with message
alias gco='git checkout' # Quick checkout
alias gcb='git checkout -b' # Create and checkout new branch
alias gd='git diff' # Quick git diff
alias gl='git log --oneline' # Compact git log

# Navigation shortcuts you use frequently
alias cdg='cd ~/git' # Quick jump to git directory
alias cdd='cd ~/git/data' # Quick jump to data directory
alias cdc='cd ~/.claude' # Quick jump to claude config

# Docker shortcuts since you use it
alias dv='docker version' # Check docker version
alias dr='docker run' # Quick docker run
alias ds='sudo systemctl status docker' # Check docker service

# DBT/Development shortcuts
alias cdbt='cd ~/git/data/src/dbt' # Quick jump to dbt directory
alias cdbtp='cd ~/git/data/src/dbt/projects' # Jump to dbt projects

# System shortcuts
alias pkg='dpkg -l | grep ^ii | awk "{print \$2}"' # List installed packages
alias reload='source ~/.bashrc' # Reload bash config

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables' # Quick iptables access
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers' # List all iptables rules
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers' # List INPUT iptables rules
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers' # List OUTPUT iptables rules
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers' # List FORWARD iptables rules
alias firewall=iptlist # Show firewall rules (alias for iptlist)

# get web server headers #
alias header='curl -I' # Get HTTP headers from URL
 
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress' # Get compressed HTTP headers

## pass options to free ## 
alias meminfo='free -m -l -t' # Show memory information in MB
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4' # Show processes sorted by memory usage
alias psmem10='ps auxf | sort -nr -k 4 | head -10' # Show top 10 memory consuming processes
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3' # Show processes sorted by CPU usage
alias pscpu10='ps auxf | sort -nr -k 3 | head -10' # Show top 10 CPU consuming processes
 
## Get server cpu info ##
alias cpuinfo='lscpu' # Show CPU information
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log' # Show GPU memory information

## git commands
alias gcm='git commit -m' # Git commit with message
alias gitall='git add -A' # Add all files to git staging
alias gp='git push' # Git push to remote

## set the local timezone
alias set-time='sudo dpkg-reconfigure tzdata' # Configure system timezone

##toggle laptop keyboard on or off
alias keyboard-on='xinput set-prop 12 "Device Enabled" 1' # Enable laptop keyboard
alias keyboard-off='xinput set-prop 12 "Device Enabled" 0' # Disable laptop keyboard

##rotate screen
alias scrnormal='xrandr -o normal' # Set screen to normal orientation
alias scrright='xrandr -o right' # Rotate screen right
alias scrleft='xrandr -o left' # Rotate screen left
alias scrupsidedown='xrandr -o inverted' # Rotate screen upside down
alias scrreshigh='xrandr --output eDP1 --mode 3200x1800' # Set screen to high resolution
alias scrresnorm='xrandr --output eDP1 --mode 1920x1080' # Set screen to normal resolution
alias scrreslow='xrandr --output eDP1 --mode 1280x720' # Set screen to low resolution
alias scrlist='xrandr -q' # List available screen modes
alias bash-reload='source ~/.bashrc' # Reload bash configuration

## default human readable disk info ##
alias df='df -H' # Show disk space in human readable format
alias du='du -ch' # Show directory sizes with totals

#ssh short cuts
alias ssh-personal='ssh -i ~/.ssh/github-personal' # SSH with personal GitHub key


alias tink='docker exec -it local /usr/share/nginx/html/artisan tinker' # Launch Laravel Tinker in local container
alias dc-local-exec='docker exec -it local ' # Execute command in local container
alias dc-local-logs='docker logs local' # Show logs from local container
alias stmux='TERM=screen-256color-bce tmux attach -t stefan' # Attach to stefan tmux session
alias demotmux='TERM=screen-256color-bce tmux attach -t demo' # Attach to demo tmux session
alias clearchat='ClearChat & disown' # Start ClearChat application in background

#Use a docker build to push the frontend to an S3 need to append build name to the end
alias frontend-push-st="docker run -e BUCKET=$BUCKET -e ACCESS_KEY=$ACCESS_KEY -e SECRET_KEY=$SECRET_KEY -e REGION=$REGION -it " # Push frontend to staging S3 bucket
alias frontend-push-prod="docker run -e BUCKET=$BUCKETPROD -e ACCESS_KEY=$ACCESSPROD -e SECRET_KEY=$SECRETPROD -e REGION=$REGION -it " # Push frontend to production S3 bucket
alias frontend-push-stage="docker run -e BUCKET=$BUCKETSTAG -e ACCESS_KEY=$ACCESSSTAG -e SECRET_KEY=$SECRETSTAG -e REGION=$REGION -it " # Push frontend to stage S3 bucket 

alias vpn-electronifie='sudo openvpn --config /home/st/caylent/clients/electronifie/vpn/client.ovpn --auth-user-pass ~/.openvpn/electronifie' # Connect to Electronifie VPN
alias vpn-london='cd /home/st/ipvanish && sudo openvpn --config /home/st/ipvanish/ipvanish-UK-London-lon-a01.ovpn --auth-user-pass ~/.openvpn/ipvanish' # Connect to London VPN server

# python shortcuts
alias venv='source ./bin/activate' # Activate Python virtual environment
alias deactivate='deactivate' # Deactivate Python virtual environment
alias s3pub='s3pypi --bucket repo.staging.caylent.io' # Publish Python package to S3 PyPI repo
alias pip-install='pip install -r requirements.txt' # Install Python requirements

# Devcontainer shortcuts for Cherre data repo
alias dcstart='devcontainer up --workspace-folder /home/stefan/git/data --config /home/stefan/git/data/.devcontainer/python38-poetry183/devcontainer.json' # Start development container
alias dcterm='devcontainer exec --workspace-folder /home/stefan/git/data --config /home/stefan/git/data/.devcontainer/python38-poetry183/devcontainer.json -- bash' # Open terminal in development container
alias dcrebuild='devcontainer down --workspace-folder /home/stefan/git/data --config /home/stefan/git/data/.devcontainer/python38-poetry183/devcontainer.json && devcontainer up --workspace-folder /home/stefan/git/data --config /home/stefan/git/data/.devcontainer/python38-poetry183/devcontainer.json && dcterm' # Rebuild and restart development container
alias dcstop='devcontainer down --workspace-folder /home/stefan/git/data --config /home/stefan/git/data/.devcontainer/python38-poetry183/devcontainer.json' # Stop development container
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
    if [ -z $3 ]; then
        docker exec -it $1 tail -n 10000 -f /usr/share/nginx/html/storage/logs/laravel.log | grep -A 20 $2
    else        
        docker exec -it $1 tail -n 10000 -f /usr/share/nginx/html/storage/logs/laravel.log | grep -A $3 $2
    fi
}

function dc-shell()
{
    docker exec -it $1 bash -c 'cd /usr/share/nginx/html; exec "${SHELL:-sh}"'
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
function dc-build-run()
{
    docker build -t caylent-api-$1 . && docker run -dp 80:80 --name caylent-api-$1 caylent-api-$1
}
function dc-build-stop-run()
{
    docker build -t caylent-api-$1 . && docker stop caylent-api-$2 && docker run -dp 80:80 --name caylent-api-$1 caylent-api-$1
}
