#!/bin/bash

function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}


WORKSPACE=$( (gen_workspaces)  | rofi -width 10 -font 'Terminus 12' -dmenu -p "WS")

i3-msg move container to workspace "${WORKSPACE}"
