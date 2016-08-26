#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: AGPL-3

# Jupyter itself
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
rmvirtualenv jupyter
mkvirtualenv -p /usr/bin/python3 jupyter
workon jupyter

pip install --upgrade pip
pip install jupyter
pip install ipyparallel
pip install virtualenvwrapper

# R kernel
R -e "IRkernel::installspec()"

# create IPyParallel profile
mkdir -p ~/.ipython/profile_default

# extensions
# see https://github.com/ipython/ipyparallel/issues/170
jupyter serverextension enable --py ipyparallel --user
jupyter nbextension install --py ipyparallel --user 
jupyter nbextension enable --py ipyparallel --user
