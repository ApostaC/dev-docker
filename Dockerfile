FROM python:3.10-slim AS base

# Install vim
WORKDIR /app

RUN apt update && apt install -y libncurses-dev libpython3-dev git build-essential cmake tmux

RUN git clone https://github.com/vim/vim

WORKDIR /app/vim/src

COPY Makefile Makefile

RUN make reconfig && make install

RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim

COPY .vimrc /root/.vimrc

RUN vim +PluginInstall +qall

WORKDIR /root/.vim/bundle/YouCompleteMe

RUN python3 install.py --clang-completer --force-sudo --verbose

RUN cp /root/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py ~/.vim/

# Copy other rc files
COPY .bashrc /root/.bashrc
COPY .tmux.conf /root/.tmux.conf

# Install nodejs
WORKDIR /root

RUN apt install -y curl

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

RUN bash -i -c "nvm install v22.12.0" 
