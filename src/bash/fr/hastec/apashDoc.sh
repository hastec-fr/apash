#!/usr/bin/env bash

# <!-- @package -->
# @name apash
# @brief Generate apash documentation
apash.substitutePlaceHolders() {
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
        [[ ! -r $f ]] && continue
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

apash.doc() {
  apash.substitutePlaceHolders summaryTable
  apash.substitutePlaceHolders parent

  local APASH_DOC_HEADER="""
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='{{apash-logo}}'/>
  </a>

  # Apash
</div>
"""

  local APASH_DOC_FOOTER="""
  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>
"""


  # Generate individuals scripts documents
  APASH_DOC_HEADER="$APASH_DOC_HEADER" APASH_DOC_FOOTER="$APASH_DOC_FOOTER" \
  find "$APASH_HOME_DIR/src" -type f -name "*.sh" -exec bash -c '
    file_path="$(dirname "$1")"
    file_name="$(basename "$1")"
    doc_path="$(echo $file_path | sed "s|$APASH_HOME_DIR/src|$APASH_HOME_DIR/doc|1")"
    doc_name="${file_name%.sh}.md"
    root_relative_dir="../$(echo "$file_path" | sed "s|.*/src/||1" | sed "s|[^/]*|..|g")"
    mkdir -p "$doc_path"
    echo "$APASH_DOC_HEADER" | sed "s|{{apash-logo}}|$root_relative_dir/assets/apash-logo.svg|1" > "$doc_path/$doc_name"
    shdoc < "$file_path/$file_name" >> "$doc_path/$doc_name"
    echo "$APASH_DOC_FOOTER" >> "$doc_path/$doc_name"
  ' shell {} \;
}
