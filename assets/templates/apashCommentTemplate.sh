#!/usr/bin/env bash

# File description ###########################################################
# @name <Package>.<Method>
# @brief <Brief Description>
# @description
#   <More details and note about the feature>
#
# ### Since:
# <The current version: 0.1.0>
#
# ### ChangeLogs:
# - <version 0.2.0>: <Single modification>
#   - <Modification 1>
#   - <Modification 2>
#
# ### Authors:
# * <Authors>
#
# ### Parents
# <!-- apash.parentBegin -->
# <!-- apash.parentEnd -->
#
# Method description #########################################################
# @description
# #### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | <varName>      | string        | in       |            | <Description  of the variable.>       |
#
# #### Example
# ```bash
#    ArrayUtils.add  "myArray"              # failure
#    ArrayUtils.add  "myArray"  "a"         # ("a")
#    ArrayUtils.add  "myArray"  "b"         # ("a" "b")
#    ArrayUtils.add  "myArray"  ""          # ("a" "b" "")
#    ArrayUtils.add  "myArray"  "foo bar"   # ("a" "b" "" "foo bar")
#    ArrayUtils.add  "myArray"  "c" "d"     # failure
# ```
#
# @stdout Put a dot at the end of the comments.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
