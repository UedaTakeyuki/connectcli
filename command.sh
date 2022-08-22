#!/bin/bash

echo command start with $1
case $1 in
 0) sudo reboot ;;
 1) sudo shutdown -h 0 ;;
 2) vmstat ;;
 3) df ;;
esac
