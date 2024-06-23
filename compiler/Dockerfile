# Mimics the laboratory environment
FROM ubuntu:22.04
SHELL [ "/bin/bash", "-c"]
ENV LANG C.UTF-8

# Get back the contents
RUN yes | unminimize

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        gdb \
        gdbserver \
        vim \
        neovim \
        man-db \
        unzip

# Installs zsh and "Oh my ZSH!":
RUN apt-get update \
    && apt-get install -y \
        curl \
        git \
        zsh

# Installs sudo
RUN apt-get update \
    && apt-get install -y \
        sudo


COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
    
VOLUME [ "/mnt/isolated", "/mnt/external" ]
WORKDIR /mnt/isolated

ENTRYPOINT [ "entrypoint" ]
CMD [ "--copy-from-external" ]

# Create user with sudo permissions
ARG USERNAME=ephemeral
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --gid $USER_GID --uid $USER_UID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME

# Setup interpreter configs
USER $USERNAME
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && sed -i 's/plugins=.*/plugins=(git themes)/' /home/$USERNAME/.zshrc \
    && sed -i 's/ZSH_THEME=.*/ZSH_THEME="obraun"/' /home/$USERNAME/.zshrc
RUN sudo chsh -s $(which zsh) $(whoami)


