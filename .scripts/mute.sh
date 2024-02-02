#!/bin/bash
amixer get Master | tail -1 | awk '{print $6}'| grep -P -o '\w{1,}' | xargs -I{} notify-send "Volume: {}"

