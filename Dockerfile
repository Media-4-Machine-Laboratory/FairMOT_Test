# nvidia-cuda image
FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

LABEL maintainer="sangkyun.jeon <sangkyun.jeon@gmail.com>"
LABEL version="0.1"
LABEL description="Setting FairMOT"

# ENV
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV CONDA_PYTHON_VERSION=3.9

# apt-get init
RUN apt-get -y update && apt-get -y install sudo \
    wget \
    git \
    python3 \
    python3-pip \
    ninja-build \
    bzip2 \
    build-essential

# conda install
ENV ANACONDA_VERSION=Anaconda3-2023.09-0-Linux-x86_64.sh
RUN wget https://repo.anaconda.com/archive/$ANACONDA_VERSION && \
    sh $ANACONDA_VERSION && \
    echo "/anaconda3" >> ~/.bashrc" && source ~/.bashrc && \
    conda create -n test python=$CONDA_PYTHON_VERSION

# conda activate & install packages

# jupyter setting
