#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name FileNameUtils.isSymlink
# @brief Tests whether the specified File is a symbolic link rather than an actual file.
# @description
#   This method returns 0 or 1 depending on whether the argument is a symbolic link or not  
#
# ## History
#  @since 0.2.0 (Guilhem Baerchler)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description            |
# |--------|----------------|---------------|----------|------------|------------------------|
# | $1     | inFileName     | string        | in       |            | The file name to test. |
#
# ### Example
# ```bash
#    FileUtils.isSymlink "regularFile.txt"  #1
#    FileUtils.isSymlink "notARegularFile"  #1
#    FileUtils.isSymlink "symlink"          #0
# ```
#
# @stdout None. 
# @stderr None.
#
# @exitcode 0 when the given file is a symbolic link.
# @exitcode 1 Otherwise.
#/
FileUtils.isSymlink() {
  Log.in "$LINENO" "$@"
  local inFileName="${1:-}"

  if test -h "$inFileName" ; then
    Log.out "$LINENO"; return "$APASH_SUCCESS"
  else
    Log.out "$LINENO"; return "$APASH_FAILURE"
  fi
}
