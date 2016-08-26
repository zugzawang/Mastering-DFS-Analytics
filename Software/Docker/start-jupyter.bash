#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3

# get rid of left-over PID files if any
rm -f ~/.ipython/profile_default/pid/*.pid

source ~/.virtualenvs/jupyter/bin/activate
jupyter notebook --port=7777 --ip=0.0.0.0 --no-browser
