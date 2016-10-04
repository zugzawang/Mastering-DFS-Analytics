#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3.0

echo "Stopping existing RStudio Server if any"
rstudio-server stop
echo "Starting RStudio Server undaemonized"
echo "Ctl-C to stop"
/usr/lib/rstudio-server/bin/rserver --server-daemonize=0
echo "Exiting - please wait"
