FROM nvidia/cuda:10.0-devel

RUN apt-get update
RUN apt-get install -y openssl wget git automake autoconf libtool pkg-config \
    libgmp3-dev libyaml-dev

RUN wget 'http://releases.llvm.org/3.4.2/clang+llvm-3.4.2-x86_64-linux-gnu-ubuntu-14.04.xz'
RUN tar xf clang*.xz && cd clang*04 && cp -R * /usr/local

RUN apt-get install -y gcc-4.8 g++-4.8 zlib1g-dev libtinfo-dev

RUN git clone 'https://github.com/khaki3/AN5D' && cd AN5D && \
    ./get_submodules.sh && ./autogen.sh; CC=gcc-4.8 CXX=g++-4.8 ./configure \
    && make && make install

RUN git clone 'https://github.com/khaki3/ppcg' && cd ppcg && \
    ./autogen.sh; CC=gcc-4.8 CXX=g++-4.8 PET_CFLAGS=-I/usr/local/include \
    PET_LIBS=/usr/local/lib/libpet.so ./configure --with-pet=system \
    --with-isl=system && make && make install

RUN git clone 'https://github.com/khaki3/AN5D-Artifact.git'

RUN git clone --single-branch --branch const \
    'https://github.com/khaki3/StencilBench.git'

RUN git clone 'https://github.com/khaki3/IEEE2017.git'
