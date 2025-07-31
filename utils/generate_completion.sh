#!/usr/bin/env bash

generateCompletionsZsh() {
  echo "begin zsh completion generation..."
  
  local path="$APASH_HOME_DIR/src/fr/hastec/apash"
  local completionFile="$APASH_HOME_DIR/completions/zsh/_apashCompletions"

  #commons-lang.StringUtils.contains
  local modules=()  #StringUtils
  local methods=()  #contains 

  echo -n "#compdef " > "$completionFile" 

  #commons-lang
  for m in "$path"/*; do
    if [ -d "$m" ]; then
      #StringUils
      for sm in "$m"/*; do
        if [ -d "$sm" ]; then 
          local moduleName=
          moduleName="$(basename "$sm")"
          modules+=("$moduleName")
          #contains
          for f in "$sm"/*; do
            local mehtodName=
            mehtodName="$(basename "${f%.*}")"
            methods+=("$moduleName.$mehtodName")
            echo -n "$moduleName.$mehtodName " >> "$completionFile"
          done
        fi
      done
    fi
  done

  echo "" >> "$completionFile"
  echo "" >> "$completionFile"

  for m in "${methods[@]}"; do
    {
      echo "#=== Completion for: '$m' ==="
      echo "_$m() {"
      echo "  _arguments \\"
      echo "    '1:first arg:_files' \\" #TODO parse dynamicly with doc
      echo "    '2:second arg:(completion_for_$m)'" #TODO parse dynamicly with doc
      echo "}"
      echo ""
    } >> "$completionFile"
  done

  {
    echo "#=== Dispatcher ==="
    echo "case \$services in"
    for m in "${methods[@]}"; do
      echo "  $m)" 
      echo "    _$m \"\$@\""
      echo "    ;;"
    done
    echo "esac"
  } >> "$completionFile"

  echo "generated zsh completion successfully"
  return 0
}

generateCompletionsBash() {
  echo "Not supported yet."
  return 1
}


target="${1:bash}"

echo "target shell: $target"

if [ "$target" = "zsh" ]; then
  generateCompletionsZsh
else
  generateCompletionsBash
fi
