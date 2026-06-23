#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log
apash.import fr.hastec.apash.commons-lang.StringUtils.substring
apash.import fr.hastec.apash.commons-lang.StringUtils.startsWith
apash.import fr.hastec.apash.commons-lang.StringUtils.contains
apash.import fr.hastec.apash.commons-lang.StringUtils.lastIndexOf

##/
# @name FileNameUtils.getFullPathNoEndSeparator
# @brief Gets the full path (prefix + path) from a full file name, excluding the final directory separator.
# @description
#  The method is entirely text based,
#  and returns the text before the last forward or backslash.
#
# ## History
#  @since 0.3.0 (Guilhem Baechler)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                                 |
# |--------|----------------|---------------|----------|------------|---------------------------------------------|
# | $1     | inFileName     | string        | in       |            | The file name to retrieve the full path of. |
#
# ### Example
# ```bash
#    FileNameUtils.getFullPathNoEndSeparator  "foo.txt"          # ""
#    FileNameUtils.getFullPathNoEndSeparator  "a/b/c.jpg"        # "a/b/c"
#    FileNameUtils.getFullPathNoEndSeparator  "a/b/c"            # "a/b/c"
#    FileNameUtils.getFullPathNoEndSeparator  "a/b/c/"           # "a/b/c"
#    FileNameUtils.getFullPathNoEndSeparator  "a/b c/"           # "a/b c"
#    FileNameUtils.getFullPathNoEndSeparator  "a/b/c//"          # "a/b/c/"
#    FileNameUtils.getFullPathNoEndSeparator  "~"                # "~"
#    FileNameUtils.getFullPathNoEndSeparator  "~/"               # "~"
#    FileNameUtils.getFullPathNoEndSeparator  "~user"            # "~user"
#    FileNameUtils.getFullPathNoEndSeparator  "~user/"           # "~user"
#    FileNameUtils.getFullPathNoEndSeparator  "/"                # "/"
# ```
#
# @stdout The path of the file, an empty string if none exists
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
FileNameUtils.getFullPathNoEndSeparator() { 
  Log.in $LINENO "$@"
  local inFileName="${1:-}"

  #special case: /, ~user, ~
  if [ "$inFileName" = "/" ] || (StringUtils.startsWith "$inFileName" "~" && ! StringUtils.contains "$inFileName" "/"); then
    echo "$inFileName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  #find the last / in $inFileName a/b/c/ a/b/c
  #                                    ^    ^
  local lastStepIndex
  lastStepIndex="$(StringUtils.lastIndexOf "$inFileName" "/")" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  if [ "$lastStepIndex" -eq -1 ]; then
    echo "" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
    Log.out $LINENO; return "$APASH_SUCCESS"
  fi

  #see FilenameUtils.doGetFullPath
  #includeSeparator = false
  #https://github.com/apache/commons-io/blob/master/src/main/java/org/apache/commons/io/FilenameUtils.java
  local fullPath
  fullPath="$(StringUtils.substring "$inFileName" 0 "$lastStepIndex")" || { Log.ex $LINENO; return "$APASH_FAILURE"; }

  echo "$fullPath" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
  Log.out $LINENO; return "$APASH_SUCCESS"
}
