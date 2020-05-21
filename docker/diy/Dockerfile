# Use an official nvidia runtime as a parent image
FROM nvcr.io/nvidia/l4t-base:r32.3.1

CMD ["bash"]


# ENVIRONMENT STUFF FOR CUDA
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib
ENV PATH=/usr/local/cuda/bin:$PATH
ENV CUDA_ROOT /usr/local/cuda

# set working directory
WORKDIR /bonnetal-docker-base


RUN apt update
RUN apt install -yqq  build-essential ninja-build \
  python3-dev python3-pip apt-utils curl git cmake unzip autoconf autogen \
  libtool mlocate zlib1g-dev python3-numpy python3-wheel wget \
  software-properties-common openjdk-8-jdk libpng-dev  \
  libxft-dev ffmpeg libboost-all-dev \
  libyaml-cpp-dev

RUN updatedb
RUN apt install python-empy
RUN pip3 install catkin_tools trollius


RUN git clone --recursive https://github.com/tano297/pytorch
ENV USE_NCCL 0
ENV USE_DISTRIBUTED 0
ENV TORCH_CUDA_ARCH_LIST "5.3;6.2;7.2"


RUN cd pytorch && python3 setup.py install


# python packages
#RUN pip3 install -U pip
#RUN pip3 install pyyaml
#  onnx==1.5.0 \
#  torchvision==0.2.2.post3 \
#  pycuda==2018.1.1 \
#  opencv_python==3.4.0.12 \
#  scipy==0.19.1 \
#  Pillow==6.0.0 \
#  genpy==2016.1.3 \
#  scikit_learn==0.20.3 \
#  tensorflow==1.13.1 \
#  PyYAML==5.1

# tensorrt (Deb local)
#RUN wget http://ipb.uni-bonn.de/html/projects/bonnetal/external/nv-tensorrt-repo-ubuntu1804-cuda10.1-trt5.1.5.0-ga-20190427_1-1_amd64.deb && \
#  dpkg -i nv-tensorrt-repo-ubuntu1804-cuda10.1-trt5.1.5.0-ga-20190427_1-1_amd64.deb && \
#  rm nv-tensorrt-repo-ubuntu1804-cuda10.1-trt5.1.5.0-ga-20190427_1-1_amd64.deb && \
#  apt-get update && \
#  apt install tensorrt python3-libnvinfer-dev -yqq


#ENV MAX_JOBS 3
# build pytorch from source and install in the system
#RUN git clone --recursive https://github.com/tano297/pytorch

#ADD libcaffe2_gpu.so lib/
#ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/bonnetal-docker-base/lib




#ENV CONDA_INSTALL_LOCALLY 1
#RUN ls pytorch
#RUN ls pytorch/scripts
#RUN pytorch/scripts/build_anaconda.sh -DUSE_CUDA=ON


#RUN export USE_NCCL=0 && export USE_DISTRIBUTED=0 && export TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2"  && cd pytorch && python3 setup.py install && cd ..

RUN cd pytorch && \
  cp -r torch/include/* /usr/local/include && \
  cp -r torch/lib/* /usr/local/lib && \
  cp -r torch/share/* /usr/local/share && \
  cd .. && rm -r pytorch


# clean the cache
RUN apt update && \
  apt autoremove --purge -y && \
  apt clean -y

RUN rm -rf /var/lib/apt/lists/*
