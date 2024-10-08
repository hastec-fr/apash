#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.upperCase
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

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
