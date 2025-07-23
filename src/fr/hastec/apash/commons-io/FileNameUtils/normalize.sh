#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.StringUtils.contains

##/
# @name FileNameUtils.normalize
# @brief Normalizes a path, removing double and single period path steps.
# @description
#  This method normalizes a path to a standard format.
#
# ## History
#  @since 0.3.0 (Guilhem Baechler)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                |
# |--------|----------------|---------------|----------|------------|----------------------------|
# | $1     | inFileName     | string        | in       |            | The file name to normalize |
#
# ### Example
# ```bash
#    FileNameUtils.normalize "/foo//"              # /foo/
#    FileNameUtils.normalize "/foo/./"             # /foo/
#    FileNameUtils.normalize "/foo/../bar"         # /bar
#    FileNameUtils.normalize "/foo/../bar/"        # /bar/
#    FileNameUtils.normalize "/foo/../bar/../baz"  # /baz
#    FileNameUtils.normalize "//foo//./bar"        # /foo/bar
#    FileNameUtils.normalize "/../"                # (exitcode 1)
#    FileNameUtils.normalize "../foo"              # (exitcode 1)
#    FileNameUtils.normalize "foo/bar/.."          # foo/
#    FileNameUtils.normalize "foo/../../bar"       # (exitcode 1)
#    FileNameUtils.normalize "foo/../bar"          # bar
#    FileNameUtils.normalize "//server/foo/../bar" # //server/bar
#    FileNameUtils.normalize "//server/../bar"     # (exitcode 1)
#    FileNameUtils.normalize "~/foo/../bar/"       # ~/bar/
#    FileNameUtils.normalize "~/../bar"            # (exitcode 1)
# ```
#
# @stdout The normalized form of inFileName or an empty string if inFileName is invalid 
# @stderr None.
#
# @exitcode 0 When an empty string is displayed.
# @exitcode 1 Otherwise.
#/

FileNameUtils.normalize() { 
  Log.in $LINENO "$@"
  
  local inFileName="${1:-}"

  #ignore shellcheck [SC2088] since we want to test for the exact string "~/.."
  if [ -z "$inFileName" ] || StringUtils.contains "$inFileName" "~/.."; then
    echo "" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_FAILURE"
  fi

  #java implem fix separator inconsistency 
  #but in this implem we are sure that we have '/' has separator

  #"//" -> "/"
  inFileName=$(echo "$inFileName" | sed "s/\/\//\//g") || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  #"a/../" -> " "
  inFileName=$(echo "$inFileName" | sed -E ':a; s#[^/]+/\.\./##; ta') || { Log.ex $LINENO; return "$APASH_FAILURE"; }
 
  #if inFileName still contains .. it means that there are invalid ../
  if StringUtils.contains "$inFileName" ".."; then
    echo "" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_FAILURE"
  fi

  #"./" -> " "
  inFileName=$(echo "$inFileName" | sed "s/\.\///g") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  echo "$inFileName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
