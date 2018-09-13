#!/bin/bash

cd ~/PycharmProjects/md_utils/
python setup.py sdist
pip install --upgrade dist/* --user
cd -
