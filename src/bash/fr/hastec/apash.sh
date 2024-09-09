#!/usr/bin/env bash

# <!-- @package -->
# @name apash
# @brief Translation from most of the apache libraries for shell.
# @description
#     Provides highly reusable utility methods.
#
# ### Parents
# [Main page](../../../../README.md)
#
# ### Method Summary
# <!-- apash.summaryTableBegin -->
# | Methods                  | Brief                                 |
# |--------------------------|---------------------------------------|
# |[commons-lang](apash/commons-lang.md)|Provides highly reusable utility methods.|
# <!-- apash.summaryTableEnd -->
 

# Declaration of global variables
export APASH_FUNCTION_SUCCESS=0
export APASH_FUNCTION_FAILURE=1

declare -A APASH_LIBRARIES
export APASH_LIBRARIES

APASH_BASH_DIR="$(realpath "$( dirname -- "${BASH_SOURCE[0]}" )/../../")"
export APASH_BASH_DIR

APASH_ROOT_DIR="$(realpath "$APASH_BASH_DIR/../../")"
export APASH_ROOT_DIR

import(){
  local lib
  local libs=()

  for l in "$@"; do
    locations="$APASH_BASH_DIR/${l//./\/}"
    if [ -d "$locations" ]; then
      locations="$locations/*.sh"
      for lib in $locations; do
        libs+=("$lib")
      done
    elif [ -r "$locations.sh" ]; then
      libs+=("$locations.sh")
    else
      echo "WARNING: Unknown library: $l" >&2
      continue
    fi
  done

  for lib in "${libs[@]}"; do
    [ ! -r "$lib" ] && echo "WARNING: non readable library: $lib" >&2 && continue
    if [[ ! -v ${APASH_LIBRARIES["$lib"]} ]]; then
      # shellcheck disable=SC1090
      source "$lib"
      APASH_LIBRARIES["$lib"]=true
    fi
  done
}



# @arg1: PlaceHolder
replacePlaceHolders() {
  placeHolder=$1
  placeHolders=$(grep -rl "apash\.${placeHolder}" --include \*.sh --exclude generateDoc.sh)

  while read -r p; do
    class=$(basename "$p" | sed 's/\.sh//')
    package=$(dirname "$p")
    rows="# <!-- apash.${placeHolder}Begin -->\n"

    if [ "${placeHolder}" = "summaryTable" ]; then
      # For each script contains in the corresponding package directory
      # Create a line where the method is the name of the script without .sh and its brief content.
      rows+="# | Methods                  | Brief                                 |\n"
      rows+="# |--------------------------|---------------------------------------|\n"
      for f in "$package/$class"/*.sh; do
        method=$(basename "$f"  | sed 's/\.sh//')
        brief=$(grep -m 1 "@brief" "$f" | sed 's/^.*@brief //1' )
        row="# |[${method//|/\|}]($class/${method}.md)|${brief//|/\|}|"
        rows+="$row\n"
      done
    elif [ "$placeHolder" = "parent" ]; then
      # Count the number of parent directory until apash root dir
      # Then loop on the directory to rebuild the path with relative path
      # for each directory.
      # apash / commons-lang / ...
      rootPackage=${package/src\/*\/fr\/hastec/}

      # If it's the root package src/fr/hastec then just display None.
      if [ -z "$rootPackage" ]; then
        row="# None."
      else
        count=$(echo "$rootPackage" | tr -cd "$/" | wc -c)
        row="# "
        OLD_IFS=$IFS
        IFS="/"
        for dir in $rootPackage; do
          parentDir="../"
          for ((i=0; i < count; i++)); do parentDir+="../"; done
          row+="[$dir]($parentDir$dir.md) / "
          ((count--))
        done
        IFS="$OLD_IFS"
      fi
      rows+="$row\n"
    fi
    rows+="# <!-- apash.${placeHolder}End -->"
    sed -i "/apash.${placeHolder}Begin/,/apash.${placeHolder}End/c\
    $rows
    " "$p"
  done <<< "$placeHolders"
}

generateDoc() {
  replacePlaceHolders summaryTable
  replacePlaceHolders parent

  # Generate individuals scripts documents
  find "$APASH_ROOT_DIR/src" -type f -name "*.sh" -exec bash -c '
    file_path="$(dirname "$1")"
    file_name="$(basename "$1")"
    doc_path="$(echo $file_path | sed "s|$APASH_ROOT_DIR/src|$APASH_ROOT_DIR/doc|1")"
    doc_name="${file_name%.sh}.md"
    mkdir -p "$doc_path"
    shdoc < "$file_path/$file_name" > "$doc_path/$doc_name"
  ' shell {} \;
}

export -f import
export -f replacePlaceHolders
export -f generateDoc
