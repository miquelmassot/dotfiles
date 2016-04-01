# BASH aliases 

function imgview
{
  rosrun image_view image_view image:=$1 
}

catkin_make='catkin_make -DCMAKE_BUILD_TYPE=RelWithDebInfo'

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
  catkin_make $1;
  cd $OLDDIR;
}


alias gits='git status'
alias ..='cd ..'
alias ...='cd ../..'
alias sbash='source ~/.bashrc'
alias vbash='vi ~/.bashrc'
alias valias='vi ~/.bash_aliases'
alias git-remove-deleted='git ls-files --deleted -z | xargs -0 git rm'
alias meshlab='LC_ALL=C meshlab'
alias update-software='sudo apt-get update -y && sudo apt-get dist-upgrade -y'

alias sshoptimus='ssh -XY -t miquel@opt.uib.es "screen -R miquel -D" '
alias sshpulgarcito-ros='ssh -XY -p 2200 ros@192.168.1.100'
alias sshpulgarcito-vnc='ssh -L 5900:127.0.0.1:5900 -p 2200 ros@192.168.1.100'
alias sshpulgarcito-miquel='ssh -XY -p 2200 -t miquel@192.168.1.100 "byobu"'
alias sshtomate='ssh -XY -t miquel@130.206.76.73 "screen -R miquel -D" '
alias sshfugu-c='ssh -XY -t ros@192.168.1.181 "screen -R miquel -D" '
alias sshfugu-c-wifi='ssh -XY -t ros@192.168.1.180 "screen -R miquel -D" '
alias sshfugu-f='ssh -XY -t user@192.168.1.170 "screen -R miquel -D" '
#alias sshplotter='ssh -XY osl@137.195.182.236'
alias sshsparus='ssh -XY sparus@192.168.1.205'
alias pingfugu-f='ping 192.168.1.170'
alias pingfugu-c='ping 192.168.1.181'
alias pingsparus='ping 192.168.1.205'

# sync time with an ntp server. G500 in this case
#alias sync-machines='sudo ntpdate -bu 192.168.1.51'
alias sync-sparus='sudo ntpdate -bu 192.168.1.205'

alias imgview_down='rosrun image_view image_view image:=/stereo_down/left/image_rect_color'
alias imgview_forward='rosrun image_view image_view image:=/stereo_forward/left/image_rect_color'

alias techo='rostopic echo'
alias tlist='rostopic list'

alias rviz='rosrun rviz rviz'
alias tf='cd /var/tmp && rosrun tf view_frames && evince frames.pdf &'
alias plot_odometry='roscd stereo_slam && ./scripts/plot_odom.py L /ekf_odom/odometry /ekf_map/odometry /sparus/pat_to_ros_odom'
alias reconfigure='rosrun rqt_reconfigure rqt_reconfigure'
alias catkin_ignore_package='echo '"'"'Touching CATKIN_IGNORE'"'"'; echo '"'"'If you want this package to compile again, remove it'"'"'; touch CATKIN_IGNORE'
alias catkin_list_ignored_packages='roscd; cd ..; find -name '"'"'CATKIN_IGNORE'"'"' -printf '"'"'%h\n'"'"' | sort -u'

alias matlab='LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6 matlab'
alias pulmat='ssh -p 2200 -XY -t miquel@192.168.1.100 "matlab" '

alias firefox-proxy-uib='ssh -C2qTnN -D 8080 miquel@pul.uib.es'

alias ghostview='evince'
alias hide_icons='gsettings set org.gnome.desktop.background show-desktop-icons false'
alias show_icons='gsettings set org.gnome.desktop.background show-desktop-icons true'

