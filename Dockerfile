FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq sudo git-core subversion build-essential gcc-multilib ccache quilt \
                       bzip2 cpio whois patch perl libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev \
                       sed tar rsync bc gperf bison texinfo libtool automake gawk flex help2man tree pkg-config && \
    apt-get clean && \
    useradd -m chenzilin && \
    echo 'chenzilin ALL=NOPASSWD: ALL' > /etc/sudoers.d/chenzilin

USER chenzilin

RUN git config --global user.email "chenzilin115@gmail.com" && \
    git config --global user.name "ZiLin Chen"

RUN cd /home/chenzilin && \
    wget -c --no-check-certificate http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.23.0.tar.bz2 && \
    tar xvjfp crosstool-ng-1.23.0.tar.bz2 && mv crosstool-ng-1.23.0 crosstool-ng && rm crosstool-ng-1.23.0.tar.bz2 && \
    cd crosstool-ng/ && git init . && git add -A . && git commit -am "initial commit based on v1.23.0" && \
    ./configure && make -j8 && sudo make install

RUN mkdir /home/chenzilin/patches
COPY patches/*.patch /home/chenzilin/patches/
RUN cd /home/chenzilin/crosstool-ng/ && git am /home/chenzilin/patches/*.patch && rm -rf /home/chenzilin/patches

COPY dl-backup/dl.tar.bz2.* /home/chenzilin/crosstool-ng/
RUN cd /home/chenzilin/crosstool-ng/ && cat dl.tar.bz2.* | tar xvj && rm dl.tar.bz2.*

RUN mkdir /home/chenzilin/crosstool-ng/build

WORKDIR /home/chenzilin/crosstool-ng
