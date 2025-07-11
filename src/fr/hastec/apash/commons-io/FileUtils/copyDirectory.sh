#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-io.FileUtils.isDirectory
apash.import fr.hastec.apash.commons-io.FileUtils.copyFile
apash.import fr.hastec.apash.commons-io.FileNameUtils.getFullPathNoEndSeparator

##/
# @name FileNameUtils.copyDirectory
# @brief Copies a filtered directory to a new location. 
# @description
#   This method copies the contents of the specified source directory to within the specified destination directory.
#   The destination directory is created if it does not exist.
#   If the destination directory does exist, then this method merges the source with the destination,
#   with the source taking precedence. 
#
# ## History
#  @since 0.2.0 (Guilhem Baechler)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default | Description                        |
# |--------|----------------|---------------|----------|---------|------------------------------------|
# | $1     | inSrc          | string        | in       |         | The folder name to copy.           |
# | $2     | inDst          | string        | in       |         | The destination folder name.       |
# | $3     | inFileFilter   | string        | in       | .*      | The file name filter. (regex)      |
# | $4     | inPreserveDate | boolean       | in       | false   | Tells if the date should be copied |
# | $5     | inCopyOption   | string        | in       |         | The copy options separated by a ','|
#
# ### Example
# ```bash
#   FileUtils.copyDirectory "path" "dest"                                       # copies all path directory and sub directories in dest without replacing existing files 
#   FileUtils.copyDirectory "path" "dest" ".*1"                                 # copies all path directory and sub directories that ends with '1' in dest without replacing existing files 
#   FileUtils.copyDirectory "path" "dest" ".*" true                             # copies all path directory and sub directories in dest without replacing existing files but it copies file dates 
#   FileUtils.copyDirectory "path" "dest" ".*" true "REPLACE_EXISTING"          # copies all path directory and sub directories in dest without replacing existing files but it copies file dates and replace files that have same names 
# ```
#
# @stdout None. 
# @stderr None.
#
# @exitcode 0 when the inSrc has been copied in inDst.
# @exitcode 1 Otherwise.
#/
FileUtils.copyDirectory() {
  Log.in "$LINENO" "$@"
  local inSrc="${1:-}"
  local inDst="${2:-}"
  local inFileFilter="${3-.*}"
  local inPreserveDate="${4:-false}"
  local inCopyOption="${5:-}"

  mkdir -p "$inDst" || { Log.ex $LINENO; return "$APASH_FAILURE"; } 
  
  for path in "$inSrc"/*; do
    #echo "$path"
    local baseName
    baseName="$(basename "$path")" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    
    if echo "$baseName" | grep -q "$inFileFilter"; then
      local relPath="${path#"$inSrc"/}"
      local dstPath="$inDst/$relPath"

      if FileUtils.isDirectory "$path"; then
        #echo "copy folder: $path to $dstPath"
        FileUtils.copyDirectory "$path" "$dstPath" "$inFileFilter" "$inPreserveDate" "$inCopyOption" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
      else
        #echo "copy file: $path to $dstPath"
        FileUtils.copyFile "$path" "$dstPath" "$inPreserveDate" "$inCopyOption" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
      fi
    fi
  done

  Log.out "$LINENO";
  return "$APASH_SUCCESS"
}

_FileUtils.copyDirectory () {

  local BOOLEAN="true false"
  local COPY_OPTIONS="REPLACE_EXISTING COPY_ATTRIBUTES REPLACE_EXISTING,COPY_ATTRIBUTES"

  COMPREPLY=()

  local current="${COMP_WORDS[$COMP_CWORD]}"
  if [ "$COMP_CWORD" -eq 3 ]; then
    mapfile -t COMPREPLY < <(compgen -W "$BOOLEAN" -- "$current")
  elif [ "$COMP_CWORD" -eq 4 ]; then
    mapfile -t COMPREPLY < <(compgen -W "$COPY_OPTIONS" -- "$current")
  else
    mapfile -t COMPREPLY < <(compgen -W "$(ls)" -- "$current")
  fi

}

complete -F _FileUtils.copyDirectory FileUtils.copyDirectory
