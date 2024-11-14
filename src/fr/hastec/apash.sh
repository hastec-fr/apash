#!/usr/bin/env bash

# <!-- @package -->
# @name apash
# @brief Translation for shell scripts of some apache libraries.
# @description
#     Provides highly reusable utility methods.
#
# ### Since:
# 0.1.0
#
# ### Parents
# [Main page](../../../../README.md)
#
# ### Method Summary
# <!-- apash.summaryTableBegin -->
# | Methods                  | Brief                                 |
# |--------------------------|---------------------------------------|
# |[commons-lang](apash/commons-lang.md)|Provides highly reusable utility methods.|
# |[lang](apash/lang.md)|Provides methods that are fundamental to the design script. |
# |[util](apash/util.md)|Provides miscellaneous utility.|
# <!-- apash.summaryTableEnd -->

# Declaration of global variables
export APASH_FUNCTION_SUCCESS=0
export APASH_FUNCTION_FAILURE=1

export APASH_ARRAY_FIRST_INDEX=0
export APASH_ARRAY_LAST_INDEX=9223372036854775807

# Zsh start index at 1 and truncate values after 18 digits
if [ "$APASH_SHELL" = "zsh" ]; then
  [[ ! $(setopt) == *ksharrays* ]] && APASH_ARRAY_FIRST_INDEX=1
  APASH_ARRAY_LAST_INDEX=999999999999999999
fi

source "$APASH_HOME_DIR/src/fr/hastec/apash.import"
