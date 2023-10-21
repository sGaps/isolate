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
        man-db

# Installs zsh and "Oh my ZSH!":
RUN apt-get update \
    && apt-get install -y \
        curl \
        git \
        zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && sed -i 's/plugins=.*/plugins=(git themes)/' /root/.zshrc \
    && sed -i 's/ZSH_THEME=.*/ZSH_THEME="obraun"/' /root/.zshrc
RUN chsh -s $(which zsh)


COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
    
VOLUME [ "/mnt/isolated", "/mnt/external" ]
WORKDIR /mnt/isolated


ENTRYPOINT [ "entrypoint" ]
CMD [ "--copy-from-external" ]
