#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3.0

echo "Stopping RStudio Server"
rstudio-server stop
echo "Starting RStudio Server undaemonized"
/usr/lib/rstudio-server/bin/rserver --server-daemonize=0
