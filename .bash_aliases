# BASH aliases

# General
alias ..='cd ..'
alias ...='cd ../..'
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
alias imgview-forward='rosrun image_view image_view image:=/stereo_forward/left/image_rect_color'
alias catmk-dist='CC="distcc gcc" CXX="distcc g++" catkin build -p$(distcc -j) -j$(distcc -j) --no-jobserver'

# GIT
alias gits='git status'
alias gitk='gitg --all'
alias git-remove-deleted='git ls-files --deleted -z | xargs -0 git rm'

# SRV Lab servers
alias rompetechos-ping='ping 192.168.1.25'
alias rompetechos-wake='sudo etherwake -i enp5s0 4c:cc:6a:6b:83:c0'
alias rompetechos-ssh='ssh -XY turbot@192.168.1.25'
alias rompetechos-mount='sshfs turbot@192.168.1.25:.  /mnt/rompetechos'

alias pulgarcito-ping='ping 192.168.1.100'
alias pulgarcito-wake='sudo etherwake -i enp5s0 00:e3:e0:08:7f:21'
alias pulgarcito-mount='sshfs miquel@192.168.1.100:.  /mnt/pulgarcito -p 2200'
alias pulgarcito-matlab='ssh -p 2200 -XY -t miquel@192.168.1.100 "matlab" '
alias pulgarcito-firefox-proxy='ssh -C2qTnN -D 8080 miquel@pul.uib.es'
alias pulgarcito-ssh-ros='ssh -XY -p 2200 ros@192.168.1.100'
alias pulgarcito-ssh-miquel='ssh -XY -p 2200 -t miquel@192.168.1.100 "byobu"'
alias pulgarcito-sync='rsync -rv /home/miquel/ws/kinetic/src/ /mnt/puldata/ros/kinetic/src'

# SPARUS II and NUC
alias sparus-ping='ping 192.168.1.205'
alias sparus-ssh='ssh -XY sparus@192.168.1.205'
alias sparus-ntpdate='sudo ntpdate -bu 192.168.1.205'

alias sparus-ssh-nuc='ssh -XY sparus@192.168.1.206'
alias sparus-ping-nuc='ping 192.168.1.206'
alias sparus-ntpdate-nuc='sudo ntpdate -bu 192.168.1.206'

alias catamaran-ping='ping 192.168.1.207'
alias catamaran-ssh='ssh -XY catamaran@192.168.1.207'
alias catamaran-ntpdate='sudo ntpdate -bu 192.168.1.207'

# Functions
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

#alias sshoplab-fugu='ssh -XY oplab@157.82.157.208'
#alias sshoplab-fugu-miquel='ssh -XY miquel@157.82.157.208'
#alias sshfugu-c='ssh -XY -t ros@192.168.1.181 "screen -R miquel -D" '
#alias sshfugu-c-wifi='ssh -XY -t ros@192.168.1.180 "screen -R miquel -D" '
#alias sshfugu-f='ssh -XY -t user@192.168.1.170 "screen -R miquel -D" '
#alias sshutokyo='ssh -XY -t oplab@157.82.157.230'
#alias sshplotter='ssh -XY osl@137.195.182.236'

#alias pingfugu-f='ping 192.168.1.170'
#alias pingfugu-c='ping 192.168.1.181'

# sync time with an ntp server. G500 in this case
#alias sync-machines='sudo ntpdate -bu 192.168.1.51'