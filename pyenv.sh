#!/bin/bash

pip install virtualenv virtualenvwrapper

envwrapperpath=$(which virtualenvwrapper.sh)

# active envwrapper
source $envwrapperpath

# make and work on personal dev env
mkvirtualenv persoanl_dev
workon personal_dev

# install required package
pip install -r requirements.txt
