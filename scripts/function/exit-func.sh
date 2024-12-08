#!/bin/bash

check_home_dir() {
  echo $HOME
  test -d "$HOME"a || exit 1
}
check_home_dir
exit 0
