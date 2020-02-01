sudo apt install docker docker.io
cd ../docker
./install-nvidia-docker.sh
cd ..
nvidia-docker build -t tano297/bonnetal:runtime -f docker/runtime/Dockerfile .

