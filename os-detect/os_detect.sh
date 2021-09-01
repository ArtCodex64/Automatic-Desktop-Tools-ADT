#!/bin/bash

os="$(hostnamectl | grep "Operating System" | awk '{print $3}')"

if [[ $os == *arch* ]];then
  operating_system="arch"
elif [[ $os == *Arch* ]];then
  operating_system="arch"
elif [[ $os == *ubuntu* ]];then
  operating_system="ubuntu"
elif [[ $os == *Ubuntu* ]];then
  operating_system="ubuntu"
elif [[ $os == *debian* ]];then
  operating_system="debian"
elif [[ $os == *Debian* ]];then
  operating_system="debian"
elif [[ $os == *parrot* ]];then
  operating_system="parrot"
elif [[ $os == *Parrot*  ]];then
  operating_system="parrot"
fi
