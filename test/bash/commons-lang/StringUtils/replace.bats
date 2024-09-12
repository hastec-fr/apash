#!/usr/bin/env bats

# TODO: CANNOT USE IT FOR THE MOMENT DUE TO BATS (Not accepting paramete extensions)

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.replace

# remove ######################################
@test "replace returns an empty string when the input string is empty " {
  StringUtils.replace "" "" ""
  [ "$output" == ""  ]

  StringUtils.replace "" "a" "d"
  [ "$output" == ""  ]
}

@test "replace returns the full string if the substring to remove is empty " {
  StringUtils.replace "any" "" "d"
  [ "$output" == "any"  ]
  
  StringUtils.replace $'ab:cd:\nef' "" "z"
  [ "$output"  == $'ab:cd:\nef'  ]
}

@test "replace returns the string without occurence of the substring if replacement is empty " {
  StringUtils.replace "ab:cd:ef" ":" ""
  [ "$output" == "abcdef" ]

  StringUtils.replace "abab::cd:ab:ef::ab" "ab" ""
  [ "$output" == "::cd::ef::" ]

  StringUtils.replace $'ab: cd:\nef gh:\nij ' $'\n' ""
  [ "$output" == "ab: cd:ef gh:ij " ]

  StringUtils.replace "queued" "ue" ""
  [ "$output" == "qd" ]

  StringUtils.replace "/path/to/delete" "to/" ""
  [ "$output" == "/path/delete" ]

  StringUtils.replace "((var(to)delete)" "(to" ""
  [ "$output" == "((var)delete)" ]

  StringUtils.replace "aba" "a" ""
  [ "$output" == "b" ]
}

@test "replace returns the orginal string if no occurence of the substring occurs" {
  StringUtils.replace "aba"  "z"   "x"
  [ "$output" == "aba" ]
}

@test "replace returns the string with any replacements processed" {
  StringUtils.replace "aba"  "a"   "z"
  [ "$output" == "zbz" ]

  StringUtils.replace $'abc\ndef\nfgh'  "e"   "x"
  [ "$output" == $'abc\ndxf\nfgh' ]

  StringUtils.replace "/path/to/replace" "to/" "xz/"
  [ "$output" == "/path/xz/replace" ]

    StringUtils.replace "(var(to) to replace)" "(to)" "(is)"
  [ "$output" == "(var(is) to replace)" ]
}