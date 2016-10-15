#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3.0

apt-get update \
  && apt-get install -qqy --no-install-recommends \
  texmaker \
  texlive-full \
  && apt-file update \
  && apt-get clean
