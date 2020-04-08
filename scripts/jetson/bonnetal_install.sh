sudo apt update
sudo apt-get install -y build-essential ninja-build python3-dev python3-pip apt-utils curl git cmake unzip autoconf autogen libtool mlocate zlib1g-dev python3-numpy python3-wheel wget software-properties-common openjdk-8-jdk libpng-dev libxft-dev ffmpeg libboost-all-dev libyaml-cpp-dev
sudo apt install python-empy python-catkin-tools
sudo pip install catkin_tools trollius
sudo updatedb

echo "Installing Pytorch now, this could take a while"
sleep 3

echo "Creating 8GB Swap"
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1M count=8192 oflag=append conv=notrunc
sudo mkswap /swapfile
sudo swapon /swapfile



git clone --recursive https://github.com/tano297/pytorch
cd pytorch
export USE_NCCL=0
export USE_DISTRIBUTED=0
export TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2"
export MAX_JOBS=4
sudo -E python3 setup.py install
sudo cp -r torch/include/* /usr/local/include
sudo cp -r torch/lib/* /usr/local/lib
sudo cp -r torch/share/* /usr/local/share

echo "finished building PyTorch, building bonnetal now"

cd ../../../deploy
source /home/tobi/.bashrc
#git clone https://github.com/ros/catkin.git src/catkin
#CMAKE_PREFIX_PATH=""
sudo cp -r /usr/include/opencv4 /usr/include/opencv
catkin init
catkin build bonnetal_segmentation_standalone bonnetal_segmentation_ros
source devel/setup.bash
