#!/usr/bin/env bash

# Dependencies #################################################################
# apash.import fr.hastec.apash.util.Log

# File description ###########################################################
# @name <Package>.<Method>
# @brief <Brief Description>
# @description
#   <More details and note about the feature>
#
# ## History
#  @since <The current version: 0.1.0> (authors,)
#
# ### ChangeLogs:
# * <version 0.2.0> (authors,): <Single modification>
#   * <Modification 1>
#   * <Modification 2>
#
# ## Interface
# @apashPackage
#
# ### Arguments
# | #      | varName        | Type          | in/out   | Default    | Description                           |
# |--------|----------------|---------------|----------|------------|---------------------------------------|
# | $1     | <varName>      | string        | in       |            | <Description  of the variable.>       |
#
# ### Example
# ```bash
#    <Package>.<method>  "arg1"             # failure
#    <Package>.<method>  "arg1" "args2"     # "Scalar result"
#    <Package>.<method>  "arg1" "args2"     # ("Array result")
#    <Package>.<method>  "arg1" "args2"     # {"Map result"}
#    <Package>.<method>  "arg1" "args2"     # myVar1="myVal1", myVar2="myVal2"(multi outputs).
# ```
#
# @stdout Put a dot at the end of the comments.
# @stderr None.
#
# @exitcode 0 When result is displayed.
# @exitcode 1 Otherwise.
#/
Package.method() { true; }
