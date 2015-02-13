# emacs 24 config test

FROM ubuntu
MAINTAINER Theodore Konukhov <https://github.com/konukhov>

RUN apt-get update && \
    apt-get install -y build-essential \
                       python \
                       git \
                       curl

# Install Emacs
RUN apt-get build-dep -y emacs24
RUN curl -O http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz && \
    tar -xzvf emacs-24.4.tar.gz && \
    rm emacs-24.4.tar.gz

RUN cd emacs-24.4 && \
    ./configure --prefix=/opt/emacs && \
    make && \
    make install

ENV PATH=/opt/emacs/bin:$PATH
ENV EMACS=/opt/emacs/bin/emacs

# Install Cask
RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
ENV PATH=/root/.cask/bin:$PATH

# Copy config & install deps
ADD . /root/.emacs.d
RUN cd /root/.emacs.d && cask install

ENTRYPOINT ["emacs"]
