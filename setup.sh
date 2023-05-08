#!/bin/bash
cd ~ || exit
apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/3bf863cc.pub
add-apt-repository 'deb https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/ /'
apt-get update -y && apt-get install -y cuda nvidia-cuda-toolkit software-properties-common libgl1 libglib2.0-0 vim wget curl git-core build-essential openssl libssl-dev ffmpeg
nvidia-smi
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
chmod a+rx /usr/local/bin/yt-dlp
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && mkdir -p ~/.conda && bash Miniconda3-latest-Linux-x86_64.sh -b && rm -rf Miniconda3-latest-Linux-x86_64.sh
source ~/miniconda3/bin/activate
conda init
conda install python=3.9.16 --yes
pip3 install --upgrade pip
pip3 install git+https://github.com/openai/whisper.git
curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs
cd ~ && git clone --single-branch --branch customise https://github.com/kennytat/generate-subtitles.git
cd ~/generate-subtitles && npm install
