sudo gsettings set org.gnome.desktop.session idle-delay 0
sudo apt update
sudo apt upgrade -y
sudo apt install tmux git python3 python3-pip htop nano -y

sudo apt autoremove -y

sudo apt-get install -yqq  build-essential ninja-build \
  python3-dev python3-pip apt-utils curl git cmake unzip autoconf autogen \
  libtool mlocate zlib1g-dev python3-numpy python3-wheel wget \
  software-properties-common openjdk-8-jdk libpng-dev  \
  libxft-dev ffmpeg libboost-all-dev \
  libyaml-cpp-dev python-catkin-tools -y

sudo updatedb

echo "Install ROS by running the ros_install.sh as root"
