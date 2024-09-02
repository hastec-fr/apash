#!/usr/bin/env bash

find src/ -type f -exec bash -c '
  file_path="$(dirname "$1")"
  file_name="$(basename "$1")"
  doc_path="${file_path/#src/doc}"
  doc_name="${file_name%.sh}.md"
  mkdir -p "$doc_path"
  shdoc < "$file_path/$file_name" > "$doc_path/$doc_name"
' shell {} \;