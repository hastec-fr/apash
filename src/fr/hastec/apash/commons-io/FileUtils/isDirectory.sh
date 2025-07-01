#!/usr/bin/env bash

# Dependencies #################################################################
#apash.import fr.hastec.apash.util.Log

# File description ###########################################################
# @name FileNameUtils.isDirectory
# @brief Tests whether the specified File is a directory or not.
# @description
#   This method returns 0 or 1 depending on whether the argument is a directory or not  
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
#    FileUtils.isDirectory "regularFile.txt"  #1
#    FileUtils.isDirectory "directory"        #0
#    FileUtils.isDirectory "symlink"          #1
# ```
#
# @stdout None. 
# @stderr None.
#
# @exitcode 0 when the given file is a regular file.
# @exitcode 1 Otherwise.
#/
FileUtils.isDirectory() {
    local inFileName="${1:-}"
    if test -d "$inFileName" ; then
        return 0
    else
        return 1
    fi
}

#FileUtils.isDirectory "regularFile.txt"
#FileUtils.isDirectory "notARegularFile"
#FileUtils.isDirectory "symlink"
