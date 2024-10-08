#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.remove
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "remove returns an empty string when the input string is empty " {
  run StringUtils.remove "" ""
  [ "$output" == ""  ]

  run StringUtils.remove "" ":"
  [ "$output" == ""  ]
}

@test "remove returns the full string if the substring to remove is empty " {
  run StringUtils.remove "queued" ""
  [ "$output" == "queued"  ]
  
  run StringUtils.remove $'ab:cd:\nef' ""
  [ "$output"  == $'ab:cd:\nef'  ]
}

@test "remove returns the string without occurence of the substring to remove " {
  run StringUtils.remove "ab:cd:ef" ":"
  [ "$output" == "abcdef" ]

  run StringUtils.remove "abab::cd:ab:ef::ab" "ab"
  [ "$output" == "::cd::ef::" ]

  run StringUtils.remove $'ab: cd:\nef gh:\nij ' $'\n'
  [ "$output" == "ab: cd:ef gh:ij " ]

  run StringUtils.remove "queued" "ue"
  [ "$output" == "qd" ]

  run StringUtils.remove "/path/to/delete" "to/"
  [ "$output" == "/path/delete" ]

  run StringUtils.remove "((var(to)delete)" "(to"
  [ "$output" == "((var)delete)" ]
}

@test "remove returns the orginal string if no occurence of the substring occurs" {
  run StringUtils.remove "queued" "zz"
  [ "$output" == "queued" ]

  run StringUtils.remove "queued" "queued_"
  [ "$output" == "queued" ]

  run StringUtils.remove $'que\nued' "queued"
  [ "$output" == $'que\nued' ]
}
