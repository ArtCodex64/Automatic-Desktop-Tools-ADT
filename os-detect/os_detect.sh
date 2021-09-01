#!/bin/bash

os="$(uname -r)"

if [[ $os == *arch* ]];then
  operating_system="arch"
elif [[ $os == *ubuntu* ]];then
  operating_system="ubuntu"
elif [[ $os == *debian* ]];then
  operating_system="debian"
elif [[ $os == *parrot* ]];then
  operating_system="parrot"
fi
