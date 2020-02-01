sudo apt install docker docker.io
cd ../docker
sudo ./install-nvidia-docker.sh
cd ..
sudo nvidia-docker build -t tano297/bonnetal:runtime -f docker/runtime/Dockerfile .

