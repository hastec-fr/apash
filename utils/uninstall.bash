#!/usr/bin/env bash

die() {
  echo "! $1 " >&2
  echo "! -----------------------------" >&2
  exit 1
}

APASH_HOME_DIR="${APASH_HOME_DIR:-"$HOME/.apash"}"
[ -z "${APASH_HOME_DIR}" ] && die "apash home directory is empty."

## stop if apash is not installed
[ -d "${APASH_HOME_DIR}" ] || die "apash doesn't seem to be installed on [${APASH_HOME_DIR}]."
echo ". Remove apash code"
if [ -d "${APASH_HOME_DIR}" ]; then
  rm -fr "${APASH_HOME_DIR}" || die "apash cannot be removed [${APASH_HOME_DIR}]."
fi

## Now check what shell is running.
[ -z "$APASH_SHELL" ] && [ -n "$BASH_VERSION" ] && export APASH_SHELL="bash"
[ -z "$APASH_SHELL" ] && [ -n "$ZSH_VERSION"  ] && export APASH_SHELL="zsh"

## now check what shell is running
case "$APASH_SHELL" in
bash)  startup_script="$HOME/.bashrc" ;;
zsh)   startup_script="$HOME/.zshrc"  ;;
*)     startup_script="" ;   ;;
esac

## startup script should exist already
[ -n "$startup_script" ] && [ ! -f "$startup_script" ] && die "startup script [$startup_script] does not exist."

## apash_keyword will allow us to remove the lines upon uninstall
apash_keyword="apashInstallTag"

echo ". Following apash folders are in your path:"
echo "$PATH" | tr ':' "\n" | grep apash

if grep -q "$apash_keyword" "$startup_script" ; then
  backup_script="${startup_script}_$(date +"%Y%m%d%H%M%S")"
  echo ". Backup startup script (to remove manually): $backup_script"
  cp "$startup_script" "$backup_script"
  echo ". Remove apash from startup script [$startup_script]"
  sleep 1
  # sed -i not always available.
  < "$backup_script" grep -v "$apash_keyword" > "$startup_script"
elif grep -q apash "$startup_script" ; then
    grep apash "$startup_script"
    die "Can't auto-remove the lines from $(basename "$startup_script") - please do so manually "
else
    die "Can't find initialisation commands for apash"
fi

## script is finished
echo "apash is uninstalled"
