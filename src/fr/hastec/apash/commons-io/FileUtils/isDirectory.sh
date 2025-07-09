#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-io.FileUtils.isSymlink

##/
# @name FileNameUtils.isDirectory
# @brief Tests whether the specified File is a directory or not.
# @description
#   This method returns 0 or 1 depending on whether the argument is a directory or not
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
# | $1     | inFolderName   | string        | in       |            | The folder name to test.  |
# | $2     | inLinkOption   | string        | in       |            | The symbolic link options |
#
# ### Example
# ```bash
#    FileUtils.isDirectory "regularFile.txt"                              #1
#    FileUtils.isDirectory "directory"                                    #0
#    FileUtils.isDirectory "directory/symlink/otherDir" "NOFOLLOW_LINKS"  #1
#    FileUtils.isDirectory "symlink"                                      #1
# ```
#
# @stdout None. 
# @stderr None.
#
# @exitcode 0 when the inFolderName points to a directory.
# @exitcode 1 Otherwise.
#/
FileUtils.isDirectory() {
  Log.in "$LINENO" "$@"
  local inFolderName="${1:-}"
  local inLinkOption="${2:-}"

  if [ "NOFOLLOW_LINKS" = "$inLinkOption" ] && FileUtils.isSymlink "$inFolderName"; then
    Log.out "$LINENO"; return "$APASH_FAILURE"; 
  fi

  if test -d "$inFolderName" ; then
    Log.out "$LINENO"; return "$APASH_SUCCESS"
  else
    Log.out "$LINENO"; return "$APASH_FAILURE"
  fi
}
