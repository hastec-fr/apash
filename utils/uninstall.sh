#!/usr/bin/env bash

die() {
  echo "!! $1 " >&2
  echo "!! -----------------------------" >&2
  exit 1
}

## stop if apash is not installed
[[ -d "$HOME/.apash" ]] || die "apash doesn't seem to be installed on [$HOME/.apash]"
echo ". Remove apash code"
[ -d "$HOME/.apash" ] && rm -fr "$HOME/.apash"

## now check what shell is running
shell_type=$(basename "$SHELL")
case "$shell_type" in
bash)  startup_script="$HOME/.bashrc" ;;
zsh)   startup_script="$HOME/.zshrc"  ;;
sh)    startup_script="$HOME/.profile";;
*)     startup_script="" ;   ;;
esac

## startup script should exist already
[[ -n "$startup_script" && ! -f "$startup_script" ]] && die "startup script [$startup_script] does not exist"

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