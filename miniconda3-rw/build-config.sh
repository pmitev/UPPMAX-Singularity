#!/bin/bash

# build an image
sudo singularity build conda.sif Singularity.conda

# make a backup copy
cp -a conda.sif conda.sif.bak

# Add an overlay for the config
singularity overlay create --size 1024 --create-dir /opt/conda/pkgs conda.sif


