FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
MAINTAINER zo <yuryueng@gmail.com>

USER root

#get own tmp for root because apt don't fail
RUN mkdir -p /tmp
RUN chown root:root /tmp
RUN chmod ugo+rwXt /tmp

RUN apt-get update -y
RUN apt upgrade -y

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8


RUN apt update
RUN apt upgrade --fix-missing -y

#install basics
RUN apt install -y wget git zip 
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev

#install python 3.6.7
#RUN wget https://www.python.org/ftp/python/3.6.7/Python-3.6.7.tgz
#RUN tar xvf Python-3.6.7.tgz
#RUN cd Python-3.6.7 && ./configure && make
#RUN cd Python-3.6.7 && make install
RUN apt install -y python3

#install pip3
RUN apt install -y python3-pip
ENV debian_frontend=noninteractive
#RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh && bash Miniconda3-4.5.4-Linux-x86_64.sh -b
#RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh -O ~/miniconda.sh && \
#    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
#    rm ~/miniconda.sh && \
#    /opt/conda/bin/conda clean -tipsy && \
#    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
#    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
#    echo "conda activate base" >> ~/.bashrc
#ENV PATH="/root/miniconda3/bin:$PATH"
#RUN rm Miniconda3-4.5.4-Linux-x86_64.sh
#RUN conda version
#RUN conda update conda
#RUN ls /root/miniconda3/bin
#RUN /root/miniconda3/bin/conda
#RUN ln -s /root/miniconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh
#ENV PATH="/opt/conda/bin:$PATH"
#RUN conda update -y conda
#RUN echo ". /root/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc
#RUN /bin/sh /root/miniconda3/etc/profile.d/conda.sh
#RUN cat /root/.bashrc

#RUN cat /root/.bashrc
#RUN conda deactivate
#RUN exec bash && . ~/.bashrc && conda init bash
#RUN . /root/.bashrc && conda init bash && conda activate
#RUN . /root/.bashrc && \
#    /root/miniconda3/bin/conda init bash && \
#    /root/miniconda3/bin/conda create -n py37 python=3.7 anaconda && \
#    /root/miniconda3/bin/conda activate py37
#RUN conda init bash && . ~/.bashrc && conda activate && conda create -n KbeautyBaseline python=3.6.7 && conda activate KbeautyBaseline && conda install -y pytorch torchvision cudatoolkit=11 -c pytorch && conda install x264=='1!152.20180717' ffmpeg=4.0.2 -c conda-forge
#RUN conda create -n KbeautyBaseline python=3.6.7
#RUN conda activate KbeautyBaseline
#RUN conda install -y pytorch torchvision cudatoolkit=11 -c pytorch
#RUN conda install x264=='1!152.20180717' ffmpeg=4.0.2 -c conda-forge
RUN pip3 install --upgrade pip
RUN pip3 install torch torchvision
#RUN apt-get install -y build-essential git-core checkinstall yasm texi2html libfaac-dev libjack-jackd2-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libsdl1.2-dev libtheora-dev libvorbis-dev libvpx-dev libx11-dev libxfixes-dev libxvidcore-dev zlib1g-dev
#RUN git clone git://git.videolan.org/x264.git
#RUN cd x264 && ./configure && make && checkinstall --pkgname=x264 --pkgversion="2:0.$(grep X264_BUILD x264.h -m1 | cut -d' ' -f3).$(git rev-list HEAD | wc -l)+git$(git rev-list HEAD -n 1 |  head -c 7)" --backup=no --deldoc=yes --fstrans=no --default
#RUN cd x264 && ./configure && make && checkinstall --pkgname=x264 --pkgversion="1!152.20180717" --backup=no --deldoc=yes --fstrans=no --default

#RUN git clone git://git.ffmpeg.org/ffmpeg.git
#RUN cd ffmpeg && ./configure --enable-gpl --enable-version3 --enable-nonfree --enable-postproc \
#    --enable-libfaac --enable-libmp3lame --enable-libopencore-amrnb \
#    --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis \
#    --enable-libvpx --enable-libx264 --enable-libxvid --enable-x11grab
#RUN cd ffmpeg && make && checkinstall --pkgname=ffmpeg --pkgversion="5:$(./version.sh)" --backup=no --deldoc=yes --fstrans=no --default
#RUN cd ffmpeg && make && checkinstall --pkgname=ffmpeg --pkgversion="4.0.2" --backup=no --deldoc=yes --fstrans=no --default
RUN apt install -y x264 ffmpeg

RUN pip3 install opencv-python==4.1.2.30 ffmpeg-python==0.2.0 scikit-image==0.16.2
RUN pip3 install pillow==7.0.0 scipy==1.2.1 tqdm==4.43.0 munch==2.5.0

RUN pip3 install jupyterlab
RUN apt install -y libsm6 libxext6 libxrender-dev
RUN pip3 install opencv-python

#RUN apt update && apt upgrade --fix-missing -y
#RUN apt install -y curl
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt update

RUN pip3 install shortuuid pandas tqdm ipdb
RUN pip3 install pysqlite3
#RUN apt install -y nodejs npm
RUN apt install -y nodejs && nodejs -v npm
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN pip3 install ipywidgets IProgress

#language server
RUN pip3 install jupyter-lsp
RUN jupyter labextension install @krassowski/jupyterlab-lsp
RUN pip3 install python-language-server[all]
RUN apt install -y git
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --debug --allow-root

