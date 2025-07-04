#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-io.FileNameUtils.getFullPathNoEndSeparator

# File description ###########################################################
# @name FileNameUtils.getFullPath
# @brief Gets the full path (prefix + path) from a full file name.
# @description
#  The method is entirely text based,
#  and returns the text before and including the last forward or backslash.
#
# ## History
#  @since 0.2.0 (Guilhem Baechler)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                                 |
# |--------|----------------|---------------|----------|------------|---------------------------------------------|
# | $1     | inFileName     | string        | in       |            | The file name to retrieve the full path of. |
#
# ### Example
# ```bash
#    FileNameUtils.getFullPath  "foo.txt"          # ""
#    FileNameUtils.getFullPath  "a/b/c.jpg"        # "a/b/c/"
#    FileNameUtils.getFullPath  "a/b/c"            # "a/b/c/"
#    FileNameUtils.getFullPath  "a/b/c/"           # "a/b/c/"
# ```
#
# @stdout The path of the file, an empty string if none exists
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
FileNameUtils.getFullPath() { 
  Log.in $LINENO "$@"
  local inFileName="${1:-}"
  local fullPath
  fullPath="$(FileNameUtils.getFullPathNoEndSeparator "$inFileName")" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  
  if [ "$fullPath" = "" ]; then
    echo "" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  echo "$fullPath/" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
