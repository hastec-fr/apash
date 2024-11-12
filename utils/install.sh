#!/usr/bin/env bash
# Inspired from basherpm install: https://github.com/basherpm/basher/blob/master/install.sh
set -e

die() {
  echo "! $1 " >&2
  echo "! -----------------------------" >&2
  exit 1
}

## stop if apash is already installed.
[[ -d "$HOME/.apash" ]] && die "apash is already installed on [$HOME/.apash]"

## stop if git is not installed.
git version >/dev/null 2>&1 || die "git is not installed on this machine"

## install the project on ~/.apash.
echo ". Download apash code to $HOME/.apash"

# Add capability to point on a desired git revision.
if [ -n "$APASH_INSTALL_VERSION" ]; then
  git clone -b "$APASH_INSTALL_VERSION" https://github.com/hastec-fr/apash.git "$HOME/.apash" 2> /dev/null
else
  git clone https://github.com/hastec-fr/apash.git "$HOME/.apash" 2> /dev/null
fi

## Now check what shell is running.
if [ -n "$BASH_VERSION" ]; then    
  shell_type="bash"
  shell_version="$BASH_VERSION"
elif [ -n "$ZSH_VERSION" ]; then
  shell_type="zsh"
  shell_version="$ZSH_VERSION"
fi
echo ". Detected shell type: $shell_type"
case "$shell_type" in
bash)  startup_script="$HOME/.bashrc" ;;
zsh)   startup_script="$HOME/.zshrc"  ;;
*)     startup_script=""              ;;
esac

## Startup script should exist already, if not then remove new cloned directory.
if [[ -n "$startup_script" && ! -f "$startup_script" ]]; then
  rm -r "$HOME/.apash"
  die "startup script [$startup_script] does not exist"
fi

## Apash_keyword will allow us to remove the lines upon uninstall.
apash_keyword="apashInstallTag"

## Now add the apash initialisation lines to the user's startup script.
echo ". Add apash initialisation to [$startup_script]"
(
  echo ". \"\$HOME/.apash/.apashrc\"         ##$apash_keyword"
  echo ". \"\$APASH_HOME_DIR/apash\" source  ##$apash_keyword"
) >>"$startup_script"

## Script is finished.
echo "Apash is installed - OPEN A NEW terminal window to start using it:"
echo "apash.import fr.hastec.apash.commons-lang.StringUtils.upperCase"
echo "StringUtils.upperCase \"Do or Do not. There is no try.\""
