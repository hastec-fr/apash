#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.StringUtils.contains

# File description ###########################################################
# @name FileNameUtils.getExtension
# @brief Gets the extension of a fileName.
# @description
#   This method returns the textual part of the file name after the last dot. 
#   There must be no directory separator after the dot.
#
# ## History
#  @since 0.2.0 (Benjamin Vargin)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                                 |
# |--------|----------------|---------------|----------|------------|---------------------------------------------|
# | $1     | inFileName     | string        | in       |            | The file name to retrieve the extension of. |
#
# ### Example
# ```bash
#    FileNameUtils.getExtension  "foo.txt"          # "txt"
#    FileNameUtils.getExtension  "a/b/c.jpg"        # "jpg"
#    FileNameUtils.getExtension  "a/b.txt/c"        # ""
#    FileNameUtils.getExtension  "a/b/c"            # ""
# ```
#
# @stdout The extension of the file or an empty string if none exists.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
FileNameUtils.getExtension() { 
  Log.in $LINENO "$@"
  local inFileName="${1:-}"
  inFileName="$(basename "$inFileName")"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  # If no extension, then return nothing.
  ! StringUtils.contains "$inFileName" "." && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  echo "${$inFileName##*.}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.ex $LINENO; return "$APASH_SUCCESS";
}
