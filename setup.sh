#!/bin/bash

################################################################
# 
# Connect client setup script
# 
# usage: ./autostart.sh --on/--off
#
#
# @author Dr. Takeyuki UEDA
# @copyright Copyright© Atelier UEDA 2022 - All rights reserved.
#

# 
SCRIPT_DIR=$(cd $(dirname $0); pwd)
CMD=connectcli

# download connectcli
curl https://assets.uedasoft.com/connectcli/connectcli@ARMlatest -o connectcli -l
chmod +x connectcli

# create connectcli.service file
sed -e "s@^WorkingDirectory=.*@WorkingDirectory=${SCRIPT_DIR}@" \
    -e "s@^ExecStart=.*@ExecStart=${SCRIPT_DIR}/${CMD}@" \
    -e "s@PIDFile=/var/run/.*@PIDFile=/var/run/${CMD}.pid@" ${CMD}.service.org > ${CMD}.service
