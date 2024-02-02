#!/bin/bash
amixer get Master | tail -1 | awk '{print $5}'|grep -P -o '\d{1,3}'% | xargs -I{} notify-send "Volume: {}"

