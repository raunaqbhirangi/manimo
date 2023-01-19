#! /bin/sh

# Install polymetis from source
cd ..
git clone git@github.com:facebookresearch/fairo.git
cd fairo/polymetis

# This script sets up the environment for manimo. It is meant to be sourced
conda env create -f ./polymetis/environment.yml -n manimo
conda activate manimo
pip install -e ./polymetis
pip install gym
pip install hydra-core==1.2.0
pip install dm-control
pip install dm-robotics-moma
pip install protobuf==3.20.3

# Build libfranka
./scripts/build_libfranka.sh

mkdir -p ./polymetis/build
cd ./polymetis/build

cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_FRANKA=OFF -DBUILD_TESTS=OFF -DBUILD_DOCS=OFF
make -j 2
