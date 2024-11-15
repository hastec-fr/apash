#!/usr/bin/env bash
# shellcheck disable=SC2034

##/
# <!-- @class -->
# @name ArrayUtils
# @brief Operations on arrays.
# @description
#   This implementation do reference to the [java apache implementation](https://commons.apache.org/proper/commons-lang/javadocs/api-release/index.html)
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ### WARNING
# Contrary to Java implementation, methods are generally modifying directly the input array given by reference.
#
# ## Interface
# @apashPackage
# 
# @apashSummaryTable
#/
ArrayUtils_INDEX_NOT_FOUND="-1"
ArrayUtils_EMPTY_ARRAY=()
