#!/usr/bin/env bash

die() {
  echo "! $1 " >&2
  echo "! -----------------------------" >&2
  exit 1
}

# Get the type of shell (only bash and zsh supported for the moment). Skipped if already defined.
[ -z "$APASH_SHELL" ] && [ -n "$BASH_VERSION" ] && export APASH_SHELL="bash"
[ -z "$APASH_SHELL" ] && [ -n "$ZSH_VERSION"  ] && export APASH_SHELL="zsh"

# Prevent execution if declared APASH_SHELL is not supported.
if [ ! "$APASH_SHELL" = "bash" ] && [ ! "$APASH_SHELL" = "zsh" ];then
  die "$(date +"%FT%T.%3N%z") [FATAL] apash ($LINENO): The apash shell '$APASH_SHELL' is not supported"
fi

# Redirect to the desired interpreter.
"$APASH_HOME_DIR/utils/uninstall.$APASH_SHELL"
