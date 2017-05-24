# DFSTOOLS - Copyright (C) 2017 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3

FROM docker.io/ubuntu:xenial
MAINTAINER M. Edward (Ed) Borasky <znmeb@znmeb.net>

# Install base Ubuntu packages
RUN \
  echo 'deb http://cran.rstudio.com/bin/linux/ubuntu xenial/' >> /etc/apt/sources.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 \
  && apt-get update \
  && apt-get install -qqy --no-install-recommends \
  build-essential \
  bzip2 \
  curl \
  git \
  r-base \
  r-base-dev \
  software-properties-common \
  vim-tiny \
  virtualenvwrapper \
  wget \
  && add-apt-repository -y ppa:marutter/rrutter \
  && add-apt-repository -y ppa:marutter/c2d4u \
  && add-apt-repository -y ppa:staticfloat/juliareleases \
  && apt-get update \
  && apt-get install -qqy --no-install-recommends \
  julia \
  r-cran-devtools \
  && apt-get clean

# Install the rest of the system-level components
RUN mkdir -p /TMPDIR
COPY Rprofile.site /etc/R/
RUN \
  R -e "install.packages(c('repr', 'IRdisplay'), quiet = TRUE)" \
  && R -e "devtools::install_github('IRkernel/IRkernel', quiet = TRUE)" \
  && useradd -c "DFS Analytics Toolbox" -u 1000 -s /bin/bash -m dfstools

# Install user components
ENV \
  DFSTOOLS_HOME=/home/dfstools \
  VIRTUALENVWRAPPER_SCRIPT=/usr/share/virtualenvwrapper/virtualenvwrapper.sh \
  PROJECT_HOME=/home/dfstools/Projects \
  WORKON_HOME=/home/dfstools/.virtualenvs \
  JUPYTER=/home/dfstools/.virtualenvs/dfstools/bin/jupyter
USER dfstools
WORKDIR $DFSTOOLS_HOME
RUN mkdir -p $PROJECT_HOME
SHELL [ "/bin/bash", "-c" ]
RUN \
  source $VIRTUALENVWRAPPER_SCRIPT \
  && mkvirtualenv --python=/usr/bin/python3 dfstools \
  && pip3 install jupyter virtualenvwrapper ipyparallel \
  && ipcluster nbextension enable --user \
  && julia -e 'Pkg.add("IJulia")' \
  && R -e 'IRkernel::installspec()' \
  && echo "source $VIRTUALENVWRAPPER_SCRIPT" >> ~/.bashrc

# Expose notebook port and declare volume
ENV NOTEBOOK_PORT=8888
EXPOSE $NOTEBOOK_PORT
VOLUME $PROJECT_HOME

# Collect scripts
USER root
RUN mkdir -p /Scripts
COPY Scripts/*.bash /Scripts/
