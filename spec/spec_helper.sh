# shellcheck shell=sh

# Defining variables and functions here will affect all specfiles.
# Change shell options inside a function may cause different behavior,
# so it is better to set them here.
set -euo pipefail

# This callback function will be invoked only once before loading specfiles.
spec_helper_precheck() {
  # Available functions: info, warn, error, abort, setenv, unsetenv
  # Available variables: VERSION, SHELL_TYPE, SHELL_VERSION
  : minimum_version "0.28.1"
}

# This callback function will be invoked after a specfile has been loaded.
spec_helper_loaded() {
  :
  if [ "${APASH_TEST_MINIFIED:-}" != "true" ]; then
    . "$APASH_HOME_DIR/apash.source"
    apash.import fr.hastec.apash.commons-lang.VersionUtils.isLowerOrEquals
  else
    . "$APASH_HOME_DIR/bin/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF"
}

# This callback function will be invoked after core modules has been loaded.
spec_helper_configure() {
  # Available functions: import, before_each, after_each, before_all, after_all
  : import 'support/custom_matcher'
}

global_helper_is_zsh(){
  [ "$APASH_SHELL" = "zsh" ] && return "$APASH_SUCCESS" || return "$APASH_FAILURE"
}

global_helper_is_bash(){
  [ "$APASH_SHELL" = "bash" ] && return "$APASH_SUCCESS" || return "$APASH_FAILURE"
}

global_helper_is_ksh(){
  [ "$APASH_SHELL" = "ksh" ] && return "$APASH_SUCCESS" || return "$APASH_FAILURE"
}


global_helper_is_shell_version_lower(){
  [ "$APASH_SHELL" != "${1:-}" ] && return "$APASH_FAILURE"
  VersionUtils.isLowerOrEquals "$APASH_SHELL_VERSION" "${2:-}" && return "$APASH_SUCCESS"
}
