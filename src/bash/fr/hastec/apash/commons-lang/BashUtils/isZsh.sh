#!/usr/bin/env bash

# File description ###########################################################
# @name BashUtils.isCommandValid
# @brief Determine if current APASH_SHELL is zsh
# @description
#
# ### Since:
# 0.2.0
#
# ### Authors:
# * Benjamin VARGIN
#
# ### Parents
# <!-- apash.parentBegin -->
# [](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
# <!-- apash.parentEnd -->

# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | commandName    | string        | in       |            | Command to analyse                    |
#
# #### Example
# ```bash
#    # From bash
#    BashUtils.isZsh  ""                # false
#
#    # From zsh
#    BashUtils.isZsh  ""                # true
# ```
#
# @stdout None.
# @stderr None.
#
# @exitcode 0 When the command name is correct.
# @exitcode 1 Otherwise.
BashUtils.isZsh() {
  [[ "$APASH_SHELL" == "zsh" ]] && retun "$APASH_FUNCTION_SUCCESS" || return "$APASH_FUNCTION_FAILURE"
}
