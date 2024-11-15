#!/usr/bin/env bash

##/
# <!-- @class -->
# @name MapUtils
# @brief Operations on maps.
# @description
#   This implementation do reference to the [java apache implementation](https://commons.apache.org/proper/commons-collections/apidocs/org/apache/commons/collections4/MapUtils.html)<br/>
#   ⚠️WARNING: Contrary to Java implementation, apash methods are modifying directly the input map given by reference.
#
# ## History
# @since 0.1.0 (hastec-fr)
#
# ## Interface
# @apashPackage
# 
# @apashSummaryTable
#/
declare -A MaptUtils_EMPTY_MAP=()
commons-lang.MapUtils() { true; }
