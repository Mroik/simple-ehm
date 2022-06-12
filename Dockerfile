FROM nvidia/cuda:10.2-base
CMD nvidia-smi

RUN apt update; exit 0
RUN apt install libgl1-mesa-glx libglib2.0-0 ffmpeg make wget tar xz-utils gcc zlib1g-dev -y

WORKDIR /simple_ehm
RUN apt install python3.8 python3-pip -y
RUN cp /usr/bin/python3.8 /usr/bin/python
RUN python3.8 -m pip install -U pip
COPY . .
RUN pip3 install -r requirements.txt
