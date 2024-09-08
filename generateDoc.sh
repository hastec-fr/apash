#!/usr/bin/env bash

summaryTables=$(grep -rl "\.summaryTableBegin" --include \*.sh --exclude generateDoc.sh)
while read -r summaryTable; do
  class=$(basename "$summaryTable" | sed 's/\.sh//')
  package=$(dirname "$summaryTable")
  rows="# <!-- StringUtils.summaryTableBegin -->\n"
  rows+="# | Methods                  | Brief                                 |\n"
  rows+="# |--------------------------|---------------------------------------|\n"
  for f in "$package/$class"/*; do
    method=$(basename "$f"  | sed 's/\.sh//')
    brief=$(grep -m 1 "@brief" "$f" | sed 's/^.*@brief //1' )
    row="# |${method//|/\|}|${brief//|/\|}"
    rows+="$row\n"
  done
  rows+="# <!-- StringUtils.summaryTableEnd -->\n"
  sed -i "/StringUtils.summaryTableBegin/,/StringUtils.summaryTableEnd/c\
  $rows
  " "$summaryTable"
done <<< "$summaryTables"


# Generate individuals scripts documents
# find src/ -type f -exec bash -c '
#   file_path="$(dirname "$1")"
#   file_name="$(basename "$1")"
#   doc_path="${file_path/#src/doc}"
#   doc_name="${file_name%.sh}.md"
#   mkdir -p "$doc_path"
#   shdoc < "$file_path/$file_name" > "$doc_path/$doc_name"
# ' shell {} \;
