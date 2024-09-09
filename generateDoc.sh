#!/usr/bin/env bash
# set -x



# @arg1: PlaceHolder
replacePlaceHolders() {
  placeHolder=$1 && shift
  placeHolders=$(grep -rl "\.${placeHolder}" --include \*.sh --exclude generateDoc.sh)

  while read -r p; do
  echo "Package: $p"
  class=$(basename "$p" | sed 's/\.sh//')
  package=$(dirname "$p")
  rows="# <!-- $class.${placeHolder}Begin -->\n"

  if [ "${placeHolder}" = "summaryTable" ]; then
    rows+="# | Methods                  | Brief                                 |\n"
    rows+="# |--------------------------|---------------------------------------|\n"
    for f in "$package/$class"/*.sh; do
      method=$(basename "$f"  | sed 's/\.sh//')
      brief=$(grep -m 1 "@brief" "$f" | sed 's/^.*@brief //1' )
      row="# |[${method//|/\|}]($class/${method}.md)|${brief//|/\|}|"
      echo "class: $row"
      rows+="$row\n"
    done
    rows+="# <!-- $class.${placeHolder}End -->\n"
  elif [ "${placeHolder}" = "parent" ]; then
    parentDir=""
    while IFS=/ read -r $dir; do
      row+="$parentDir/$dir"
      parentDir+="../"
    done <<< "$(echo "$package"| rev)"
  fi
  sed -i "/$class.${placeHolder}Begin/,/$class.${placeHolder}End/c\ 
  $rows
  " "$placeHolders"
  done <<< "$@"
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
