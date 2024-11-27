#!/usr/bin/env bash

##############################################################################
# @name apash.bash
# @brief Main script managing the script libraries.
# @description
#     apash is the entry point for executing action related to
#     the project. The following action are possible:
#     * doc:    Generate the documentation of Apash.
#
#     * init:   Initialize apash sourcing in startup script.
#
#     * source: Default action which source the main function 
#               allowing to import library scripts.
#
#     * test:   Launch the unitary test campaign.
#
#  Logic:
#    Apash parses the command line in three steps:
#       1. Parse the global arguments which should be applied on the command.
#       2. Parse the action to realize.
#       3. Parse the arguments of the action and execute it.
#    Once the command line is parsed, the action is executed (only one).
#   
#   The code is split in 4 levels to execute the logic:
#   0. apashExecuteCommand (Embedded main execution flow)
#     1.|-> apashParseCommandArgs
#     1.|-> apashExecuteAction
#         2.|-> apashExecute<Action>
#             3.|-> apashParse<Action>Args
#             3.|-> Execute related subactions
#
#   This source is not essential thereafter, because the main concept is to
#   load other scripts as librairy ready to use (Source then forget).
#   
#   Note: POSIX operations as much as possible in this script.
#
# Helps ######################################################################
apashShowHelp(){
  cat << EOF
  Usage: ${0##*/} [-h|--help] [--version] ACTION [ACTION_ARGS]

  Apash command line wrapping actions for enabling features, generating
  documentation or executing tests.
  
      -h|--help|-?      display this help and exit.
      --version         display the current version of apash and exit.

  ACTIONS:
      cache             Create the cache file associated to the input library.

      check             Check if some command could be missing and
                        trigger a degraded mode.

      doc               Generate documentations relative to apash.
                        Prerequisite: shdoc is avaiable.

      docker            Build and run a container according to 
                        a shell version.

      help              Display information about a method.

      source            Source the apash.source root script for current shell.
      
      test              Execute the set of unitary tests.

  GETTING STARTED:
    First, source apash by using the source main script or not passing any args:    
        $ . \$APASH_HOME_DIR/apash.source       # "$" is the prompt
    
    Thereafter, libraries can be imported and used as following:
        $ apash.import fr.hastec.apash.commons-lang.StringUtils.indexOf
        $ StringUtils.indexOf "Gooood Morning" "M"
        # Result: 7
EOF
}

apashShowCheckHelp(){
  cat << EOF
  Usage: ${0##*/} cache [-h] [library]

  Create the cache file associated to the input library.
  If no library provided, then create a cache for all.
  
      -h|--help|-?      Display this help and exit.

EOF
}


apashShowCheckHelp(){
  cat << EOF
  Usage: ${0##*/} check [-h]

  Check if some command could be missing and trigger a degraded mode.
  
      -h|--help|-?      Display this help and exit.

EOF
}

apashShowDocHelp(){
  cat << EOF
  Usage: ${0##*/} doc [-h]

  Generate the documentation (in markdown format) based on the comments.
  
      -h|--help|-?      Display this help and exit.

EOF
}

apashShowDockerHelp(){
  cat << EOF
  Usage: ${0##*/} docker [-h] [-b|--build] [-s shell] [-v version]

  Create and run a container for a specific shell or version.
  By default, it builds the image before run.
  
      -h|--help|-?      Display this help and exit.
      -nb|--no-build    No build of the image.
      -nr|--no-run      No run of the container.
      -s|--shell        Shell name of the image (bash|zsh).
      -v|--version      Version of the shell image.
  
  Images get the current \$APASH_HOME_DIR content as context.
  Images are named as following:
  hastec/apash[-local]:<\$APASH_VERSION>-<shell>_<shell_version>

  Images are created on top of the following:
  bash: bash         (https://hub.docker.com/_/bash/)
  zsh:  zshusers/zsh (https://hub.docker.com/r/zshusers/zsh)
  
  Example:
  # Build and run the container for bash 4.3.
  $ apash docker -s bash -v 4.3

  # Just run the version 5.9 of zsh.
  $ apash docker --build -s zsh -v 5.9
EOF
}

apashShowHelpHelp(){
  cat << EOF
  Usage: ${0##*/} help [-h] [file|function]

  Show the console help of the markdown comments.
  
      -h|--help|-?      Display this help and exit.
  
  First it check that argument is a file, otherwise
  it tries to find it in \$APASH_HOME_DIR/src.
  
  Example:
  $ apash help ./src/fr/hastec/apash/util/Math/abs.sh
  $ apash help Math.abs
EOF
}

apashShowInitHelp(){
  cat << EOF
  Usage: ${0##*/} init [-h] [--post-install]

  Add necessary line to startup script for apash usage
  
      -h|--help|-?      Display this help and exit.
      --post-install    Add necessary lines in startup script

  Example:
  $ apash init --post-install
  Lines added to the startup up script (like \$HOME/.bashrc) with tags:
    #apashInstallTag

  Open another terminal again to ensure that environment is well loaded.

EOF
}

apashShowSourceHelp(){
  cat << EOF
  Usage: ${0##*/} source [-h]

  Source the script with essential apash variables (apash.source).
  
      -h|--help|-?      Display this help and exit.

EOF
}

apashShowMinifyHelp(){
  cat << EOF
  Usage: ${0##*/} minify [-h]

  Minify all scripts into a single file ready to source.
  All apash.imports are removed.

      -h|--help|-?      Display this help and exit.

EOF
}

apashShowTestHelp(){
  cat << EOF
  Usage: ${0##*/} test [-h] [--test-options options] [--] [test paths]

  Execute unitary tests contained in the test directory.
  
      -h|--help|-?      Display this help and exit.
      --test-options    Options in a single argument for shellspec.
      --minified|-mn    Use minified version of apash.
      --compatibility   Launch the campaign of test to generate the
                        compatibility matrix.

  By default the shellspec command looks like:
  $ shellspec --shell bash spec/

  Example to override shellspec options:
  $ apash test --test-options "--shell bash --format tap" "\$APASH_HOME_DIR/spec"

  Example to select some tests:
  $ apash test \$APASH_HOME_DIR/spec/fr/hastec/apash/lang/Math/*.sh

  PREREQUISITES: shellspec must be installed.
  Example:
  $ curl -fsSL https://git.io/shellspec | sh -s -- --yes
  
  # Open another terminal again to ensure that environment is well loaded.
EOF
}

# LEVEL 0 - Embedded main execution flow #######################################
# @name apashExecuteCommand
# @description
#    Parse and Execute apash command.
#    Embedded main flow to prevent usage of exit statement
#    which quit the current session in case of sourcing.
apashExecuteCommand(){
  # If the current shell is not identified, then exit.
  if [ "$APASH_SHELL" != "bash" ] && [ "$APASH_SHELL" != "zsh" ]; then
    echo "Not supported shell for the moment." >&2
    return
  fi

  # Source main apash script if no argument has been passed.
  if [ $# -eq 0 ]; then
    # shellcheck disable=SC1091
    . "$APASH_HOME_DIR/src/fr/hastec/apash.sh" && return
  fi

  apashParseCommandArgs "$@"
  shift "${APASH_NB_ARGS:-0}"
  [ "$APASH_EXIT_REQUIRED" = "true" ] && return

  apashExecuteAction "$@"
}

# LEVEL 1 - Apash main command ###############################################
# @name apashParseCommandArgs
# @brief Parse the main arguments of the command line.
# @see Technical way to parse: https://mywiki.wooledge.org/BashFAQ/035
apashParseCommandArgs(){
  while :; do
    # Check if the argument is still an option
    case $1 in
      "-"*) ;;
        *) break ;;
    esac

    case $1 in
      # Show helps
      -h|-\?|--help)
        show_help
        APASH_EXIT_REQUIRED=true && return        
        ;;

      # Show the version of the scipts
      --version)
        echo "$APASH_VERSION"
        APASH_EXIT_REQUIRED=true && return
        ;;

      # End of all options.
      --)             
        shift && APASH_NB_ARGS=$(( APASH_NB_ARGS + 1 ))
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        APASH_EXIT_REQUIRED=true && return
        ;;

      # Stop parsing
      *)  # Default case: No more options, so break out of the loop.
        break
    esac
    shift && APASH_NB_ARGS=$(( APASH_NB_ARGS + 1 ))
  done
}

apashExecuteAction(){
  local action="${1:-}"
  shift
  case "$action" in
    cache)
      apashExecuteCache "$@"
      ;;

    check)
      apashExecuteCheck "$@"
      ;;

    doc)
      apashExecuteDoc "$@"
      ;;

    docker)
      apashExecuteDocker "$@"
      ;;

    help)
      apashExecuteHelp "$@"
      ;;

    init)
      apashExecuteInit "$@"
      ;;
    
    minify)
      apashExecuteMinify "$@"
      ;;

    source)
      apashExecuteSource "$@"
      ;;

    test)
      apashExecuteTest "$@"
      ;;

    -?*)
      printf 'WARN: Unknown action: %s\n' "${1:-}" >&2
      APASH_EXIT_REQUIRED=true && return
      ;;
  esac
}


# LEVEL 2 - Actions ##########################################################
apashExecuteCache(){
    apashParseCheckArgs "$@" || return
    apash.import -f "fr/hastec/apash.cache"
    shift $APASH_NB_ARGS
    echo "This operation could take few minutes..."
    apash.cache "$@"
}

apashExecuteCheck(){
    apashParseCheckArgs "$@" || return
    apash.import -f "fr/hastec/apash.check"
    apash.check
}

apashExecuteDoc(){
    apashParseDocArgs "$@" || return
    apash.import -f "fr/hastec/apash.doc"
    if [ -z "$APASH_HOME_DIR" ] || [ ! -d "$APASH_HOME_DIR" ]; then
      echo "This operation is not allowed when the APASH directory does not exists"
      APASH_EXIT_REQUIRED=true && return
    fi
    # @todo: put a progress bar.
    # @todo: Allow to generate only one doc.
    echo "This operation could take few minutes..."
    (cd "$APASH_HOME_DIR" && apash.doc)
}

apashExecuteDocker(){
  local APASH_DOCKER_NO_BUILD_FLAG=false
  local APASH_DOCKER_NO_RUN_FLAG=false
  local APASH_DOCKER_SHELL="bash"
  local APASH_DOCKER_SHELL_VERSION="5.2"
  local apashDockerSudo

  apashParseDockerArgs "$@" || return
  [ "$APASH_DOCKER_SUDO" = "true" ] && apashDockerSudo="sudo"
  [ -n "$apashDockerSudo" ] && echo "Enter password for docker usage (if necessary)."

  # @todo: Find an elegant way to disable the --no-cache option (zsh protect evaluation).
  # Build the container
  if [ "$APASH_DOCKER_NO_BUILD_FLAG" != "true" ]; then
    $apashDockerSudo docker build  \
      --build-arg "SHELL_VERSION=${APASH_DOCKER_SHELL_VERSION}"                             \
      --build-arg "APASH_LOCAL_COPY=true"                                                   \
      -t "hastec/apash-local:${APASH_VERSION}-${APASH_DOCKER_SHELL}_${APASH_DOCKER_SHELL_VERSION}" \
      -f "$APASH_HOME_DIR/docker/apash-${APASH_DOCKER_SHELL}.dockerfile" "$APASH_HOME_DIR"
  fi

  # Run the container and provides arguments.
  if [ "$APASH_DOCKER_NO_RUN_FLAG" != "true" ]; then
    $apashDockerSudo docker run -it --rm "hastec/apash-local:${APASH_VERSION}-${APASH_DOCKER_SHELL}_${APASH_DOCKER_SHELL_VERSION}"
  fi
}

apashExecuteHelp(){
  local APASH_HELP_FILE=""
  apashParseHelpArgs "$@" || return
  shift $APASH_NB_ARGS
  APASH_HELP_FILE="${1:-}"
  
  # @todo: Create a mapping because the time to retrieve the file could increase.
  # Check if it's a file with .sh extension which is searched.
  if [ ! -f "$APASH_HELP_FILE" ]; then
    if [[ $APASH_HELP_FILE =~ ^[a-zA-Z_]+\.sh$ ]] ; then
      APASH_HELP_FILE="$(find "$APASH_HOME_DIR/src" -iname "$APASH_HELP_FILE")"
    # Or the Class.Method .
    elif [[ $APASH_HELP_FILE =~ ^([a-zA-Z_]+)\.[a-zA-Z_]+$ ]] ; then
      local class=${APASH_HELP_FILE%.*}
      local method=${APASH_HELP_FILE#*.}
      APASH_HELP_FILE="$(find "$APASH_HOME_DIR/src" -iname "$method.sh" -ipath "*/$class/$method.sh" -print -quit)"
    elif [[ $APASH_HELP_FILE =~ ^[a-zA-Z_]+$ ]]; then
    # Or any single method.
      APASH_HELP_FILE="$(find "$APASH_HOME_DIR/src" -iname "$APASH_HELP_FILE.sh")"
    fi
  fi

  if [ ! -f "$APASH_HELP_FILE" ]; then
    echo "The function cannot be found. Please provide the \"Class.method\" you research." 2> /dev/null
    return $APASH_FAILURE
  fi
  
  echo "# @file $APASH_HELP_FILE"
  # Print piece of markdown from the desired method.
  awk '
  BEGIN                        { printFlag=0; printArgs=0 }
  /^\s*#\s*@name/              { print $0; next }
  /^\s*#\s*@brief/             { print $0; next }
  /^\s*#\s*@description/       { printFlag=1 }
  /^\s*#[ #]*Arguments/        { print $0; printArgs=1; next }
  (printArgs || printFlag) &&
  /^\s*#[\s#]*$/               { printFlag=0; printArgs=0; print ; next}
  printFlag                    { print $0 }
  printArgs {              
              n = split($0, arr, "|")
              print "#" arr[2] "|" (arr[4]) "|" arr[7]
            }
  ' "$APASH_HELP_FILE" && return $APASH_SUCCESS
  return $APASH_FAILURE
}

apashExecuteInit(){
  local APASH_INIT_POST_INSTALL=false
  apashParseInitArgs "$@" || return
  [ $APASH_INIT_POST_INSTALL = "true" ] && apashExecutePostInstall
}

apashExecuteMinify(){
  apashParseMinifyArgs "$@" || return
  apash.import -f "fr/hastec/apash.minify"
  apash.minify
}

apashExecuteSource(){
  apashParseSourceArgs "$@" || return

  # @todo: Find why shellcheck does not follow paths.
  # shellcheck source=/dev/null
  . "$APASH_HOME_DIR/apash.source"
}

apashExecuteTest(){  
  # Test suboption overriding options.
  local APASH_TEST_OPTIONS="--directory $APASH_HOME_DIR --shell $APASH_SHELL "
  APASH_NB_ARGS="0"
  apashParseTestArgs "$@" || return
  shift $APASH_NB_ARGS
  APASH_TEST_FILES=("$@")
  [ $# -eq 0 ] && APASH_TEST_FILES=("$APASH_HOME_DIR/spec/")
  
  # Create a subshell to preserve the current user location.
  (
    cd "$APASH_HOME_DIR"
    # @todo: Find a more elegant way to inject arguments (protected by zsh).
    # @todo: Ask shellcheck team if there is a way to disable rules per scope (zsh blocs).
    # Split word intentionnaly the shellspec options.
    if [ "$APASH_SHELL" = "zsh" ]; then
      # shellcheck disable=all
      APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" APASH_TEST_MINIFIED="${APASH_TEST_MINIFIED:-}" APASH_LOG_WARNING_DEGRADED=false shellspec ${(z)APASH_TEST_OPTIONS} "${APASH_TEST_FILES[@]}"
    else # bash
      # shellcheck disable=SC2086
      APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" APASH_TEST_MINIFIED="${APASH_TEST_MINIFIED:-}" APASH_LOG_WARNING_DEGRADED=false shellspec $APASH_TEST_OPTIONS "${APASH_TEST_FILES[@]}"
    fi
  )
}

# LEVEL 3 - Parsing argument per action ########################################
apashParseInitArgs() {
  while :; do
    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        apashShowInitHelp
        return $APASH_FAILURE
        ;;

      --post-install)
        APASH_INIT_POST_INSTALL=true
        ;;
      # End of all options.
      --)             
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_FAILURE
        ;;

      # Stop parsing
      *)
        break
    esac
    shift
  done
  return $APASH_SUCCESS
}

apashParseCacheArgs() {
  while :; do
    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        apashShowCacheHelp
        return $APASH_FAILURE
        ;;

      # End of all options.
      --)             
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_FAILURE
        ;;

      # Stop parsing
      *)
        break
    esac
    shift
  done
  return $APASH_SUCCESS
}

apashParseCheckArgs() {
  while :; do
    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        apashShowCheckHelp
        return $APASH_FAILURE
        ;;

      # End of all options.
      --)             
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_FAILURE
        ;;

      # Stop parsing
      *)
        break
    esac
    shift
  done
  return $APASH_SUCCESS
}

apashParseDocArgs() {
  while :; do
    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        apashShowDocHelp
        return $APASH_FAILURE
        ;;

      # End of all options.
      --)             
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_FAILURE
        ;;

      # Stop parsing
      *)
        break
    esac
    shift
  done
  return $APASH_SUCCESS
}

apashParseDockerArgs() {
  while :; do
    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        apashShowDockerHelp
        return $APASH_FAILURE
        ;;

      -nb|--no-build)
        APASH_DOCKER_NO_BUILD_FLAG=true
        ;;

      -nr|--no-run)
        APASH_DOCKER_NO_RUN_FLAG=true
        ;;

      -s|--shell)
        if [ "${2:-}" ]; then
          APASH_DOCKER_SHELL="${2:-}"
          shift && APASH_NB_ARGS=$(( APASH_NB_ARGS + 1 ))
        fi
        ;;
      
      -v|--version)
        if [ "${2:-}" ]; then
          APASH_DOCKER_SHELL_VERSION="${2:-}"
          shift && APASH_NB_ARGS=$(( APASH_NB_ARGS + 1 ))
        fi
        ;;

      # End of all options.
      --)             
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_FAILURE
        ;;

      # Stop parsing
      *)
        break
    esac
    shift
  done
  return $APASH_SUCCESS
}

