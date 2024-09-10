#!/usr/bin/env bash

chechApashSourced() {
  echo "$0"
    # Check if the script is being sourced
  case "$0" in
      -sh|-dash|-bash|-ksh)
          echo "Yes"
          ;;
      *)
          echo "no"
          ;;
  esac
}

chechApashSourced

