#!/bin/bash

# install pip for py3
sudo apt-get install python3-pip

# install maven for java & scala
jenv install maven

# install glide for now
sudo add-apt-repository ppa:masterminds/glide && sudo apt-get update && sudo apt-get install glide
