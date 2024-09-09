#!/usr/bin/env bash

# @arg1: PlaceHolder
replacePlaceHolders() {
  placeHolder=$1
  placeHolders=$(grep -rl "\.${placeHolder}" --include \*.sh --exclude generateDoc.sh)

  while read -r p; do
    class=$(basename "$p" | sed 's/\.sh//')
    package=$(dirname "$p")
    rows="# <!-- $class.${placeHolder}Begin -->\n"

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
      rootPackage=${package/src\/*\/fr\/hastec\//}
      count=$(echo "$rootPackage" | tr -cd "$/" | wc -c)
      row="# "
      IFS="/"
      for dir in $rootPackage; do
        parentDir="../"
        for ((i=0; i < count; i++)); do parentDir+="../"; done
        row+="[$dir]($parentDir$dir.md) / "
        ((count--))
      done
      rows+="$row\n"
    fi
    rows+="# <!-- $class.${placeHolder}End -->"
    sed -i "/$class.${placeHolder}Begin/,/$class.${placeHolder}End/c\
    $rows
    " "$p"
  done <<< "$placeHolders"
}

replacePlaceHolders summaryTable
replacePlaceHolders parent


# Generate individuals scripts documents
find src/ -type f -exec bash -c '
  file_path="$(dirname "$1")"
  file_name="$(basename "$1")"
  doc_path="${file_path/#src/doc}"
  doc_name="${file_name%.sh}.md"
  mkdir -p "$doc_path"
  shdoc < "$file_path/$file_name" > "$doc_path/$doc_name"
' shell {} \;
