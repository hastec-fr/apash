#!/usr/bin/env bash

# Dependencies #################################################################
apash.import fr.hastec.apash.util.Log

##/
# @name StringUtils.isAnyEmpty
# @brief Checks if one of the input string is empty ("").
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | ${@:1} | inStrings      | string...     | in       |            | The strings to check.                 |
#
# ### Example
# ```bash
#    StringUtils.isAnyEmpty                  # true
#    StringUtils.isAnyEmpty ""               # true
#    StringUtils.isAnyEmpty "     "          # false
#    StringUtils.isAnyEmpty "Hello"          # false
#    StringUtils.isAnyEmpty ""        "foo"  # true
#    StringUtils.isAnyEmpty "bob"     ""     # true
#    StringUtils.isAnyEmpty "  bob  " ""     # true
#    StringUtils.isAnyEmpty " "       "bar"  # false
#    StringUtils.isAnyEmpty "foo"     "bar"  # false
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 If at least one element is empty, or no element provided.
# @exitcode 1 If all arguments are not empty.
#/
StringUtils.isAnyEmpty() {
  Log.in $LINENO "$@"
  # Return succes if no argument
  [ $# -eq 0 ] &&  { Log.out $LINENO; return "$APASH_SUCCESS"; }

  # For each argument, determine if it's an array and if an element is empty
  for s in "$@"; do
    [[ -z $s ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
  done
  Log.out $LINENO; return "$APASH_FAILURE"
}
