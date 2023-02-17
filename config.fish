#HISTCONTROL=ignoreboth;
#HISTSIZE=150000;

# my fish config
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


# Common use
alias grubup=" update-grub"
alias fixpacman=" rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'

# alias neofetch='neofetch --ascii_distro DarkOs'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias zr='nice -n 19 emerge -C -av'
alias zrc=' emerge -av --depclean'
alias zrt=' emerge -avp --depclean'
alias zi='nice -n 19 emerge -av'
alias zic=' CC="clang" CXX="clang++" emerge -av'
alias zu='equery uses'
alias d='rc-update del'
alias zss=' emerge --searchdesc'
alias zs=' emerge --search'
alias zpi='pip install --user'
alias gc='git clone'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert

alias np='nano /etc/portage/make.conf'
alias n='nano'
alias xa='echo exec awesome > ~/.xinitrc ; startx'
alias xd='echo exec dwm > ~/.xinitrc ; startx'
alias xl='echo exec startlxqt > ~/.xinitrc ; startx'
alias xe='echo exec startlxde > ~/.xinitrc ; startx'
alias oa="/mnt/uwu/4C/openarena-0.8.8/openarena.x86_64"
alias p='python3'
alias pp="p -i -c 'from math import *'"
alias k="kwrite 2>/dev/null"

alias u="update-grub"
alias n19="nice -n 19"

alias w='wine start /unix'
alias wk='wineserver -k'

alias n+="nice -n 19 ionice -c 3"
alias n+="nice -n -19 ionice -c 1"

alias qmount='modprobe nbd max_part=8; qemu-nbd --connect=/dev/nbd0'
alias qumount='qemu-nbd --disconnect /dev/nbd0; rmmod nbd'

alias vf='modprobe vfio-pci vfio_pci ids=10de:2520,10de:228e'

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    set_color brcyan
    set_color -b blue
    printf ' %s ' (date '+%H %M %S')
    set_color blue
    set_color -b purple
    printf '▶'
    set_color brwhite
    set_color -b purple
    printf ' [%s] ' $(string sub -s -30 $(pwd))  #(pwd | cut -c 1-20)
    set_color purple
    set_color -b black
    printf '▶ '
    set_color green
    set_color -b black
    printf ''
    set_color brwhite
    
end


set LANGUAGE C
set LC_ALL C
set LC_MONETARY C
set LC_MESSAGES C
set LC_MEASUREMENT C
set LC_CTYPE C
set LC_TIME C
set LC_COLLATE C
set LANG C
set PATH $PATH /mnt/uwu/4C/zbin
set PATH $PATH /mnt/uwu/4C/zbin/*


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
alias condain='eval /root/miniconda3/bin/conda "shell.fish" "hook" $argv | source; conda activate ldm'
# <<< conda initialize <<<

