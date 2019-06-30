FROM ubuntu:19.04

ENV OPAMROOT=/usr/local/opam

ADD https://github.com/ocaml/opam/releases/download/2.0.4/opam-2.0.4-x86_64-linux /usr/local/bin/opam

RUN apt-get update && \
    apt-get install -y \
    curl \
    z3 \
    build-essential \
    m4 \
    unzip \
    pkg-config \
    zlib1g-dev \
    libgmp-dev \
    libgtksourceview2.0-dev

RUN \
  chmod +x /usr/local/bin/opam && \
  opam init --disable-sandboxing -y && \
  opam switch create vericuda --packages cil=1.7.3 -y && \
  eval $(opam env) && \
  opam install extlib=1.7.6 why3=0.87.2 zlib=0.6 alt-ergo=0.99.1 -y

RUN mkdir -p /VeriCUDA

ADD *.ml *.mli *.mly *.why Makefile *.mll samples *.py *.cu /VeriCUDA/

RUN cd /VeriCUDA && \
  eval $(opam env) && \
  make && \
  make clean && \
  rm *.ml *.mli *.mly *.mll Makefile && \
  mv vericuda.opt /usr/local/bin/vericuda

ADD docker/why3.conf /root/.why3.conf
ADD docker/test.sh /VeriCUDA/

ENV VERICUDA_PROVERS=alt-ergo,z3

WORKDIR /VeriCUDA

CMD ./test.sh

#  why3 config --detect-provers && \
#  echo [main] >> ~/.why3.conf && \
#  echo loadpath = "/usr/local/opam/vericuda/share/why3/stdlib" >> ~/.why3.conf && \
#  echo loadpath = "/usr/local/opam/vericuda/share/why3/theories" >> ~/.why3.conf && \
#  echo loadpath = "/usr/local/opam/vericuda/share/why3/modules" >> ~/.why3.conf && \
#  echo loadpath = "/VeriCUDA" >> ~/.why3.conf