apashParseHelpArgs() {
  while :; do
    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        apashShowHelpHelp
        return $APASH_FAILURE
        ;;

      # End of all options.
      --)             
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_FAILURE
        ;;

      # Stop parsing
      *)
        break
    esac
    shift
  done
  return $APASH_SUCCESS
}

apashParseMinifyArgs() {
  while :; do
    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        apashShowMinifyHelp
        return $APASH_FAILURE
        ;;

      # End of all options.
      --)             
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_FAILURE
        ;;

      # Stop parsing
      *)
        break
    esac
    shift
  done
  return $APASH_SUCCESS
}

apashParseSourceArgs() {
  while :; do

    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        showApashSourceHelp
        return $APASH_EXIT_REQUIRED
        ;;

      # End of all options.
      --)             
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_EXIT_REQUIRED
        ;;

      # Stop parsing
      *)
        break
    esac
    shift
  done
  return $APASH_SUCCESS
}

apashParseTestArgs() {
  while :; do
    case ${1:-} in
      # Show helps
      -h|-\?|--help)
        apashShowTestHelp
        return $APASH_FAILURE
        ;;

      # Launch compatibility campaign
      --compatibility)
          apash.import -f "fr/hastec/apash.test.compatibility"
          apash.test.compatibility
          return $APASH_FAILURE
        ;;

      --test-options)
        if [ "${2:-}" ]; then
          APASH_TEST_OPTIONS="${2:-}"
          shift && APASH_NB_ARGS=$(( APASH_NB_ARGS + 1 ))
        fi
        ;;

      -mn|--minified)
        APASH_TEST_MINIFIED="true"
        ;;

      # End of all options.
      --)
        shift
        break
        ;;

      # Display error message on unknown option
      -?*)
        printf 'WARN: Unknown option: %s\n' "${1:-}" >&2
        return $APASH_FAILURE
        ;;

      # Stop parsing
      *)
        break
    esac
    shift && APASH_NB_ARGS=$(( APASH_NB_ARGS + 1 ))
  done
  return $APASH_SUCCESS
}

