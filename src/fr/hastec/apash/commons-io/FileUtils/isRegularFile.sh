#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-io.FileNameUtils.getFullPathNoEndSeparator

##/
# File description ###########################################################
# @name FileNameUtils.isRegularFile
# @brief Tests whether the specified File is a regular file or not.
# @description
#   This method returns 0 or 1 depending on whether the argument is a regular file or not  
#
# ## History
#  @since 0.2.0 (Guilhem Baechler)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description               |
# |--------|----------------|---------------|----------|------------|---------------------------|
# | $1     | inFileName     | string        | in       |            | The file name to test.    |
# | $2     | inLinkOption   | string        | in       |            | The symbolic link options |
#
# ### Example
# ```bash
#    FileUtils.isRegularFile "regularFile.txt"                                    #0
#    FileUtils.isRegularFile "notARegularFile"                                    #1
#    FileUtils.isRegularFile "symlinkToADir"                                      #1
#    FileUtils.isRegularFile "path/to/symlink/regularFile.txt" "NOFOLLOW_LINKS"   #0
#    FileUtils.isRegularFile "symlink" "NOFOLLOW_LINKS"                           #0
#    FileUtils.isRegularFile "symlinkToADir" "NOFOLLOW_LINKS"                     #0
# ```
#
# @stdout None. 
# @stderr None.
#
# @exitcode 0 when the given file is a regular file.
# @exitcode 1 Otherwise.
#/
FileUtils.isRegularFile() {
  Log.in "$LINENO" "$@"
  local inFileName="${1:-}"
  local inLinkOption="${2:-}"

  if [ "NOFOLLOW_LINKS" = "$inLinkOption" ] && [ "$(realpath "$inFileName")" != "$inFileName" ]; then
    local inDirectory
    inDirectory="$(FileNameUtils.getFullPathNoEndSeparator "$inFileName")"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }

    if [ "$(realpath "$inDirectory")" = "$inDirectory" ]; then
      Log.out "$LINENO"; return "$APASH_SUCCESS";
    else
      Log.out "$LINENO"; return "$APASH_FAILURE";
    fi
  fi

  if test -f "$inFileName"; then
    Log.out "$LINENO"; return "$APASH_SUCCESS"
  else
    Log.out "$LINENO"; return "$APASH_FAILURE"
  fi
}
