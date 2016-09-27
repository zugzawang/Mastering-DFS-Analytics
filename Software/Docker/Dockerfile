# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3

FROM docker.io/ubuntu:xenial
MAINTAINER M. Edward (Ed) Borasky <znmeb@znmeb.net>

# Home base
USER root
RUN mkdir -p /usr/local/src/
WORKDIR /usr/local/src/

# set up locales
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=en_US.UTF-8
RUN update-locale LC_CTYPE=en_US.UTF-8
RUN update-locale LC_NUMERIC=en_US.UTF-8
RUN update-locale LC_TIME=en_US.UTF-8
RUN update-locale LC_COLLATE=en_US.UTF-8
RUN update-locale LC_MONETARY=en_US.UTF-8
RUN update-locale LC_MESSAGES=en_US.UTF-8
RUN update-locale LC_PAPER=en_US.UTF-8
RUN update-locale LC_NAME=en_US.UTF-8
RUN update-locale LC_ADDRESS=en_US.UTF-8
RUN update-locale LC_TELEPHONE=en_US.UTF-8
RUN update-locale LC_MEASUREMENT=en_US.UTF-8
RUN update-locale LC_IDENTIFICATION=en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8

# add R repository
RUN echo 'deb http://cran.rstudio.com/bin/linux/ubuntu xenial/' \
  >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

# Install Ubuntu packages
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends \
  apt-file \
  bash-completion \
  freeglut3-dev \
  gdebi-core \
  git \
  libcurl4-openssl-dev \
  libssh2-1-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  pandoc \
  pandoc-citeproc \
  pkg-config \
  python3-dev \
  python3-virtualenv \
  r-base \
  r-base-dev \
  sudo \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-latex-base \
  texlive-latex-extra \
  texlive-latex-recommended  \
  vim-nox \
  virtualenvwrapper \
  wget \
  && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
  && apt-get install git-lfs \
  && git lfs install \
  && apt-file update \
  && apt-get clean

# use US letter paper size
RUN paperconfig -p letter

#  R package installs need TMPDIR on "hard drive"
RUN mkdir -p /TMPDIR
RUN chmod a+rwx /TMPDIR
ENV TMPDIR /TMPDIR

# set R site profile
COPY Rprofile.site /etc/R/

# set up two-job makes for R packages
RUN sed -i "s;^MAKE.*$;MAKE='make -j 2';" /etc/R/Renviron

# fetch the RStudio Server install and start scripts
COPY *rstudio-*.bash /usr/local/src/
RUN chmod +x /usr/local/src/*rstudio-*.bash

# update system library packages
RUN R -e "update.packages(ask = FALSE, quiet = TRUE)"

# create non-root user for day-to-day work
# note: you will need to set a password for this user
RUN useradd -c "DFS Tools" -u 1000 -G sudo -s /bin/bash -m dfstools

# make a desktop and put some files on it
RUN mkdir -p /home/dfstools/Projects
RUN mkdir -p /home/dfstools/Scripts
RUN mkdir -p /home/dfstools/Jupyter
COPY *.R /home/dfstools/Scripts/
COPY *jupyter.bash /home/dfstools/Scripts/
RUN chown -R dfstools:dfstools /home/dfstools/

# install new R packages in 'dfstools' personal library
USER dfstools
WORKDIR /home/dfstools

# create an empty library
RUN R --no-save < `R RHOME`/etc/Rprofile.site

# install platform tools
RUN R --no-save < /home/dfstools/Scripts/platform.R

# set up server run-time
WORKDIR /home/dfstools
EXPOSE 7777
EXPOSE 7878
CMD /bin/bash
