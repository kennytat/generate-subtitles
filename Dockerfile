# Dockerfile.Stable

# https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.7.1/ubuntu2204/devel/cudnn8/Dockerfile
# FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu22.04
# https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.7.1/ubuntu2204/base/Dockerfile
FROM nvidia/cuda:11.7.1-base-ubuntu22.04
ENV DEBIAN_FRONTEND noninteractive
ENV NODE_VERSION=14
WORKDIR /content

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y libgl1 libglib2.0-0 vim wget curl git-core git-lfs python3-pip python-is-python3 build-essential openssl libssl-dev ffmpeg

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - && \
	apt-get install -y nodejs

RUN rm -rf /var/lib/apt/lists/*

# Install youtube-dl
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
RUN chmod a+rx /usr/local/bin/yt-dlp

# Insatll anaconda
RUN wget \
	https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
	&& mkdir /root/.conda \
	&& bash Miniconda3-latest-Linux-x86_64.sh -b \
	&& rm -f Miniconda3-latest-Linux-x86_64.sh

ENV PATH="/usr/local/cuda/bin:/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

## Install whisper from openai
RUN conda install python=3.9.16 --yes
RUN pip3 install --upgrade pip
RUN pip3 install git+https://github.com/openai/whisper.git

RUN mkdir -p /content/stt
COPY . /content/stt
RUN npm install --prefix /content/stt

ENV PORT=3000
EXPOSE 3000

ENTRYPOINT [ "npm" ]

CMD ["start", "--prefix", "/content/stt"]