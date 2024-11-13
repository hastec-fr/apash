#!/usr/bin/env bash

# Dependencies #####################################
apash.import fr.hastec.apash.util.Log.entry
apash.import fr.hastec.apash.util.Log.exception
apash.import fr.hastec.apash.util.Log.exit

##/
# @name ApashUtils.doc
# @brief Generate a Markdown file according to comments of the input file.
# @description
#   Markdown is generated according to comment sections between tags: "##/" and "#/".<br/>
#   For multi lines, all # in the middle will be considered in the current documentation.
#   ```bash
#   ##/
#   #  My first comment line
#   #  My second comment line
#   #/
#   ```
#
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
# | $1 | inFile         | string        | in       |            | Path of the file to analyze.         |
#
# ### Example
# ```bash
#    ApashUtils.doc  "myFile"    # Display the markdown section to the standard output.
# ```
#
# @stdout The markdown content of the input file.
# @stderr None.
#
# @exitcode 0 When markdown is displayed.
# @exitcode 1 When the file does not exists.
#/
ApashUtils.doc() {
  Log.entry "$LINENO" "$@"

  local inFile="$1"
  local comments=""

  [ ! -r "$inFile" ] && { Log.exception "$LINENO" "ApashUtils.doc-001" "InvalidFilePath"; return "$APASH_FUNCTION_FAILURE"; }

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
      print title; $1=""; gsub(/^\s+/, ""); if ($0 != "") { print "  * "$0; }; next
    }

    # @exitcode flag must be successive or only the title is displayed.
    ! exitCodeFlag && /^\s*@exitcode\s+/ { exitCodeFlag=1; print "### Exit codes" }
    exitCodeFlag && /^\s*@exitcode\s+/ {
      $1=""; gsub(/^\s+/, "");
      if ($0 != "") {
        printf "  * **"$1"**: ";
        $1=""; gsub(/^\s+/, "");
        print $0;
      }
      next
    }

    # Custom Apash tags injected in the documentation (.md) and resolved by apash.doc as placeHolders.
    /^\s*@apashPackage\s*$/      { print "### Package\n<!-- apash.packageBegin -->\n<!-- apash.packageEnd -->"; next}
    /^\s*@apashSummaryTable\s*$/ { print "### Method Summary\n<!-- apash.summaryTableBegin -->\n<!-- apash.summaryTableEnd -->"; next}
    { print $0; exitCodeFlag=0  }
  ')" || { Log.exception "$LINENO" "ApashUtils.doc-002"; return "$APASH_FUNCTION_FAILURE"; }
  
  echo "$comments" && { Log.exit "$LINENO" "ApashUtils.doc-003"; return "$APASH_FUNCTION_SUCCESS"; }
  Log.exit "$LINENO" "ApashUtils.doc-004"; return "$APASH_FUNCTION_FAILURE"
}
