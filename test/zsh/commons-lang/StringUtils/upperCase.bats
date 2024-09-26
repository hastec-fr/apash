#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/$APASH_SHELL/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.upperCase

# leftPad #####################################
@test "upperCase returns an empty string when input string is empty " {
  run StringUtils.upperCase "" "" ""
  [ "$output" == ""  ]  
}

@test "upperCase convert string to upper case" {
  run StringUtils.upperCase "abc"
  [ "$output" == "ABC"  ]
  
  run StringUtils.upperCase "aBc"
  [ "$output" == "ABC"  ]

  run StringUtils.upperCase "a123b"
  [ "$output" == "A123B"  ]

  run StringUtils.upperCase "ABC"
  [ "$output" == "ABC"  ]

  run StringUtils.upperCase "crème brûlée"
  [ "$output" == "CRÈME BRÛLÉE" ]
}
