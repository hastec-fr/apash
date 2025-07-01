#!/usr/bin/env bash

# Dependencies #################################################################
#apash.import fr.hastec.apash.util.Log

# File description ###########################################################
# @name FileNameUtils.isRegularFile
# @brief Tests whether the specified File is a regular file or not.
# @description
#   This method returns 0 or 1 depending on whether the argument is a regular file or not  
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
# | $1     | inFileName     | string        | in       |            | The file name to test. |
#
# ### Example
# ```bash
#    FileUtils.isRegularFile "regularFile.txt"  #0
#    FileUtils.isRegularFile "notARegularFile"  #1
#    FileUtils.isRegularFile "symlink"          #1
# ```
#
# @stdout None. 
# @stderr None.
#
# @exitcode 0 when the given file is a regular file.
# @exitcode 1 Otherwise.
#/
FileUtils.isRegularFile() {
    local inFileName="${1:-}"
    if test -f "$inFileName" && ! test -h "$inFileName"; then
        return 0
    else
        return 1
    fi
}

#FileUtils.isRegularFile "regularFile.txt"
#FileUtils.isRegularFile "notARegularFile"
#FileUtils.isRegularFile "symlink"
