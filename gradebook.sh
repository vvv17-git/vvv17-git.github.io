#!/bin/bash

# Copyright: (C) 2016 iCub Facility - Istituto Italiano di Tecnologia
# Authors: Ugo Pattacini <ugo.pattacini@iit.it>
# CopyPolicy: Released under the terms of the GNU GPL v3.0.

# Dependencies (through apt-get):
# - curl
# - jq

org=vvv17-git
team=vvv17-teachers
curdir=$(pwd)

if [ -d build ]; then
    rm -Rf build
fi
mkdir build && cd build

git clone --depth 1 -b master https://github.com/vvv-school/vvv-school.github.io.git helpers
if [ $? -ne 0 ]; then
    echo "GitHub seems unreachable"
    exit 1
fi

./helpers/scripts/gradebook.sh $org $team $curdir $curdir/build
