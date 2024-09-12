#!/usr/bin/env bats

# TODO: CANNOT USE IT FOR THE MOMENT DUE TO BATS (Not accepting paramete extensions)

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.remove

# remove ######################################
@test "remove returns an empty string when the input string is empty " {
  StringUtils.remove "" ""
  [ "$output" == ""  ]

  StringUtils.remove "" ":"
  [ "$output" == ""  ]
}

@test "remove returns the full string if the substring to remove is empty " {
  StringUtils.remove "queued" ""
  [ "$output" == "queued"  ]
  
  StringUtils.remove $'ab:cd:\nef' ""
  [ "$output"  == $'ab:cd:\nef'  ]
}

@test "remove returns the string without occurence of the substring to remove " {
  StringUtils.remove "ab:cd:ef" ":"
  [ "$output" == "abcdef" ]

  StringUtils.remove "abab::cd:ab:ef::ab" "ab"
  [ "$output" == "::cd::ef::" ]

  StringUtils.remove $'ab: cd:\nef gh:\nij ' $'\n'
  [ "$output" == "ab: cd:ef gh:ij " ]

  StringUtils.remove "queued" "ue"
  [ "$output" == "qd" ]

  StringUtils.remove "/path/to/delete" "to/"
  [ "$output" == "/path/delete" ]

  StringUtils.remove "((var(to)delete)" "(to"
  [ "$output" == "((var)delete)" ]
}

@test "remove returns the orginal string if no occurence of the substring occurs" {
  StringUtils.remove "queued" "zz"
  [ "$output" == "queued" ]

  StringUtils.remove "queued" "queued_"
  [ "$output" == "queued" ]

  StringUtils.remove $'que\nued' "queued"
  [ "$output" == $'que\nued' ]
}
