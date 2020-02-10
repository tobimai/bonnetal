sudo apt install python-empy
sudo pip install catkin_tools trollius

echo "Installing Pytorch now, this could take a while"
sleep 3

sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1M count=8192 oflag=append conv=notrunc
sudo mkswap /swapfile
sudo swapon /swapfile



git clone --recursive https://github.com/tano297/pytorch
cd pytorch
export USE_NCCL=0
export USE_DISTRIBUTED=0
export TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2"
export MAX_JOBS=3
sudo -E python3 setup.py install
sudo cp -r torch/include/* /usr/local/include
sudo cp -r torch/lib/* /usr/local/lib
sudo cp -r torch/share/* /usr/local/share

echo "finished building PyTorch, building bonnetal now"

cd ../../deploy
git clone https://github.com/ros/catkin.git src/catkin
CMAKE_PREFIX_PATH=""
catkin init
catkin build bonnetal_segmentation_standalone bonnetal_segmentation_ros
