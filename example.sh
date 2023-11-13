#!/bin/bash

set -e

test_var="foo"

# Testing behavir of the new scrit
echo ${test_var}

function loading_icon() {
    local load_interval="${1}"
    local loading_message="${2}"
    local elapsed=0
    local loading_animation=( '—' "\\" '|' '/' )

    echo -n "${loading_message} "

    # This part is to make the cursor not blink
    # on top of the animation while it lasts
    tput civis
    trap "tput cnorm" EXIT
    while [ "${load_interval}" -ne "${elapsed}" ]; do
        for frame in "${loading_animation[@]}" ; do
            printf "%s\b" "${frame}"
            sleep 0.25
        done
        elapsed=$(( elapsed + 1 ))
    done
    printf " \b\n"
}

function loadind_icon2() {
    local load_interval="${1}"
    local loading_message="${2}"
    local elapsed=0
    tput civis
    trap "tput cnorm" EXIT

    while [ "${load_interval}" -ne "${elapsed}" ]; do
        # Frame #1
        printf "\r< %s " "${loading_message}"
        sleep 0.5
        # Frame #2
        printf "\r> %s " "${loading_message}"
        sleep 0.5

        elapsed=$(( elapsed + 1 ))
    done

    printf " \b\n"
}



loading_icon 5 "I'm loading!"

loadind_icon2 5 "Hehe, loading again!"
