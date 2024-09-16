FROM ubuntu:24.04

# set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# now run sudo apt update commands
RUN apt-get update \
  && apt-get install -y python3-pip python3 git libsndfile1 vim

# custom pip3 installations across all operating systems
RUN pip3 install beets pylast pyacoustid flask requests librosa resampy --break-system-packages

RUN git clone https://github.com/d-rk/beets-artistart.git

ENV PYTHONPATH=/beets-artistart
ENV BEETSDIR=/config

EXPOSE 8337

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]

