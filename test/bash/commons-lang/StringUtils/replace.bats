#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.replace
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.replace returns an empty string when the input string is empty " {
  run StringUtils.replace "" "" ""
  [ "$output" == ""  ]

  run StringUtils.replace "" "a" "d"
  [ "$output" == ""  ]
}

@test "StringUtils.replace returns the full string if the substring to remove is empty " {
  run StringUtils.replace "any" "" "d"
  [ "$output" == "any"  ]
  
  run StringUtils.replace $'ab:cd:\nef' "" "z"
  [ "$output"  == $'ab:cd:\nef'  ]
}

@test "StringUtils.replace returns the string without occurence of the substring if replacement is empty " {
  run StringUtils.replace "ab:cd:ef" ":" ""
  [ "$output" == "abcdef" ]

  run StringUtils.replace "abab::cd:ab:ef::ab" "ab" ""
  [ "$output" == "::cd::ef::" ]

  run StringUtils.replace $'ab: cd:\nef gh:\nij ' $'\n' ""
  [ "$output" == "ab: cd:ef gh:ij " ]

  run StringUtils.replace "queued" "ue" ""
  [ "$output" == "qd" ]

  run StringUtils.replace "/path/to/delete" "to/" ""
  [ "$output" == "/path/delete" ]

  run StringUtils.replace "((var(to)delete)" "(to" ""
  [ "$output" == "((var)delete)" ]

  run StringUtils.replace "aba" "a" ""
  [ "$output" == "b" ]
}

@test "StringUtils.replace returns the orginal string if no occurence of the substring occurs" {
  run StringUtils.replace "aba"  "z"   "x"
  [ "$output" == "aba" ]
}

@test "StringUtils.replace returns the string with any replacements processed" {
  run StringUtils.replace "aba"  "a"   "z"
  [ "$output" == "zbz" ]

  run StringUtils.replace $'abc\ndef\nfgh'  "e"   "x"
  [ "$output" == $'abc\ndxf\nfgh' ]

  run StringUtils.replace "/path/to/replace" "to/" "xz/"
  [ "$output" == "/path/xz/replace" ]

  run StringUtils.replace "(var(to) to replace)" "(to)" "(is)"
  [ "$output" == "(var(is) to replace)" ]
}