# BASH aliases 

function imgview-f
{
  rosrun image_view image_view image:=$1 
}

function hydro-make-f
{
  echo "Parameter #1 is $1"
  cd ~/workspace/hydro;
  catkin_make -DCMAKE_BUILD_TYPE=RelWithDebInfo $1;
  cd -
}


alias ..='cd ..'
alias ...='cd ../..'
alias sbash='source ~/.bashrc'
alias vbash='vi ~/.bashrc'
alias valias='vi ~/.bash_aliases'
alias go-indigo='schroot -c indigo_trusty'

alias sshoptimus='ssh -XY -t miquel@opt.uib.es "screen -R miquel -D" '
alias sshpulgarcito-ros='ssh -XY ros@192.168.1.100'
alias sshpulgarcito-vnc='ssh -L 5900:127.0.0.1:5900 ros@192.168.1.100'
alias sshpulgarcito-miquel='ssh -XY miquel@192.168.1.100'
alias sshtomate='ssh -XY -t miquel@130.206.76.73 "screen -R miquel -D" '
alias sshfugu-c='ssh -XY -t ros@192.168.1.181 "screen -R miquel -D" '
alias sshfugu-c-wifi='ssh -XY -t ros@192.168.1.180 "screen -R miquel -D" '
alias sshfugu-f='ssh -XY -t user@192.168.1.170 "screen -R miquel -D" '
alias sshplotter='ssh -XY osl@137.195.182.243'
alias pingfugu-f='ping 192.168.1.170'
alias pingfugu-c='ping 192.168.1.181'
alias pinggirona500='ping 192.168.1.41'

# sync time with an ntp server. G500 in this case
alias sync-machines='sudo ntpdate -bu 192.168.1.51'

#alias imgview='rosrun image_view image_view'
alias imgview='imgview-f'

alias imgview_down='rosrun image_view image_view image:=/stereo_down/left/image_rect_color'
alias imgview_forward='rosrun image_view image_view image:=/stereo_forward/left/image_rect_color'
alias hydro-make='hydro-make-f'

alias techo='rostopic echo'
alias tlist='rostopic list'
#alias wstool='cd ~/workspace/hydro/src; wstool'

alias rosmaster_local='export ROS_MASTER_URI=http://localhost:11311; export ROS_IP=127.0.0.1 '
alias rosmaster_g500='export ROS_MASTER_URI=http://192.168.1.160:11311'
alias rosmaster_fugu-f='export ROS_MASTER_URI=http://192.168.1.170:11311'
alias rosmaster_fugu-c='export ROS_MASTER_URI=http://192.168.1.181:11311'
alias image_proc_down='ROS_NAMESPACE=/stereo_down rosrun stereo_image_proc stereo_image_proc'
alias image_proc_forward='ROS_NAMESPACE=/stereo_forward rosrun stereo_image_proc stereo_image_proc'
alias rosdep_install_all='rosdep install --from-path src --rosdistro $ROSDISTRO -i -y'
alias rviz='rosrun rqt_rviz rqt_rviz'

alias matlab='LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6 matlab'
alias pulmat='ssh -XY -t miquel@192.168.1.100 "matlab" '

alias optirunON='sudo tee /proc/acpi/bbswitch <<<ON'
alias optirunOFF='sudo tee /proc/acpi/bbswitch <<<OFF'

alias firefox-proxy-uib='ssh -C2qTnN -D 8080 miquel@pul.uib.es'
