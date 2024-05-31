FROM rocm/pytorch:latest

# Add arguments for UID and GID
ARG USER
ARG UID
ARG GID

# Set environment variables
ENV USER=$USER
ENV UID=$UID
ENV GID=$GID
ENV HOME=/home/$USER

# Create a group and user based on the passed UID and GID
RUN groupadd -g $GID $USER && \
    useradd -u $UID -g $GID -m $USER && \
    usermod -a -G render $USER && \
    usermod -a -G video $USER
# Switch to the newly created user
USER $USER

# Set the working directory
WORKDIR $HOME


### To build use this

# setenv UID `id -u`
# setenv GID `id -g`
# setenv USER `whoami`

# or use this for bash

# export UID=$(id -u)
# export GID=$(id -g)
# export USER=$(whoami)

# docker build --build-arg USER=$USER --build-arg UID=$UID --build-arg GID=$GID -t your_docker_image .