#!/usr/bin/env bash

##/
# <!-- @class -->
# @name VersionUtils
# @brief Operations on string version.
# @description
#   It considers that versions have part which could be alphanumeric or numeric.
#   Each part is separated by a dot "." or a dash "-".
#   If it's numeric, the comparison would be numeric, otherwise it's a dictionary comparison.
#
# ## History
# @since 0.2.0 (hastec-fr)
#
# ## Interface
# @apashPackage
#
# @apashSummaryTable
#/
commons-lang.VersionUtils() { true; }
