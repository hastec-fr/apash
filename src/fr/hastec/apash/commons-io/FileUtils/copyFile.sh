#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-io.FileNameUtils.getFullPathNoEndSeparator
apash.import fr.hastec.apash.commons-io.FileUtils.isRegularFile
apash.import fr.hastec.apash.commons-lang.StringUtils.contains

##/
# @name FileNameUtils.copyFile
# @brief Copies the contents of a file to a new location. 
# @description
#   This method copies the contents of the specified source file to the specified destination file.
#   The directory holding the destination file is created if it does not exist.
#   If the destination file exists, you can overwrite it with REPLACE_EXISTING.
#
#   CopyOptions.ATOMIC_MOVE is not supported
# ## History
#  @since 0.2.0 (Guilhem Baechler)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default | Description                        |
# |--------|----------------|---------------|----------|---------|------------------------------------|
# | $1     | inSrc          | string        | in       |         | The file name to copy.             |
# | $2     | inDst          | string        | in       |         | The destination file name.         |
# | $3     | inPreserveDate | boolean       | in       | false   | Tells if the date should be copied |
# | $4     | inCopyOption   | string        | in       |         | The copy options separated by a ','|
#
# ### Example
# ```bash
#   FileUtils.copyFile src.txt dst.txt true "REPLACE_EXISTING,COPY_ATTRIBUTES" # src contents is copied in dst and have the same dates and attributes 
#   FileUtils.copyFile src.txt dst.txt                                         # src contents is copied in dst 
#   FileUtils.copyFile src.txt dst.txt false "REPLACE_EXISTING"                # src contents is copied in dst but dst doesn't have the same date and replace dst.txt if it already exists 
# ```
#
# @stdout None. 
# @stderr None.
#
# @exitcode 0 when the inSrc has been copied in inDst.
# @exitcode 1 Otherwise.
#/
FileUtils.copyFile() {
  Log.in "$LINENO" "$@"
  local inSrc="${1:-}"
  local inDst="${2:-}"
  local inPreserveDate="${3:-false}"
  local inCopyOption="${4:-}"

  mkdir -p "$(FileNameUtils.getFullPathNoEndSeparator "$inDst")" || { Log.ex $LINENO; return "$APASH_FAILURE"; } 

  #if REPLACE_EXISTING is not set and the dst already existsl it doesn't copy
  if ! StringUtils.contains "$inCopyOption" "REPLACE_EXISTING" && FileUtils.isRegularFile "$inDst"; then
    Log.out "$LINENO";
    return "$APASH_SUCCESS"
  fi

  if StringUtils.contains "$inCopyOption" "COPY_ATTRIBUTES" || [[ "$inPreserveDate" == true ]]; then
    cp "-p" "$inSrc" "$inDst" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  else
    cp "$inSrc" "$inDst" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  fi


  Log.out "$LINENO";
  return "$APASH_SUCCESS"
}
