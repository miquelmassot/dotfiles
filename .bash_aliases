# BASH alias

# General
alias ..='cd ..'
alias ...='cd ../..'
alias cdd='cd `pwd -P`'
alias make='make -j2'
alias sbash='source ~/.bashrc'
alias vbash='vi ~/.bashrc'
alias valias='vi ~/.bash_aliases'
alias update-software='sudo apt-get update -y && sudo apt-get dist-upgrade -y'
alias hide_icons='gsettings set org.gnome.desktop.background show-desktop-icons false'
alias show_icons='gsettings set org.gnome.desktop.background show-desktop-icons true'
alias whoisusingme='echo "SCP:";echo `ps aux | grep scp | grep -v grep`; echo "WHO:";echo `who`; echo `who`'

# APPS
alias meshlab='LC_ALL=C meshlab'
alias matlab='LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6 matlab'
alias ghostview='evince'

# ROS
alias techo='rostopic echo'
alias tlist='rostopic list'
alias slist='rosservice list'
alias rviz='rosrun rviz rviz'
alias tf='cd /var/tmp && rosrun tf view_frames && evince frames.pdf &'
alias reconfigure='rosrun rqt_reconfigure rqt_reconfigure'
alias catkin_ignore_package='echo '"'"'Touching CATKIN_IGNORE'"'"'; echo '"'"'If you want this package to compile again, remove it'"'"'; touch CATKIN_IGNORE'
alias catkin_list_ignored_packages='roscd; cd ..; find -name '"'"'CATKIN_IGNORE'"'"' -printf '"'"'%h\n'"'"' | sort -u'
alias imgview-down='rosrun image_view image_view image:=/stereo_down/left/image_rect_color'
alias imgview-down-s2='rosrun image_view image_view image:=/stereo_down/scaled_x2/left/image_rect_color'
alias imgview-forward='rosrun image_view image_view image:=/stereo_forward/left/image_rect_color'
alias imgview-forward-s2='rosrun image_view image_view image:=/stereo_forward/scaled_x2/left/image_rect_color'
alias catmk-dist='CC="distcc gcc" CXX="distcc g++" catkin build -p$(distcc -j) -j$(distcc -j) --no-jobserver'
alias cbqt='catkin build --profile qtcreator'

# GIT
alias gits='git status'
alias gitk='gitg --all'
alias git-remove-deleted='git ls-files --deleted -z | xargs -0 git rm'

# SRV Lab servers
alias rompetechos-ping='ping 192.168.1.25'
alias rompetechos-wake='sudo etherwake -i enp60s0 4c:cc:6a:6b:83:c0'
alias rompetechos-ssh='ssh -XY miquel@192.168.1.25'
alias rompetechos-ssh-external='ssh -p 2200 -t miquel@pul.uib.es ssh miquel@192.168.1.25'
alias rompetechos-mount='sshfs miquel@192.168.1.25:.  /mnt/rompetechos'
alias rompetechos-umount='umount /mnt/rompetechos'

alias pulgarcito-ping='ping 192.168.1.100'
alias pulgarcito-wake='sudo etherwake -i enp5s0 00:e3:e0:08:7f:21'
alias pulgarcito-mount='sshfs miquel@192.168.1.100:.  /mnt/pulgarcito -p 2200'
alias pulgarcito-bagfiles='sshfs miquel@192.168.1.100:/data/HD3/bagfiles/turbot  /mnt/bagfiles -p 2200'
alias pulgarcito-matlab='ssh -p 2200 -XY -t miquel@192.168.1.100 "matlab" '
alias pulgarcito-firefox-proxy='ssh -C2qTnN -D 8080 miquel@pul.uib.es'
alias pulgarcito-ssh-ros='ssh -XY -p 2200 ros@192.168.1.100'
alias pulgarcito-ssh='ssh -XY -p 2200 -t miquel@192.168.1.100 "byobu"'
alias pulgarcito-ssh-external='ssh -XY -p 2200 -t miquel@pul.uib.es'
alias pulgarcito-sync='rsync -rv /home/miquel/ws/kinetic/src/ /mnt/puldata/ros/kinetic/src'

# SPARUS II and NUC
alias turbot-ping='ping 192.168.1.205'
alias turbot-ssh='ssh -XY sparus@192.168.1.205'
alias turbot-ntpdate='sudo ntpdate -bu 192.168.1.205'

alias turbot-ssh-nuc='ssh -XY sparus@192.168.1.206'
alias turbot-ping-nuc='ping 192.168.1.206'
alias turbot-ntpdate-nuc='sudo ntpdate -bu 192.168.1.206'
alias turbot-wake='sudo etherwake -i enp60s0 00:01:05:16:A1:89'
alias turbot-wake-nuc='sudo etherwake -i enp60s0 f4:4d:30:63:08:e4'

alias groundstation-ssh='ssh -XY turbot@192.168.1.170'

alias xiroi-ping='ping 192.168.1.207'
alias xiroi-ssh='ssh -XY catamaran@192.168.1.207'
alias xiroi-ntpdate='sudo ntpdate -bu 192.168.1.207'
alias xiroi-master='export ROS_MASTER_URI=http://192.168.1.207:11311'

alias nas-ssh='ssh -XY admin@192.168.1.50'

alias shore-soi-vpn='nmcli connection up Shore\ side\ SOI'
alias hpc-falkor-ssh='ssh -XY hpc-cloud@10.23.14.214'
alias hpc-shore-ssh='ssh hpc-cloud@10.23.14.225'
alias shore-soi-close='nmcli connection down Shore\ side\ SOI'

alias soton-vpn='globalprotect connect -p globalprotect.soton.ac.uk -u mfmc1e18'
alias soton-vpn-disconnect='globalprotect disconnect'

alias driftcam-ssh='ssh -XY driftcam@192.168.60.100'
alias driftcam-ping='ping 192.168.60.100'

alias oplab-insitu-mount='sudo mount.cifs //oplab-insitu.clients.soton.ac.uk/data /media/oplab-insitu -o credentials=/home/miquel/.smbcredentials,uid=$(id -u),gid=$(id -g),forceuid,forcegid,rw'
alias oplab-insitu-umount='sudo umount /media/oplab-insitu'
alias oplab-surf-mount='sudo mount.cifs //oplab-surf.clients.soton.ac.uk/data /media/oplab-surf -o credentials=/home/miquel/.smbcredentials,uid=$(id -u),gid=$(id -g),forceuid,forcegid,rw,vers=1.0'
alias oplab-surf-umount='sudo umount /media/oplab-surf'

alias wifi-list='nmcli d wifi list'

# Functions
function wifi-disconnect-from
{
  nmcli c down id $1
}

function wifi-connect-to
{
  nmcli c up id $1
}

function build_and_make
{
  if [ ! -f ./CMakeLists.txt ]; then
    echo "CMakeLists.txt not found!";
    return 0;
  fi
  OLDDIR=`pwd`;
  mkdir -p build;
  cd build;
  cmake ..;
  make;
  cd $OLDDIR;
}

function catmk
{
  OLDDIR=`pwd`;
  roscd; cd ..;
  catkin_make -DCMAKE_BUILD_TYPE=Release $1
  cd $OLDDIR;
}

function imgview
{
  rosrun image_view image_view image:=$1
}

function neptus
{
  cd /opt/lsts/neptus;
  ./neptus.sh
}

#alias utokyo-ssh='ssh -XY -t oplab@157.82.157.230'
#alias plotter-ssh='ssh -XY osl@137.195.182.236'

# sync time with an ntp server. G500 in this case
#alias sync-machines='sudo ntpdate -bu 192.168.1.51'
