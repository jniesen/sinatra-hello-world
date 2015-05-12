#!/usr/bin/env bash

install_dependencies() {
  bundle install --path vendor/gems --binstubs
}

check_gems() {
  bundle check > /dev/null 2>&1
  echo $?
}

nothing_to_install() {
  local status=$(check_gems)

  if [ $status -eq 0 ] 
  then
    printf "Good to go!\n"
  fi

  return $status
}

manage_dependencies() {
  nothing_to_install \
    || install_dependencies
}

main() {
  manage_dependencies
}

main
