#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3.0

# symbols
export STABLE='curl -Ls https://www.rstudio.com/products/rstudio/download-server/'
export PREVIEW='curl -Ls https://www.rstudio.com/products/rstudio/download/preview/'
export AMD64='grep amd64.deb'
export LTRIM='s;^.*href=";;'
export RTRIM='s;amd64.deb.*$;amd64.deb;'
export STABLE_SERVER=`${STABLE}|${AMD64}|grep -i server|grep -v pro|sed ${LTRIM}|sed ${RTRIM}`
export PREVIEW_SERVER=`${PREVIEW}|${AMD64}|grep -i server|grep -v pro|sed ${LTRIM}|sed ${RTRIM}`
export SERVER=${STABLE_SERVER}
#export SERVER=${PREVIEW_SERVER}
export PACKAGE=`echo ${SERVER}|sed 's;^.*rstudio-;rstudio-;'`

# get into neutral territory, since we're root
mkdir -p /usr/local/src
pushd /usr/local/src

## install RStudio® Server
rm -f ${PACKAGE}
wget -q ${SERVER}
gdebi --non-interactive ${PACKAGE}

# change the port to avoid conflict with any local RStudio Server
echo "www-port=7878" >> /etc/rstudio/rserver.conf
rstudio-server verify-installation

popd

# About the trademarks:
#   https://www.rstudio.com/about/trademark/
# RStudio Server documentation:
#   https://support.rstudio.com/hc/en-us/sections/200150693-RStudio-Server
# Getting started:
#   https://support.rstudio.com/hc/en-us/articles/200552306-Getting-Started
# Configuring the server:
#   https://support.rstudio.com/hc/en-us/articles/200552316-Configuring-the-Server
# Managing the server:
#   https://support.rstudio.com/hc/en-us/articles/200532327-Managing-the-Server