# LEVEL 3 - Sub action according to arguments ##################################
# @name apashExecutePostInstall
# @brief Add necessary instruction to startup script for apash usage.
apashExecutePostInstall(){
  local startup_script=""
  local apash_keyword="apashInstallTag"
  case "$APASH_SHELL" in
    bash) startup_script="$HOME/.bashrc" ;;
    zsh)  startup_script="$HOME/.zshrc"  ;;
    *)    startup_script="" ;   ;;
  esac

  [ ! -w "$startup_script" ] && echo "Startup Script cannot be edited: $startup_script" >&2 && return

  if ! grep -q "$apash_keyword" "$startup_script" ; then
    (
      echo ". \"${APASH_HOME_DIR:-"\$HOME/.apash"}/.apashrc\"  ##$apash_keyword"
      echo ". \"\$APASH_HOME_DIR/apash.source\"                ##$apash_keyword"
    ) >> "$startup_script"
  else
    # Modify the APASH_DIRECTORY in startup script.
    local defaultDir="${APASH_HOME_DIR:-"$HOME/.apash"}"
    sed -i "s|^\(\s*APASH_HOME_DIR=\"\).*\(\"\s*##apashInstallTag\)|\1\${APASH_HOME_DIR:-\"$defaultDir\"}\2|" "$startup_script"
    echo "The startup script ($startup_script) has been updated with new APASH_HOME_DIR: $APASH_HOME_DIR."
    echo "Please open a new terminal to ensure that environment is well loaded."
  fi
}

# MAIN FLOW ###################################################################
apashBashMain() {
  # Main flow is in a function to prevent usage of exit (using return instead)
  # and allow to declare variables locally.

  # Command-line flags ########################################################
  local APASH_NB_ARGS=0       # Number of argument before the action.

  # Calculated flags
  local APASH_EXIT_REQUIRED=false   # Flag set to true when an issue occurs.
  local APASH_SUCCESS=0
  local APASH_FAILURE=1

  # Zsh requires to re-declare functions when subprocesses are called.
  # shellcheck source=/dev/null
  typeset -f "apash.import" > /dev/null || source "$APASH_HOME_DIR/src/fr/hastec/apash.import"
  apashExecuteCommand "$@"
}

apashBashMain "$@"
