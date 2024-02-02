#!/bin/bash
brightnessctl | grep -P -o '\d{1,3}%' | xargs -I{} notify-send "Brightness: {}"
