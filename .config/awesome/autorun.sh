#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
~/Programs/Telegram/Updater
~/.bin/sh/set_hd.sh
run $1
