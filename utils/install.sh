#!/usr/bin/env bash
set -e

die() {
  echo "!! $1 " >&2
  echo "!! -----------------------------" >&2
  exit 1
}

## stop if apash is already installed
[[ -d "$HOME/.apash" ]] && die "apash is already installed on [$HOME/.apash]"

## stop if git is not installed
git version >/dev/null 2>&1 || die "git is not installed on this machine"

## install the project on ~/.apash
echo ". Download apash code to ~/.apash"
git clone https://github.com/hastec-fr/apash.git ~/.apash 2> /dev/null

## now check what shell is running
shell_type=$(basename "$SHELL")
echo ". Detected shell type: $shell_type"
case "$shell_type" in
bash)  startup_type="simple" ; startup_script="$HOME/.bashrc" ;;
zsh)   startup_type="simple" ; startup_script="$HOME/.zshrc"  ;;
sh)    startup_type="simple" ; startup_script="$HOME/.profile";;
*)     startup_type="?"      ; startup_script="" ;   ;;
esac

## startup script should exist already
[[ -n "$startup_script" && ! -f "$startup_script" ]] && die "startup script [$startup_script] does not exist"

## basher_keyword will allow us to remove the lines upon uninstall
apash_keyword="apashInstallTag"

echo ". Add apash initialisation to [$startup_script]"

## now add the apash initialisation lines to the user's startup script
echo ". Add apash initialisation to [$startup_script]"
if [[ "$startup_type" == "simple" ]]; then
  (
    echo "export APASH_HOME_DIR=\"\$HOME/.apash\"   ##$apash_keyword"
    echo "export PATH=\"\$PATH:\$APASH_HOME_DIR\"   ##$apash_keyword"
    echo ". \"\$APASH_HOME_DIR/apash\"              ##$apash_keyword"
  ) >>"$startup_script"
else
  die "unknown shell [$shell_type] - can't initialise"
fi

## script is finished
echo "Apash is installed - open a new terminal window to start using it"
