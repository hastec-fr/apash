#!/usr/bin/env bash

# File description ###########################################################
##/
# @name ApashUtils.doc
# @brief Create a Markdown file associated to the input file.
# @description
#   Tags must be in comment sections and between tags: ##/ ... #/<br/>
#   For multi lines, all # in the middle will be considered in the current documentation.
#   ```bash
#   ##/
#   #  My first comment line
#   #  My second comment line
#   #/
#   ```
# ## History
# @since 0.2.0
#
# ### Authors:
# * 0.2.0: hastec-fr
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #  | varName        | Type          | in/out   | Default    | Description                          |
# |----|----------------|---------------|----------|------------|--------------------------------------|
# | $1 | ioArrayName    | ref(string[]) | in & out |            | Name of the array to modify.         |
# | $2 | inValue        | string        | in       |            | Value to add at the end of the array.|
#
# ### Example
# ```bash
#    ApashUtils.doc  "myFile"    # Display the markdown content.
# ```
#
# @stdout The markdown content of the input file.
# @stderr None.
#
# @exitcode 0 When markdown is displayed.
# @exitcode 1 When the file does not exists.
#/
ApashUtils.doc() {
  local inFile="$1"
  local comments=""
  comments="$(sed -n -e '/^\s*##\//,/^\s*#\//p' "$inFile" | sed -n -e 's/^\s*##\?\/\?//p')"
  comments="$(echo "$comments" | awk '
    BEGIN { blockCodeFlag = 0 }

    # Flag management.
    /^\s*```/             { blockCodeFlag=!blockCodeFlag }
    !/^\s*@exitcode\s+/   { exitCodeFlag=0 }

    # Trim leading spaces of titles if not in code block.
    ! blockCodeFlag && /^\s*#/ { gsub(/^\s+/, ""); }

    # Alias management.
    /^\s*@name\s+/            { $1=""; gsub(/^\s+/, ""); print "#",$0; next }
    /^\s*@brief\s+/           { $1=""; gsub(/^\s+/, ""); print $0; next }
    /^\s*@description(\s+|$)/ { $1=""; gsub(/^\s+/, ""); print "## Description"; next }
    /^\s*@since(\s+|$)/  ||
    /^\s*@see(\s+|$)/    ||
    /^\s*@stdout(\s+|$)/ ||
    /^\s*@stderr(\s+|$)/ {
      if ($1 == "@since") { title="### Since" }
      else if ($1 == "@stdout") { title="### Stdout" }
      else if ($1 == "@stderr") { title="### Stderr" }
      else if ($1 == "@see")    { title="### See also" }
      print title; $1=""; gsub(/^\s+/, ""); if ($0 != "") { print "- "$0; }; next
    }
    ! exitCodeFlag && /^\s*@exitcode\s+/ { exitCodeFlag=1; print "### Exit codes" }
    exitCodeFlag && /^\s*@exitcode\s+/ {
      $1=""; gsub(/^\s+/, "");
      if ($0 != "") {
        printf "* **"$1"**: ";
        $1=""; gsub(/^\s+/, "");
        print $0;
      }
      next
    }
    /^\s*@apashPackage\s*$/ { print "### Package\n<!-- apash.packageBegin -->\n<!-- apash.packageEnd -->"; next}
    /^\s*@apashSummaryTable\s*$/ { print "### Method Summary\n<!-- apash.summaryTableBegin -->\n<!-- apash.summaryTableEnd -->"; next}
    { print $0; exitCodeFlag=0  }
  ')"
  echo "$comments"
  return "$APASH_FUNCTION_FAILURE"
}
