#!/bin/sh

swayidle -w \
    timeout 300 'swaylock -f' \
    timeout 360 'niri msg output dpms=off' \
    resume       'niri msg output dpms=on'
